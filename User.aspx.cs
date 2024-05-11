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
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;

            if (Request.QueryString["userID"] != null)
            {
                string query = "SELECT client_name FROM [client_details] WHERE  userID = @userID";

                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@userID", Request.QueryString["userID"].ToString());
                        connection.Open();
                        var result = command.ExecuteScalar();

                        if (result != null)
                        {
                            name.Text = result.ToString();
                        }
                        else
                        {
                            // Handle the case where managerID is not found
                            Response.Redirect("login.aspx");
                        }
                    }
                }
            }
            else
            {
                // Redirect if managerID is not provided in the query string
                Response.Redirect("login.aspx");
            }

        }

    }
}