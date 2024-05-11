using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace atm_project
{
    public partial class manview : System.Web.UI.Page
    {

        string connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void view_Click(object sender, EventArgs e)
        {

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