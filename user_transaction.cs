using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace ATM_Machine.userTransaction
{
    public class user_transaction
    {
        //Add reference to the connection string
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ATMEntities"].ConnectionString;

        //Function to manage transactions
        public int add_user_transaction(string user_accno, string transferee_accno, long amount, string transtype)
        {
            int trans_status = 0;
            //Open Connection
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            try
            {
                //Create SQL command
                SqlCommand cmd = new SqlCommand("Add_Transaction", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //Add Parameters
                cmd.Parameters.Add("@user_accno", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@transferee_accno", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@amount", SqlDbType.BigInt);
                cmd.Parameters.Add("@transtype", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                //Initialise parameters
                cmd.Parameters["@user_accno"].Value = user_accno;
                cmd.Parameters["@transferee_accno"].Value = transferee_accno;
                cmd.Parameters["@amount"].Value = amount;
                cmd.Parameters["@transtype"].Value = transtype;
                //Execute command
                cmd.ExecuteNonQuery();
                //Read output value
                trans_status = Convert.ToInt32(cmd.Parameters["@flag"].Value);
                //Close connection
                conn.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }
            return trans_status;
        }

        //Function to fetch the user's balance
        public long getUserBalance(string user_accno)
        {
            long balance=0;
            //Open Connection
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            try
            {
                //Create SQL command
                SqlCommand cmd = new SqlCommand("SELECT balance FROM client_details WHERE account_no=@acc_no", conn);
                //Add Parameters
                cmd.Parameters.Add("@acc_no", SqlDbType.VarChar, 100);
                //Initialise parameters
                cmd.Parameters["@acc_no"].Value = user_accno;
                //Execute command
                balance = (long)cmd.ExecuteScalar();
                //Close connection
                conn.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }
            return balance;
        }
    }
}
