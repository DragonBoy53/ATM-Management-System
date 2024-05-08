<%@ Page Title="User" Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="ATMModel.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>User - Home</title>
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
            margin: 10px; /* Adjusted to only vertical margin */
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
        .button:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .bottom-right {
            position: absolute;
            bottom: 0;
            right: 0;
        }
        h1 {
            margin-bottom: 20px; /* Add some space below the heading */
            text-align: center;
            align-items: center;
        }
            .buttonmode {
    width: 200px;
    background: #fff;
    font-size: 14px;
    margin-top: 20px;
    padding: 20px 20px;
    border-radius: 26px;
    border: 1px solid #D4D3E8;
    font-weight: 700;
    text-align: center;
    text-decoration: none;
    display: flex;
    align-items: center;
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
    <section>
        <h2>Welcome  <asp:Label ID="name" runat="server" Text=""></asp:Label>!</h2>
        <a href="details.aspx" class="buttonmode">View Account Information</a>
     <a href="withdraw.aspx" class="buttonmode">Withdraw</a>



        <a href="deposit.aspx" class="buttonmode">Deposit</a>
        <a href="transfer.aspx" class="buttonmode" >Transfer</a>
    </section>
    <div class="bottom-right">
        <a href="login.aspx" class="buttonmode" >Logout</a>
    </div>
</body>
</html>