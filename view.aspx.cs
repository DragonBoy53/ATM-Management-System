using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace atm_project
{
    public partial class view : System.Web.UI.Page
    {

        string connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void view_Click(object sender, EventArgs e)
        {

        }
    }
}
