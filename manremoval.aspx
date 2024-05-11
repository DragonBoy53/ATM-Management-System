<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manremoval.aspx.cs" Inherits="atm_project.manremoval" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Remove a Manager</title>
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

        <button class="toggle-button" id="toggleButton">Menu</button>

<form id="form1" runat="server">
<div class="navbar" id="navbar">
    <span class="close-button" id="closeButton">Close</span>     
    <asp:Button ID="AdminHome" runat="server" Text="Home" CssClass="Navbaropt" OnClick="adminhome_Click" />
    <asp:Button ID="viewuser" runat="server" Text="View Users" CssClass="Navbaropt" OnClick="viewuser_Click" />
    <asp:Button ID="adduser" runat="server" Text="Add User" CssClass="Navbaropt" OnClick="adduser_Click"  />
    <asp:Button ID="removal" runat="server" Text="Remove User" CssClass="Navbaropt" OnClick="removal_Click"  />
    <asp:Button ID="manview" runat="server" Text="View Managers" CssClass="Navbaropt" OnClick="manview_Click"  />
    <asp:Button ID="manaddition" runat="server" Text="Add Manager" CssClass="Navbaropt" OnClick="manaddition_Click"  />
    <asp:Button ID="manremovals" runat="server" Text="Remove Manager" CssClass="Navbaropt" OnClick="manremoval_Click"  />
    <a href="login.aspx" class="Navbarlogout">Logout</a>
</div>
        <h1> Delete a Manager</h1>
<div class="container">
    <asp:TextBox  ID="manidbox" runat="server" placeholder="Enter manager ID:" Text=""></asp:TextBox>
   <br/>
    <asp:Label ID="Msg" runat="server" Text=""></asp:Label>
    <asp:Button ID="Remove" class="remove-button" runat="server" Text="Remove" OnClick="confirmRemove" />
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