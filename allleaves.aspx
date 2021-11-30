<%@ Page Language="C#" AutoEventWireup="true" CodeFile="allleaves.aspx.cs" Inherits="allleaves" Theme="SkinFile" %>

<!DOCTYPE html>
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body> <div id="header">
                   
                <img src="pics/288300_gSP9rx4yGAF8onxZ88LVAezAq.jpg" alt="Yo!" style="height: 173px; width: 754px;">
                <a href="MainPage.aspx"><img src="pics/home.png" alt="[short name]" style="height: 47px; width: 67px"></a>         

  </div>
    
    <form id="form1" runat="server"><div id="nav-bar">LEAVE RECORDS</div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Search by ID"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Employee_id">
                <Columns>
                    <asp:BoundField DataField="Employee_id" HeaderText="Employee_id" SortExpression="Employee_id" ReadOnly="True" />
                    <asp:BoundField DataField="Employee_name" HeaderText="Employee_name" SortExpression="Employee_name" />
                    <asp:BoundField DataField="Leavetype" HeaderText="Leavetype" SortExpression="Leavetype" />
                    <asp:BoundField DataField="Leavefrom" HeaderText="Leavefrom" SortExpression="Leavefrom" />
                    <asp:BoundField DataField="Leavetill" HeaderText="Leavetill" SortExpression="Leavetill" />
                </Columns>
            </asp:GridView>
            &nbsp;
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT Employee_Table.Employee_id, Employee_Table.Employee_name, officeleaves.Leavetype, officeleaves.Leavefrom, officeleaves.Leavetill FROM Employee_Table INNER JOIN officeleaves ON Employee_Table.Employee_id = officeleaves.Employee_id WHERE Employee_Table.Employee_id=@Employee_id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Employee_id" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
            <asp:Label ID="Label2" runat="server" Text="Search by period of leave:     month"></asp:Label>
&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="1">Jan</asp:ListItem>
                <asp:ListItem Value="2">Feb</asp:ListItem>
                <asp:ListItem Value="3">Mar</asp:ListItem>
                <asp:ListItem Value="4">April</asp:ListItem>
                <asp:ListItem Value="5">May</asp:ListItem>
                <asp:ListItem Value="6">June</asp:ListItem>
                <asp:ListItem Value="7">July</asp:ListItem>
                <asp:ListItem Value="8">Aug</asp:ListItem>
                <asp:ListItem Value="9">Sept</asp:ListItem>
                <asp:ListItem Value="10">Oct</asp:ListItem>
                <asp:ListItem Value="11">Nov</asp:ListItem>
                <asp:ListItem Value="12">Dec</asp:ListItem>
        </asp:DropDownList>
            <asp:Label ID="Label3" runat="server" Text="year"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" AutoPostBack="True"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Filter Data" Height="26px" />

            <asp:GridView ID="GridView3" runat="server" EmptyDataText="No records found">
            </asp:GridView>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="Employee_id" HeaderText="Employee_id" SortExpression="Employee_id" />
                    <asp:BoundField DataField="Employee_name" HeaderText="Employee_name" SortExpression="Employeename" />
                    <asp:BoundField DataField="Leavetype" HeaderText="Leavetype" SortExpression="Leavetype" />
                    <asp:BoundField DataField="Leavefrom" HeaderText="Leavefrom" SortExpression="Leavefrom" />
                    <asp:BoundField DataField="Leavetill" HeaderText="Leavetill" SortExpression="Leavetill" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT Employee_Table.Employee_id, Employee_Table.Employee_name, officeleaves.Leavetype, officeleaves.Leavefrom, officeleaves.Leavetill FROM Employee_Table INNER JOIN officeleaves ON Employee_Table.Employee_id = officeleaves.Employee_id"></asp:SqlDataSource>
        </p>
    <div style="height: 409px">
    
    </div>
    </form>
</body>
</html>
