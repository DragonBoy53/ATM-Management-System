<%@ Page Language="C#" AutoEventWireup="true" CodeFile="transfer.aspx.cs" Inherits="ATM_Machine.client_transfer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Transfer Money</title>
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
            margin-bottom: 190px;
            margin-right: 200px;
            margin-left: 350px;
        background-color: #f4f4f4;

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
                 background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px #0056b3;
            width:400px
        }
        .status_message{
            display: block;
            color:red !important; 
            font-size:medium;
            margin-left: 220px;
        }

    .transfer-button {
       	background: #fff;
	font-size: 14px;
	margin-top: 30px;
	padding: 16px 20px;
	border-radius: 26px;
	border: 1px solid #D4D3E8;
	font-weight: 700;
    display: flow;
	align-items: center;
	width: 30%;
	color: #4C489D;
	box-shadow: 0px 2px 2px #5C5696;
	cursor: pointer;
	transition: .2s;
}

    .transfer-button:hover {
        border-color: #6A679E;
	outline: none;
        background-color:  silver;
    }
    </style>
</head>
<body>
    <div class="submit-area">
        <form id="t_form" runat="server">
            <h3>Current Balance:</h3>
            <div id="curr_balance" runat="server">
            </div>
            <asp:Label id="transferee_label" runat="server" Text="Send to: " placeholder="Enter Transferee Acccount Number"></asp:Label>
            <asp:TextBox id="transferee_accno" runat="server" Width="125px"> </asp:TextBox>
             <br /><br />
            <asp:Label id="t_label" runat="server" Text="Transfer Amount:"></asp:Label>
            <asp:TextBox id="t_textbox" runat="server" Width="125px">
            </asp:TextBox>
            <br /><br />
            <asp:Button ID="t_button" runat="server" Text="Transfer" CssClass="transfer-button" OnClick="Transfer_Button_Click"/>
        </form>
    </div>
    <div id="t_status" class="status_message" runat="server"></div>

</body>
</html>
