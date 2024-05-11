using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace atm_project
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;

            if (Request.QueryString["adminID"] != null)
            {
                string query = "SELECT admin_name FROM [Admin] WHERE adminID = @adminID";

                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@adminID", Request.QueryString["adminID"].ToString());
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

        protected void viewuser_Click(object sender, EventArgs e)
        {
            string adminID = Request.QueryString["adminID"].ToString();
            if (adminID != null)
            {
                Response.Redirect("view.aspx?adminID=" + adminID);
            }
        }

        protected void adduser_Click(object sender, EventArgs e)
        {
            string adminID = Request.QueryString["adminID"].ToString();
            if (adminID != null)
            {
                Response.Redirect("addition.aspx?adminID=" + adminID);
            }
        }

        protected void removal_Click(object sender, EventArgs e)
        {
            string adminID = Request.QueryString["adminID"].ToString();
            if (adminID != null)
            {
                Response.Redirect("removal.aspx?adminID=" + adminID);
            }
        }

        protected void manview_Click(object sender, EventArgs e)
        {
            string adminID = Request.QueryString["adminID"].ToString();
            if (adminID != null)
            {
                Response.Redirect("manview.aspx?adminID=" + adminID);
            }
        }

        protected void manaddition_Click(object sender, EventArgs e)
        {
            string adminID = Request.QueryString["adminID"].ToString();
            if (adminID != null)
            {
                Response.Redirect("manaddition.aspx?adminID=" + adminID);
            }
        }

        protected void manremoval_Click(object sender, EventArgs e)
        {
            string adminID = Request.QueryString["adminID"].ToString();
            if (adminID != null)
            {
                Response.Redirect("manremoval.aspx?adminID=" + adminID);
            }
        }
    }
}