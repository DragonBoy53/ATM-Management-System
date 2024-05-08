using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_mandetails : System.Web.UI.Page
{
    String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string managerId = Request.QueryString["managerId"];
            if (!string.IsNullOrEmpty(managerId))
            {
                DisplayManagerDetails(managerId);
            }
        }
    }

    private void DisplayManagerDetails(string managerId)
    {
        string query = "SELECT managerID, manager_name, account_no, PINcode, attempts FROM [Manager] WHERE managerId = @managerId";

        using (SqlConnection connection = new SqlConnection(connString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("managerId", managerId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    lblUsername.Text = "Username: " + reader["manager_name"].ToString();
                    lblAccountNo.Text = "Account Number: " + reader["account_no"].ToString();
                    lblPinCode.Text = "PIN Code: " + reader["PINcode"].ToString();
                     if(Convert.ToInt32(reader["attempts"])==3)
                    {
                       lblStatus.Text = "Status: Blocked"  ;

                    }
                    else
                    {
                        lblStatus.Text = "Status: Active";
                    }
                    
                }
                reader.Close();
            }
        }
    }
}
