using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ATM_Machine.userTransaction;

namespace ATM_Machine
{
    public partial class deposit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AtmStatus"] != null)
            {
                if (Session["AtmStatus"].ToString() == "Out of Service")
                    Response.Redirect("out_of_service");
            }
            if (!IsPostBack)
                DisplayCurrBalance();
        }
        
        protected void Deposit_Button_Click(object sender, EventArgs e)
        {
            user_transaction deposit = new user_transaction();
            long amount = Convert.ToInt64(d_textbox.Text);
            string user_acc_no = "";
            if (Session["user_accno"] != null)
            {
                user_acc_no = Session["user_accno"].ToString();
            }
            int trans_status = deposit.add_user_transaction(user_acc_no, "N/A", amount, "Deposit");
            if (trans_status == 1)
            {
                d_status.InnerHtml = Convert.ToString("Transaction successful.");
                DisplayCurrBalance();
            }
            else if (trans_status == 0)
            {
                d_status.InnerHtml = Convert.ToString("Transaction Failed.");
            }
        }
        public void DisplayCurrBalance()
        {
            string user_acc_no = "";
            if (Session["user_accno"] != null)
            {
                user_acc_no = Session["user_accno"].ToString();
                user_transaction transaction = new user_transaction();
                long balance = transaction.getUserBalance(user_acc_no);
                curr_balance.InnerHtml = balance.ToString();
            }
        }
    }
}
    
