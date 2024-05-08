using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml.Linq;

namespace ATMModel
{
    public partial class manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;

            if (Request.QueryString["managerID"] != null)
            {
                string query = "SELECT manager_name FROM [Manager] WHERE managerID = @ManagerID";

                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@ManagerID", Request.QueryString["managerID"].ToString());
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

            // Check if this is a postback to restore the selected ATM status
            if (!IsPostBack && Session["AtmStatus"] != null)
            {
                AtmStatus.SelectedValue = Session["AtmStatus"].ToString();
            }
        }

        protected void AtmStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Save the selected value to the session
            Session["AtmStatus"] = AtmStatus.SelectedValue;
        }

        protected void CheckB_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("CheckBalance.aspx?managerID=" + Request.QueryString["managerID"].ToString());
            }
            catch (Exception ex)
            {
                // Handle the exception by setting an error message
                Message.Text = "Error retrieving managerID: " + ex.Message;
            }
        }

        protected void checkbalancebutton_Click(object sender, EventArgs e)
        {
            string managerID = Request.QueryString["managerID"].ToString();
            if (managerID != null)
            {
                Response.Redirect("CheckBalance.aspx?managerID=" + managerID);
            }
        }

        protected void atmstatus_Click(object sender, EventArgs e)
        {
            string managerID = Request.QueryString["managerID"].ToString();
            if (managerID != null)
            {
                Response.Redirect("manager.aspx?managerID=" + managerID);
            }
        }
    }
}
