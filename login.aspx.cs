using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

struct det
{
    public int attempts;
    public char User;
    public string ID;
};

namespace ATMModel
{
    public partial class login : System.Web.UI.Page
    {
        public static string userID;

        String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
        private det VerifyCredentials(string accountno, string pin)
        {
            string query = "SELECT userID FROM [Client_details] WHERE account_no = @AccountNo AND PINcode = @PIN";
            det temp=new det();
            temp.User = 'N';
            
            temp.attempts=getAttempts(accountno, "Client_details");
            if(temp.attempts<3)
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@AccountNo", accountno);
                        command.Parameters.AddWithValue("@PIN", pin);

                        connection.Open();
                        var result = command.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            Session["user_accno"] = accountno;
                            temp.ID= result.ToString();
                            temp.User= 'U';
                            resetAttempts(accountno, "Admin");
                            return temp;
                        }
                        else if(result ==null)
                        {
                            attemptsincrement(accountno, "Client_details", temp.attempts);
                        }
                    }
                }
            }
            query = "SELECT managerID FROM [Manager] WHERE account_no = @AccountNo AND PINcode = @PIN";

            temp.attempts = getAttempts(accountno, "Manager");
            if (temp.attempts < 3)
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@AccountNo", accountno);
                        command.Parameters.AddWithValue("@PIN", pin);

                        connection.Open();
                        var result = command.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            temp.ID = result.ToString();
                            temp.User = 'M';
                            resetAttempts(accountno, "Manager");
                            return temp;
                        }
                        else if (result == null)
                        {
                            attemptsincrement(accountno, "Manager", temp.attempts);
                        }
                    }
                }
            }

            query = "SELECT adminID FROM [Admin] WHERE account_no = @AccountNo AND PINcode = @PIN";

            temp.attempts = getAttempts(accountno, "Admin");
            if(temp.attempts < 3)
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@AccountNo", accountno);
                        command.Parameters.AddWithValue("@PIN", pin);

                        connection.Open();
                        var result = command.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            temp.ID = result.ToString();
                            temp.User = 'A';
                            resetAttempts(accountno, "Admin");
                            return temp;
                        }
                        else if (result == null)
                        {
                            attemptsincrement(accountno, "Admin", temp.attempts);
                        }
                    }
                }
            }
            return temp;
        }
        private int getAttempts(string accountno,string table)
        {
            if (accountno != null)
            {
                int attempts = 0;
                string query = "SELECT attempts FROM ["+table+"] WHERE account_no = @AccountNo";

                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@AccountNo", accountno); // Fix: Added @ in parameter name
                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                attempts = Convert.ToInt32(reader["attempts"]);
                            }
                        }
                    }
                }

                return attempts; // Fix: Added return statement
            }

            return 0; // Fix: Added default return value in case accountno is null
        }
        private void attemptsincrement(string accountno, string table,int attempts)
        {
            if (attempts < 3)
            {
                attempts++;
                string query = "UPDATE ["+ table +"] SET attempts=@Attempts WHERE account_no=@AccountNo";
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@AccountNo", accountno);
                        command.Parameters.AddWithValue("@Attempts", attempts);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
            }
        }
        private int resetAttempts(string accountno, string table)
        {
            if (accountno != null)
            {
                int attempts = 0;
                string query = "update [" + table + "] set attempts=0 WHERE account_no = @AccountNo";

                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@AccountNo", accountno); // Fix: Added @ in parameter name
                        connection.Open();
                        command.ExecuteScalar();
                    }
                }

                return attempts; // Fix: Added return statement
            }

            return 0; // Fix: Added default return value in case accountno is null
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get username and password from controls
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            det obj;

            // Verify credentials
            obj = VerifyCredentials(username, password);

            // Redirect based on user type or show error message
            switch (obj.User)
            {   
                case 'A':
                    Response.Redirect("admin.aspx?adminID=" + obj.ID);
                    break;
                case 'U':
                    Response.Redirect("User.aspx?userID=" + obj.ID);
                    break;
                case 'M':
                    Response.Redirect("manager.aspx?managerID=" + obj.ID);
                    break;
                default:
                    if(obj.attempts<2)
                    {
                        Msg.Text = "Incorrect username or password.";
                    }
                    else
                    {
                        Msg.Text = "Account Blocked";
                    }
                    break;
            }
        }
    }
}
