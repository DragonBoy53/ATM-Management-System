<%@ Page Title="CheckBalance" Language="C#" Debug="true" AutoEventWireup="true" CodeFile="CheckBalance.aspx.cs" Inherits="ATMModel.CheckBalance" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Balance</title>
    <style>
        body {
            background-color: white;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
        }
        .balance-container {
            margin: auto;
            width: 50%;
            background-color: #f0f0f0;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .deposit-form {
            display: none;
            margin-top: 20px;
        }
        .deposit-input {
            padding: 10px;
            font-size: 16px;
            margin-right: 10px;
        }
        .deposit_input {
	border: none;
	border-bottom: 2px solid #D1D1D4;
	background: none;
	padding: 10px;
	padding-left: 24px;
	font-weight: 700;
	width: 75%;
	transition: .2s;
}

.deposit_input:active,
.deposit_input:focus,
.deposit_input:hover {
	outline: none;
	border-bottom-color: #6A679E;
}
           .buttonmode {
    width: 200px;
    background: #fff;
    font-size: 14px;
    margin-top: 20px;
    padding: 10px 20px;
    border-radius: 26px;
    border: 1px solid #D4D3E8;
    font-weight: 700;
    text-align: center;
    text-decoration: none;
    justify-content: center; /* Center horizontally */
    color: #4C489D;
    box-shadow: 0px 2px 2px #5C5696;
    cursor: pointer;
    transition: .2s;
}


    
.buttonmode:active,
.buttonmode:focus,
.buttonmode:hover {
	border-color: #6A679E;
    background-color:grey;
	outline: none;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="balance-container">
        <h1>Current Balance</h1>
        <asp:Label ID="balance" runat="server" Text=""></asp:Label>
        <br/>
        
            <asp:TextBox ID="Amount" runat="server" placeholder="Enter Amount" CssClass="deposit_input" ></asp:TextBox>
            <asp:Button runat="server" class="buttonmode" OnClick="ManagerDeposit" Text="Deposit" Width="100px"></asp:Button>
				    
        
        
        <br />
        <asp:Label ID="Message" runat="server" Text=""></asp:Label>
				    
        
        
        
    </div>

    
    </form>

    
</body>
</html>
