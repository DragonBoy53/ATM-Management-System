﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manview.aspx.cs" Inherits="atm_project.manview" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Managers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align:center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
        }

      h1 {
            margin-top: 50px;
            text-align: center;
            align-items: center;
            font-size: 30px;
            }

  .grid-container {
  display: grid;
  place-items: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
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
    <asp:Button ID="manviews" runat="server" Text="View Managers" CssClass="Navbaropt" OnClick="manview_Click"  />
    <asp:Button ID="manaddition" runat="server" Text="Add Manager" CssClass="Navbaropt" OnClick="manaddition_Click"  />
    <asp:Button ID="manremoval" runat="server" Text="Remove Manager" CssClass="Navbaropt" OnClick="manremoval_Click"  />
    <a href="login.aspx" class="Navbarlogout">Logout</a>
</div>
        <section>
            <h1>Managers list</h1>
        </section>
        <div class="grid-container">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ATMEntities %>" SelectCommand="SELECT managerID, manager_name FROM [Manager]"></asp:SqlDataSource>
            <asp:GridView ID="manlist" runat="server" AutoGenerateColumns="False" DataKeyNames="managerID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="285px" Width="363px">
    <Columns>
        <asp:BoundField DataField="managerID" HeaderText="Manager ID" />
        <asp:BoundField DataField="manager_name" HeaderText="Username" />
   <asp:HyperLinkField HeaderText="Details" Text="View" DataNavigateUrlFields="managerId" DataNavigateUrlFormatString="mandetails.aspx?managerId={0}" />
    
    </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
</asp:GridView>

        </div> <!-- Closed the container div -->
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