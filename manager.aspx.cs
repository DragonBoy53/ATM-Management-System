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
    public partial class manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;

            if (!IsPostBack)
            {
                if (Session["AtmStatus"] != null)
                {
                    AtmStatus.SelectedValue = Session["AtmStatus"].ToString();
                }

                if (Request.QueryString["username"] != null)
                {
                    string username = Request.QueryString["username"].ToString();
                    name.Text = username;
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }

        }

        protected void AtmStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Save the selected value to the session
            Session["AtmStatus"] = AtmStatus.SelectedValue;
        }

        protected void CheckB_Click(object sender, EventArgs e)
        {
            string managerName = name.Text;

            string connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
            string query = "SELECT managerID FROM [Manager] WHERE manager_name = @ManagerName";

            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ManagerName", managerName);

                    try
                    {
                        connection.Open();
                        var result = command.ExecuteScalar();

                        if (result != null && result != DBNull.Value)
                        {
                            int managerID = Convert.ToInt32(result);
                            Response.Redirect("CheckBalance.aspx?managerID=" + managerID);
                        }
                        else
                        {
                            // Set the error message
                            Message.Text = "Manager not found or invalid manager name.";
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception by setting an error message
                        Message.Text = "Error retrieving managerID: " + ex.Message;
                    }
                }
            }
        }


    }
}