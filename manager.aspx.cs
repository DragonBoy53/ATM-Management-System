using System;
using System.Web.UI;

namespace ATMModel
{
    public partial class manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            if (!IsPostBack)
            {
                // Check if managerID is present in the query string
                if (!string.IsNullOrEmpty(Request.QueryString["managerID"]))
                {
                    // Redirect to CheckBalance.aspx with managerID
                    Response.Redirect("CheckBalance.aspx?managerID="+Request.QueryString["managerID"]);
                }
                else
                {
                    // Handle missing managerID in the query string
                    // Redirect or show an error message as needed
                }
            }
        }

        protected void AtmStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Save the selected value to the session
            Session["AtmStatus"] = AtmStatus.SelectedValue;
        }
    }
}
