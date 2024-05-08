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
            background-color: grey;
            outline: none;
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
    <button class="toggle-button" id="toggleButton">Menu</button>


    <form id="form1" runat="server">
    <div class="navbar" id="navbar">
        <span class="close-button" id="closeButton">Close</span>     
        <asp:Button ID="checkbalancebutton" runat="server" Text="Check Balance" CssClass="Navbaropt" OnClick="checkbalancebutton_Click" />
        <asp:Button ID="Button1" runat="server" Text="ATM Status" CssClass="Navbaropt" OnClick="atmstatus_Click" />
        <a href="login.aspx" class="Navbarlogout">Logout</a>
    </div>
        <div>
            <h1>Welcome 
                <asp:Label ID="name" runat="server" Text=""></asp:Label>!
            </h1>
            
            <asp:Button ID="CheckB" runat="server" CssClass="buttonmode" Text="Check ATM Balance" OnClick="CheckB_Click" Width="240px" />
             
        </div>
            
        <a class="buttonmode">
            <asp:DropDownList ID="AtmStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="AtmStatus_SelectedIndexChanged">
                <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                <asp:ListItem Text="Out of Service" Value="Out of Service"></asp:ListItem>
            </asp:DropDownList>
        </a>
        <asp:Label ID="Message" runat="server" Text=""></asp:Label>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navbar = document.getElementById('navbar');
            const toggleButton = document.getElementById('toggleButton');
            const closeButton = document.getElementById('closeButton');

            toggleButton.addEventListener('click', () => {
                navbar.classList.toggle('active');
                toggleButton.style.display = 'none'; // Hide toggle button when navbar is active
            });

            closeButton.addEventListener('click', () => {
                navbar.classList.remove('active');
                toggleButton.style.display = 'block'; // Show toggle button when navbar is closed
            });
        });
    </script>
</body>
</html>
