using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addition : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    String connString = ConfigurationManager.ConnectionStrings["ATM_machine"].ConnectionString;
    private bool UserIDExist(string name, string accno, string pin, string contact)
    {
        string query = "SELECT * FROM [Client_details] where account_no = @accno ";
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
                    string addQuery = "DECLARE @newUserID INT; SET @newUserID = (SELECT ISNULL(MAX(userID), 0) + 1 FROM Client_details);" +
                        "insert into  [Client_details] (userID,client_name, account_no, PINcode,contact_no) values(@newuserID, @name, @accno, @pin, @contact)";
                 
                    using (SqlCommand addCommand = new SqlCommand(addQuery, connection))
                    {
                        addCommand.Parameters.AddWithValue("@name", name);
                        addCommand.Parameters.AddWithValue("@accno", accno);
                        addCommand.Parameters.AddWithValue("@pin", pin);
                        addCommand.Parameters.AddWithValue("@contact", contact);
                        addCommand.ExecuteNonQuery();
                    }
                    return true;
                }
            }
        }
    }
    protected void confirmadd(object sender, EventArgs e)
    {

        bool flag = UserIDExist(username.Text, accno.Text, pin.Text, contactno.Text);
        if (flag)
        {
            Msg.Text = "User has been added successfully";
        }
        else
        {
            Msg.Text = "User cannot be added";
        }
    }

}