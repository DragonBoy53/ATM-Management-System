<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="withdraw.aspx.cs" Inherits="ATM_Machine.withdraw" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Withdraw Cash</title>
    <style>
        body {
            font-family: Arial, sans-serif;
           /* text-align: center;*/
            /*margin: 512;*/
            padding: 0;
            /*display: flex;*/
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin-top: 200px;
            margin-bottom: 200px;
            margin-right: 200px;
            margin-left: 200px;
        }
        .submit-area {
	        padding: 30px;
	        margin-top: 50px;
            margin-bottom: 50px;
            margin-right: 50px;
            margin-left: 100px;
	        border-radius: 5px;
            color: white;
            background-color: #007bff;
            width:400px
        }
        /*.status_message{
            display: block;
            color:tomato !important; 
            font-size:medium;
            margin-left: 100px;
        }*/
    </style>
</head>
<body>
    <div class="submit-area">
        <form id="w_form" runat="server">
            <h3>Current Balance:</h3>
            <div id="curr_balance" runat="server">
            </div>
            <br />
            <asp:Label id="w_label" runat="server" Text="Withdraw Amount:"></asp:Label>
            <asp:TextBox id="w_textbox" runat="server" Width="150px">
            </asp:TextBox>
            <br /><br />
            <asp:Button ID="w_button" runat="server" Text="Withdraw" Width="119px" OnClick="Withdraw_Button_Click"/>
        </form>
    </div>
    <br />
    <div id="w_status"  runat="server"></div>
</body>
</html>
