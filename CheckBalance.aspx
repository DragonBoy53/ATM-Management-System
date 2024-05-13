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
    </style>
</head>
<body>
     <button class="toggle-button" id="toggleButton">Menu</button>

    <form id="form1" runat="server">

 <div class="navbar" id="navbar">
     <span class="close-button" id="closeButton">Close</span>     
     <asp:Button ID="homebutton" runat="server" Text="Home" CssClass="Navbaropt" OnClick="homebutton_Click" />
     <asp:Button ID="checkbalancebutton" runat="server" Text="Check Balance" CssClass="Navbaropt" OnClick="checkbalancebutton_Click" />
     <asp:Button ID="atmstatus" runat="server" Text="ATM Status" CssClass="Navbaropt" OnClick="atmstatus_Click" />
     <a href="login.aspx" class="Navbarlogout">Logout</a>
 </div>
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
