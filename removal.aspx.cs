using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class admin_removal : System.Web.UI.Page
    {
        String connString = ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;
        private bool UserIDExist(string userID)
        {
            string query = "SELECT * FROM [Client_details] where userID = @userID ";
            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@userID", userID);
                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        string deleteQuery= "delete from [Client_details] where userID= @userID";
                        using (SqlCommand deleteCommand = new SqlCommand(deleteQuery, connection))
                        {
                            deleteCommand.Parameters.AddWithValue("@userID", userID);
                            deleteCommand.ExecuteNonQuery();
                        }
                        return true;
                    }
                    return false;
                }
            }
        }
    protected void confirmRemove(object sender, EventArgs e)
    {

        bool flag = UserIDExist(useridbox.Text);
        if (flag == true)
        {
            Msg.Text = "User has been deleted successfully";
        }
        else
        {
            Msg.Text = "User cannot be deleted";
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
