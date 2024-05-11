using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ATM_Machine
{
    public partial class client_transfer : System.Web.UI.Page
    {
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;

        //Function to manage transactions
        public int add_user_transaction(string user_accno, string transferee_accno, long amount, string transtype)
        {
            int trans_status = 0;
            //Open Connection
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                try
                {
                    //Create SQL command
                    using (SqlCommand cmd = new SqlCommand("Add_Transaction", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //Add Parameters
                        cmd.Parameters.Add("@user_accno", SqlDbType.VarChar, 100).Value = user_accno;
                        cmd.Parameters.Add("@transferee_accno", SqlDbType.VarChar, 100).Value = transferee_accno;
                        cmd.Parameters.Add("@amount", SqlDbType.BigInt).Value = amount;
                        cmd.Parameters.Add("@transtype", SqlDbType.VarChar, 100).Value = transtype;
                        cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                        //Initialise parameters
                        cmd.Parameters["@user_accno"].Value = user_accno;
                        cmd.Parameters["@transferee_accno"].Value = transferee_accno;
                        cmd.Parameters["@amount"].Value = amount;
                        cmd.Parameters["@transtype"].Value = transtype;
                        //Execute command
                        cmd.ExecuteNonQuery();
                        //Read output value
                        trans_status = Convert.ToInt32(cmd.Parameters["@flag"].Value);
                    }
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("SQL Error" + ex.Message.ToString());
                }

                finally
                {
                    conn.Close();
                }
            }
            return trans_status;
        }

        //Function to fetch the user's balance
        public long getUserBalance(string user_accno)
        {
            long balance = 0;
            //Open Connection
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                try
                {
                    //Create SQL command
                    SqlCommand cmd = new SqlCommand("SELECT balance FROM client_details WHERE account_no=@acc_no", conn);
                    //Add Parameters
                    cmd.Parameters.Add("@acc_no", SqlDbType.VarChar, 100);
                    //Initialise parameters
                    cmd.Parameters["@acc_no"].Value = user_accno;         //Execute command
                    balance = (long)cmd.ExecuteScalar();
                    
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("SQL Error" + ex.Message.ToString());
                }
                finally
                {
                    conn.Close();
                }
            }
            return balance;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AtmStatus"] != null && Session["AtmStatus"].ToString() == "Out of Service")
            {
                Response.Redirect("out_of_service");
            }
            if (!IsPostBack)
            {
                DisplayCurrBalance();
            }
        }

        protected void Transfer_Button_Click(object sender, EventArgs e)
        {
            long amount = Convert.ToInt64(t_textbox.Text);
            string transferee_acc_no = transferee_accno.Text;
            string user_acc_no = "";
            if (Session["user_accno"] != null)
            {
                user_acc_no = Session["user_accno"].ToString();
            }
            int trans_status = add_user_transaction(user_acc_no, transferee_acc_no, amount, "Transfer");
            if (trans_status == 1)
            {
                t_status.InnerHtml = "Transaction successful.";
                DisplayCurrBalance();
            }
            else if (trans_status == 0)
            {
                t_status.InnerHtml = "Low Balance! Transaction Failed.";
            }
        }

        public void DisplayCurrBalance()
        {
            string user_acc_no = "";
            if (Session["user_accno"] != null)
            {
                user_acc_no = Session["user_accno"].ToString();
                long balance = getUserBalance(user_acc_no);
                curr_balance.InnerHtml = balance.ToString();
            }
        }
    }
}
