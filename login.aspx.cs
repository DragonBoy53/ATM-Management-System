using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace ATMModel
{
    public partial class login : System.Web.UI.Page
    {
        public static string username;

        String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
        private char VerifyCredentials(string accountno, string pin)
        {
            string query = "SELECT client_name FROM [Client_details] WHERE account_no = @AccountNo AND PINcode = @PIN";
            char userType = 'N';

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
                        username = result.ToString();
                        Response.Redirect("User.aspx?username=" + username);
                        userType = 'U';

                    }
                }
            }
            query = "SELECT manager_name FROM [Manager] WHERE account_no = @AccountNo AND PINcode = @PIN";

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
                        username = result.ToString();
                        Response.Redirect("manager.aspx?username=" + username);
                        userType = 'M';

                    }
                }

            }

            query = "SELECT admin_name FROM [Admin] WHERE account_no = @AccountNo AND PINcode = @PIN";

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
                        username = result.ToString();
                        userType = 'A';
                        Response.Redirect("admin.aspx?username=" + username);
                    }
                }
            }
            return userType;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get username and password from controls
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Verify credentials
            char userType = VerifyCredentials(username, password);

            // Redirect based on user type or show error message
            switch (userType)
            {   
                case 'A':
                    Response.Redirect("admin.aspx");
                    break;
                case 'U':
                    Response.Redirect("user.aspx");
                    break;
                case 'M':
                    Response.Redirect("manager.aspx");
                    break;
                default:
                    Msg.Text = "Incorrect username or password.";
                    break;
            }
        }
    }
}
