<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deposit.aspx.cs" Inherits="ATM_Machine.deposit" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Deposit Cash</title>
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
            margin-top: 190px;
            margin-bottom: 200px;
            margin-right: 200px;
            margin-left: 250px;
        }
        .button {
            width: 150px;
            padding: 10px;
            margin: 10px; /* Adjusted to only vertical margin */
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            background-color: #007bff;
            color: #fff;
            border: 1px solid #007bff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            text-align: center;
            display: block;
        }
        .button:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .submit-area {
            padding-left:40px;
            padding-top:30px;
            padding-bottom:30px;
	        margin-top: 50px;
            margin-bottom: 50px;
            margin-right: 50px;
            margin-left: 120px;
	        border-radius: 5px;
            color: white;
            background-color: #007bff;
            width:400px
        }
        .status_message{
            display: block;
            color:red !important; 
            font-size:medium;
            margin-left: 220px;
        }
        .inbox_button{
            width:70px;
            height:25px;
            color:black;
            background-color:white;
            border: 1px solid #007bff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            text-align: center;
            cursor: pointer;
        }
        .inbox_button:hover {
            background-color:silver;
        }
        .bottom-right {
            position: absolute;
            bottom: 0;
            right: 0;
        }
    </style>
</head>
<body>
    <div class="submit-area">
        <form id="d_form" runat="server">
            <h3>Current Balance:</h3>
            <div id="curr_balance" runat="server"> </div>
            <br /><br />
            <asp:Label id="d_label" runat="server" Text="Deposit Amount:"></asp:Label>
            <asp:TextBox id="d_textbox" runat="server" Width="125px">
            </asp:TextBox>
            <br /><br />
            <asp:Button ID="d_button" CssClass="inbox_button" runat="server" Text="Deposit" OnClick="Deposit_Button_Click"/>
        </form>
    </div>
    <br />
    <div id="d_status" class="status_message" runat="server"></div>
    <div class="bottom-right">
    <a href="user.aspx">
        <button class="button">Back to Home</button>
    </a>
    </div>

</body>
</html>
