using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ATM_Machine
{
    public partial class client_withdraw : System.Web.UI.Page
    {
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
        //Function to manage transactions
        public int add_user_transaction(string user_accno, string transferee_accno, long amount, string transtype)
        {
            int trans_status = 0;
            //Open Connection
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            try
            {
                //Create SQL command
                SqlCommand cmd = new SqlCommand("Add_Transaction", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //Add Parameters
                cmd.Parameters.Add("@user_accno", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@transferee_accno", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@amount", SqlDbType.BigInt);
                cmd.Parameters.Add("@transtype", SqlDbType.VarChar, 100);
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
                //Close connection
                conn.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }
            return trans_status;
        }

        //Function to fetch the user's balance
        public long getUserBalance(string user_accno)
        {
            long balance = 0;
            //Open Connection
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            try
            {
                //Create SQL command
                SqlCommand cmd = new SqlCommand("SELECT balance FROM client_details WHERE account_no=@acc_no", conn);
                //Add Parameters
                cmd.Parameters.Add("@acc_no", SqlDbType.VarChar, 100);
                //Initialise parameters
                cmd.Parameters["@acc_no"].Value = user_accno;
                //Execute command
                balance = (long)cmd.ExecuteScalar();
                //Close connection
                conn.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }
            return balance;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AtmStatus"] != null)
            {
                if (Session["AtmStatus"].ToString() == "Out of Service")
                    Response.Redirect("out_of_service");

            }
            if (!IsPostBack)
            {
                DisplayCurrBalance();
            }
        }

        protected void Withdraw_Button_Click(object sender, EventArgs e)
        {
            long amount = Convert.ToInt64(w_textbox.Text);
            string user_acc_no = "";
            if (Session["user_accno"] != null)
            {
                user_acc_no = Session["user_accno"].ToString();
            }
            int trans_status = add_user_transaction(user_acc_no, "N/A", amount, "Withdraw");
            if (trans_status == 1)
            {
                w_status.InnerHtml = Convert.ToString("Transaction successful.");
                DisplayCurrBalance();
            }
            else if (trans_status == 0)
            {
                w_status.InnerHtml = Convert.ToString("Low Balance! Transaction Failed.");
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
