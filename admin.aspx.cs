using System;
using System.Collections.Generic;
using System.Configuration;
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

            if (!IsPostBack)
            {
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
    }
}