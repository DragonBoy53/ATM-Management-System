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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="balance-container">
        <h1>Current Balance</h1>
        <asp:Label ID="balance" runat="server" Text=""></asp:Label>
        <br/>
        
            <asp:TextBox ID="Amount" runat="server" placeholder="Enter Amount" ></asp:TextBox>
            <asp:Button runat="server" class="button" OnClick="ManagerDeposit" Text="Deposit"></asp:Button>
				    
        
        
        <br />
        <asp:Label ID="Message" runat="server" Text=""></asp:Label>
				    
        
        
        
    </div>

    
    </form>

    
</body>
</html>
