<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mandetails.aspx.cs" Inherits="admin_mandetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager Details</title>
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
        .navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 200px;
    height: 100%;
    background-color: #333;
    padding: 20px;
    box-sizing: border-box;
    transform: translateX(-220px);
    transition: transform 0.3s ease-in-out;
}

.navbar.active {
    transform: translateX(0);
}

.navbar a {
    display: block;
    color: #fff;
    text-decoration: none;
    margin-bottom: 10px;
}

        .toggle-button {
            position: fixed;
            top: 20px;
            left: 20px;
            background-color: #4C489D;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            z-index: 9999;
        }
        .toggle-button:hover
        {
             background-color: #6A679E;
        }

        /* Hide menu button when navbar is active */
        .navbar.active + .toggle-button {
            display: none;
        }

        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            color: #fff;
            cursor: pointer;
            
            
            border-radius: 5px;
            
            
        }
        .close-button:hover{
             background-color: dimgrey;
        }

        .Navbaropt {
            margin-top: 20px;
            width: 140px;
             padding: 10px 15px;
 border: none;
 border-radius: 5px;
 cursor: pointer;
 text-decoration: none;
 background-color:azure;
 
        }

        .Navbaropt:hover {
    background-color: #6A679E;
}
        .Navbarlogout {
            position: absolute;
            bottom: 20px;
            left: 20px;
            width: 140px;
            
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .Navbarlogout:hover {
            background-color: #6A679E;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Manager Details</h1>
        <div class="container">
            <asp:Label ID="lblUsername" CssClass="label" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblAccountNo" CssClass="label" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblPinCode" CssClass="label" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblStatus" CssClass="label" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
