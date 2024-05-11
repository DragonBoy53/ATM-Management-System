using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace atm_project
{
    public partial class manaddition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
        private bool ManagerIDExist(string name, string accno, string pin)
        {
            string query = "SELECT * FROM [Manager] where account_no = @accno ";
            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@accno", accno);
                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null)
                    {
                        return false;
                    }
                    else
                    {
                        string addQuery = "DECLARE @newmanagerID INT; SET @newmanagerID = (SELECT ISNULL(MAX(managerID), 0) + 1 FROM Manager);" + "insert into  [Manager] (managerID,manager_name, account_no, PINcode) values(@newmanagerID, @name, @accno, @pin)";

                        using (SqlCommand addCommand = new SqlCommand(addQuery, connection))
                        {
                            addCommand.Parameters.AddWithValue("@name", name);
                            addCommand.Parameters.AddWithValue("@accno", accno);
                            addCommand.Parameters.AddWithValue("@pin", pin);
                            addCommand.ExecuteNonQuery();
                        }
                        return true;
                    }
                }
            }
        }
        protected void confirmadd(object sender, EventArgs e)
        {

            bool flag = ManagerIDExist(username.Text, accno.Text, pin.Text);
            if (flag)
            {
                Msg.Text = "Manager has been added successfully";
            }
            else
            {
                Msg.Text = "Manager cannot be added";
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
        protected void adminhome_Click(object sender, EventArgs e)
        {
            string adminID = Request.QueryString["adminID"].ToString();
            if (adminID != null)
            {
                Response.Redirect("admin.aspx?adminID=" + adminID);
            }
        }
    }
}