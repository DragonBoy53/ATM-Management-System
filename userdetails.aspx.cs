using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Reflection.Emit;

public partial class userdetails : System.Web.UI.Page
{
    String connString = ConfigurationManager.ConnectionStrings["ATM_Machine"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
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
                    if (Convert.ToInt32(reader["attempts"]) == 3)
                    {
                        lblStatus.Text = "Status: Blocked";

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
    protected void Home_Click(object sender, EventArgs e)
    {
        string userID = Request.QueryString["userID"].ToString();
        if (userID != null)
        {
            Response.Redirect("user.aspx?userID=" + userID);
        }
    }

    protected void ViewAccountInfo_Click(object sender, EventArgs e)
    {
        string userID = Request.QueryString["userID"].ToString();
        if (userID != null)
        {
            Response.Redirect("userdetails.aspx?userID=" + userID);
        }
    }

    protected void Withdraw_Click(object sender, EventArgs e)
    {
        string userID = Request.QueryString["userID"].ToString();
        if (userID != null)
        {
            Response.Redirect("withdraw.aspx?userID=" + userID);
        }
    }

    protected void Deposit_Click(object sender, EventArgs e)
    {
        string userID = Request.QueryString["userID"].ToString();
        if (userID != null)
        {
            Response.Redirect("deposit.aspx?userID=" + userID);
        }
    }

    protected void Transfer_Click(object sender, EventArgs e)
    {
        string userID = Request.QueryString["userID"].ToString();
        if (userID != null)
        {
            Response.Redirect("transfer.aspx?userID=" + userID);
        }
    }
}