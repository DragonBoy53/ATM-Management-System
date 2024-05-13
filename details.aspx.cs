using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class admin_details : System.Web.UI.Page
{
        String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            Label1.Text = Session["adminID"].ToString();
                string userId = Request.QueryString["userId"];
                if (!string.IsNullOrEmpty(userId))
                {
                    DisplayUserDetails(userId);
                }
            }
        }

        private void DisplayUserDetails(string userId)
        {
            string query = "SELECT userID,client_name, account_no, PINcode, balance, attempts,contact_no FROM [Client_details] WHERE userID = @userID";

            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@userID", userId);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        lblUsername.Text = "Username: " + reader["client_name"].ToString();
                        lblAccountNo.Text = "Account Number: " + reader["account_no"].ToString();
                        lblPinCode.Text = "PIN Code: " + reader["PINcode"].ToString();
                        lblBalance.Text = "Balance: " + reader["balance"].ToString();
                        lblcontactno.Text = "Contact: " + reader["contact_no"].ToString();
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
    protected void viewuser_Click(object sender, EventArgs e)
    {
        string adminID = Session["adminID"].ToString();
        if (adminID != null)
        {
            Response.Redirect("view.aspx?adminID=" + adminID);
        }
    }

    protected void adduser_Click(object sender, EventArgs e)
    {
        string adminID = Session["adminID"].ToString();
        if (adminID != null)
        {
            Response.Redirect("addition.aspx?adminID=" + adminID);
        }
    }

    protected void removal_Click(object sender, EventArgs e)
    {
        string adminID = Session["adminID"].ToString();
        if (adminID != null)
        {
            Response.Redirect("removal.aspx?adminID=" + adminID);
        }
    }

    protected void manview_Click(object sender, EventArgs e)
    {
        string adminID = Session["adminID"].ToString();
        if (adminID != null)
        {
            Response.Redirect("manview.aspx?adminID=" + adminID);
        }
    }

    protected void manaddition_Click(object sender, EventArgs e)
    {
        string adminID = Session["adminID"].ToString();
        if (adminID != null)
        {
            Response.Redirect("manaddition.aspx?adminID=" + adminID);
        }
    }

    protected void manremoval_Click(object sender, EventArgs e)
    {
        string adminID = Session["adminID"].ToString();
        if (adminID != null)
        {
            Response.Redirect("manremoval.aspx?adminID=" + adminID);
        }
    }
    protected void adminhome_Click(object sender, EventArgs e)
    {
        string adminID = Session["adminID"].ToString();
        if (adminID != null)
        {
            //before redirect run krta hai
            Response.Redirect("admin.aspx?adminID=" + adminID);
            //code after redirect does not run
        }
    }
}
