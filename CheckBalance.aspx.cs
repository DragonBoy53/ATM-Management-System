using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace ATMModel
{
    public partial class CheckBalance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowBalance();
        }

        private void ShowBalance()
        {
            String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
            string query = "SELECT cash_available FROM [ATM_Cash] WHERE transtime=(select max(transtime) from [Atm_Cash]) ";
            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        balance.Text = result.ToString();

                    }
                }
            }
        }

        protected void ManagerDeposit(object sender, EventArgs e)
        {
            int id;
            string amountText = Amount.Text; // Assuming Amount is the TextBox for amount input
            if (!string.IsNullOrEmpty(amountText))
            {
                string connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
                string getmaxquery = "select max(transID) from [Transaction_history] ";
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(getmaxquery, connection))
                    {
                        connection.Open();
                        var result = command.ExecuteScalar();
                        id = (Convert.ToInt32(result));
                        id++;
                    }
                }


                long amount;

                if (long.TryParse(amountText, out amount))
                {
                    string insertTransQuery = "insert into [Transaction_history] values (@transID,@transdate,@total_amount,@status,@transType)";
                    using (SqlConnection connection = new SqlConnection(connString))
                    {
                        using (SqlCommand command = new SqlCommand(insertTransQuery, connection))
                        {
                            command.Parameters.AddWithValue("@transID", id);
                            command.Parameters.AddWithValue("@transdate", DateTime.Now);
                            command.Parameters.AddWithValue("@total_amount", amount);
                            command.Parameters.AddWithValue("@status", "Completed");
                            command.Parameters.AddWithValue("@transType", "Deposit");
                            connection.Open();
                            command.ExecuteNonQuery();

                        }
                    }
                    amountText = balance.Text;
                    long x;
                    long.TryParse(amountText, out x);
                    amount += x;
                    string insertQuery = "INSERT INTO ATM_cash (cash_available, transID, transtime) VALUES (@cash_available, @transid , @transtime)";

                    using (SqlConnection connection = new SqlConnection(connString))
                    {
                        using (SqlCommand command = new SqlCommand(insertQuery, connection))
                        {
                            command.Parameters.AddWithValue("@cash_available", amount); // Use the parsed amount value
                            command.Parameters.AddWithValue("@transid", id);
                            command.Parameters.AddWithValue("@transtime", DateTime.Now);

                            connection.Open();
                            command.ExecuteNonQuery();
                            Message.Text = "Successful";
                            ShowBalance(); // Update balance after successful insert
                        }
                    }
                    string Query = "INSERT INTO [Transferer] VALUES (@transid, NULL, @managerid)";
                    using (SqlConnection connection = new SqlConnection(connString))
                    {
                        using (SqlCommand command = new SqlCommand(Query, connection))
                        {
                            try
                            {
                                int managerID;
                                if (!string.IsNullOrEmpty(Request.QueryString["managerID"]) && int.TryParse(Request.QueryString["managerID"], out managerID))
                                {
                                    command.Parameters.AddWithValue("@transid", id);
                                    command.Parameters.AddWithValue("@managerid", managerID);

                                    connection.Open();
                                    command.ExecuteNonQuery();
                                    Message.Text = "Deposit made successfully.";
                                }
                                else
                                {
                                    Message.Text = "Invalid or missing managerID parameter.";
                                }
                            }
                            catch (Exception ex)
                            {
                                Message.Text = "Error adding entry to Transferer table: " + ex.Message;
                                // You can log the exception details or handle it as needed
                            }
                        }
                    }

                }
                else
                {
                    Message.Text = "Invalid Amount Entered";
                }
            }
            else
            {
                Message.Text = "Please enter an amount";
            }
        }



    }
}