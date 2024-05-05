<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addition.aspx.cs" Inherits="admin_addition" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add a User</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: auto;
        padding: 0;
        background-color: #f4f4f4;
    }

    .container {
        max-width: 350px;
        margin: 10px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
	border-bottom-color: #6A679E;
    }

    label {
        display: block;
        margin-bottom: 1px;
        font-weight: bold;
    }

    input[type="text"] {
	border: none;
	border-bottom: 2px solid #D1D1D4;
	background: none;
	padding: 10px;
	padding-left: 24px;
	font-weight: 700;
	width: 75%;
	transition: .2s;    }

    .add-button {
       	background: #fff;
	font-size: 14px;
	margin-top: 30px;
    margin-left: auto;
    margin-right: auto;
	padding: 16px 20px;
	border-radius: 26px;
	border: 1px solid #D4D3E8;
	font-weight: 700;
    display: flow;
	align-items: center;
	width: 10%;
	color: #4C489D;
	box-shadow: 0px 2px 2px #5C5696;
	cursor: pointer;
	transition: .2s;
}

    .add-button:hover {
        border-color: #6A679E;
	outline: none;
        background-color:  green;
    }

    .result {
        margin-top: 10px;
        display: none;
        color: green;
         text-align: center;
    }

    h1 {
            margin-top: 20px;
            text-align: center;
            align-items: center;
            font-size: 40px;
            }

</style>
</head>
<body>

        <form id="form1" runat="server">

        <h1> Add a User </h1>
<div class="container">
    <asp:TextBox  ID="accno" runat="server" placeholder="Assign Account No." Text=""></asp:TextBox>
    </div>
                <div class="container">
          <asp:TextBox  ID="pin" runat="server" placeholder="Assign PIN Code" Text=""></asp:TextBox>
    </div>

<div class="container">
          <asp:TextBox  ID="username" runat="server" placeholder="Enter Username" Text=""></asp:TextBox>
    </div>

    <div class="container">
          <asp:TextBox  ID="contactno" runat="server" placeholder="Enter Contact No." Text=""></asp:TextBox>
    </div>

                 <div class="container">
    <asp:Label ID="Msg" runat="server" Text=""></asp:Label>
                     </div>
    <asp:Button ID="ADD" class="add-button" runat="server" Text="Add" OnClick="confirmadd" />
           
        </form>
</body>

</html>