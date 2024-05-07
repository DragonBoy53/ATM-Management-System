<%@ Page Language="C#" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="admin_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            background-color: #f4f4f4;
        }

        h1 {
            margin-top: 50px;
            text-align: center;
            font-size: 30px;
        }

        .container {
            max-width: 800px;
            margin-top: 80px;
            padding: 50px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px #0056b3;
        }

        .label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #000f;
        }

        .value {
            margin-bottom: 20px;
            color: #333;
        }

        hr {
            border: none;
            border-top: 1px solid #0056b3;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>User Details</h1>
        <div class="container">
            <asp:Label ID="lblUsername" CssClass="label" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblAccountNo" CssClass="label" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblPinCode" CssClass="label" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblBalance" CssClass="label" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblStatus" CssClass="label" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
