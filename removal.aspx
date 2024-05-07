<%@ Page Language="C#" AutoEventWireup="true" CodeFile="removal.aspx.cs" Inherits="admin_removal" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Remove a User</title>
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

    .remove-button {
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

    .remove-button:hover {
        border-color: #6A679E;
	outline: none;
        background-color:  #ff0000;
    }

    .result {
        margin-top: 10px;
        display: none;
        color: green;
         text-align: center;
    }
    h1 {
            margin-top: 100px;
            text-align: center;
            align-items: center;
            font-size: 40px;
            }

</style>
</head>
<body>

        <form id="form1" runat="server">

        <h1> Delete a User </h1>
<div class="container">
    <asp:TextBox  ID="useridbox" runat="server" placeholder="Enter user ID:" Text=""></asp:TextBox>
   <br/>
    <asp:Label ID="Msg" runat="server" Text=""></asp:Label>
    <asp:Button ID="Remove" class="remove-button" runat="server" Text="Remove" OnClick="confirmRemove" />
</div>

        </form>

</body>
</html>