using ATM_Machine.userTransaction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATM_Machine
{
    public partial class withdraw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AtmStatus"] != null)
            {
                if (Session["AtmStatus"].ToString() == "Out of Service")
                    Response.Redirect("out_of_service");

            }
            if (!IsPostBack)
            {
                DisplayCurrBalance();
            }
        }
        protected void Withdraw_Button_Click(object sender, EventArgs e)
        {
            user_transaction withdraw = new user_transaction();
            //long amount = long.Parse(w_textbox.Text);
            long amount= Convert.ToInt64(w_textbox.Text);
            string user_acc_no = "";
            if (Session["user_accno"] != null)
            {
                user_acc_no = Session["user_accno"].ToString();
            }
            int trans_status = withdraw.add_user_transaction(user_acc_no, "N/A", amount, "Withdraw");
            if (trans_status == 1)
            {
                w_status.InnerHtml = Convert.ToString("Transaction successful.");
                DisplayCurrBalance();
            }
            else if (trans_status == 0)
            {
                w_status.InnerHtml = Convert.ToString("Low Balance! Transaction Failed.");
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
