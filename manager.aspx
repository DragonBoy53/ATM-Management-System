<%@ Page Title="manager" Language="C#" Debug="true" AutoEventWireup="true" CodeFile="manager.aspx.cs" Inherits="ATMModel.manager" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Check Balance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .button {
            width: 200px;
            padding: 10px;
            margin: 30px; /* Adjusted to only vertical margin */
            font-size: 16px;
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

        h1 {
            margin-bottom: 20px; /* Add some space below the heading */
            text-align: center;
            align-items: center;
        }

        .button:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Welcome 
                <asp:Label ID="name" runat="server" Text=""></asp:Label>
            </h1>
            
             <a href="CheckBalance.aspx" class="button">Check ATM Balance</a>
        </div>
            
             <a  class="button">
        <asp:DropDownList ID="AtmStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="AtmStatus_SelectedIndexChanged">
                <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                <asp:ListItem Text="Out of Service" Value="Out of Service"></asp:ListItem>
            </asp:DropDownList>
        </a>
    </form>
</body>
</html>
