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
        String connString = ConfigurationManager.ConnectionStrings["ATM_machine"].ConnectionString;
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

}