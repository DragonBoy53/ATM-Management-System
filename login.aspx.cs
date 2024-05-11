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
        public static string userID;

        String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
        private char VerifyCredentials(string accountno, string pin)
        {
            string query = "SELECT userID FROM [Client_details] WHERE account_no = @AccountNo AND PINcode = @PIN";
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
                        userID = result.ToString();
                        Response.Redirect("User.aspx?userID=" + userID);
                        userType = 'U';

                    }
                }
            }
            query = "SELECT managerID FROM [Manager] WHERE account_no = @AccountNo AND PINcode = @PIN";

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
                        userID = result.ToString();
                        Response.Redirect("manager.aspx?managerID=" + userID);
                        userType = 'M';

                    }
                }

            }

            query = "SELECT adminID FROM [Admin] WHERE account_no = @AccountNo AND PINcode = @PIN";

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
                        userID = result.ToString();
                        userType = 'A';
                        Response.Redirect("admin.aspx?adminID=" + userID);
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
