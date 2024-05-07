<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view.aspx.cs" Inherits="atm_project.view" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
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

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <h1>Users list</h1>
        </section>
        <div class="grid-container">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ATM_machine %>" SelectCommand="SELECT userid, client_name FROM [client_details]"></asp:SqlDataSource>
            <asp:GridView ID="userlist" runat="server" AutoGenerateColumns="False" DataKeyNames="userid" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="285px" Width="363px">
    <Columns>
        <asp:BoundField DataField="userID" HeaderText="User ID" />
        <asp:BoundField DataField="client_name" HeaderText="Username" />
        <asp:HyperLinkField HeaderText="Details" NavigateUrl="http://localhost:51802/admin/details.aspx" Text="view" />
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
</body>
</html>
