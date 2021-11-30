<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewofficeemp.aspx.cs" Inherits="viewofficeemp" Theme="SkinFile" %>

<!DOCTYPE html>
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div id="header">
                   
                <img src="pics/288300_gSP9rx4yGAF8onxZ88LVAezAq.jpg" alt="Yo!" style="height: 173px; width: 754px;">
                <a href="MainPage.aspx"><img src="pics/home.png" alt="[short name]" style="height: 47px; width: 67px"></a>         

  </div>
    <form id="form1" runat="server"><div id="nav-bar">ALL EMPLOYEES</div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Search by ID"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label5" runat="server" Text="Total Active employees"></asp:Label>
&nbsp;:
            <asp:Label ID="Label6" runat="server" BorderColor="#33CC33" BorderStyle="Outset" EnableTheming="True" Font-Bold="True" Font-Underline="True" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Employee_id" HeaderText="Employee_id" ReadOnly="True" SortExpression="Employee_id" />
                    <asp:BoundField DataField="Employee_name" HeaderText="Employee_name" SortExpression="Employee_name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                    <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Dateofjoin" HeaderText="Dateofjoin" SortExpression="Dateofjoin" />
                    <asp:BoundField DataField="Contactno" HeaderText="Contactno" SortExpression="Contactno" />
                    <asp:BoundField DataField="PreviousExp" HeaderText="PreviousExp" SortExpression="PreviousExp" />
                    <asp:BoundField DataField="Shiftid" HeaderText="Shiftid" SortExpression="Shiftid" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT * FROM [Employee_Table] WHERE ([Employee_id] = @Employee_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Employee_id" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Search by period of joining :     month"></asp:Label>
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
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Filter Data" />

            <asp:GridView ID="GridView3" runat="server" EmptyDataText="No records found">
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT * FROM [officeleaves]"></asp:SqlDataSource>
        <p>
            <asp:Label ID="Label7" runat="server" Text="Search by designation"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Role" DataValueField="Role">
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT DISTINCT [Role] FROM [Employee_Table]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_id" DataSourceID="SqlDataSource5">
                <Columns>
                    <asp:BoundField DataField="Employee_id" HeaderText="Employee_id" ReadOnly="True" SortExpression="Employee_id" />
                    <asp:BoundField DataField="Employee_name" HeaderText="Employee_name" SortExpression="Employee_name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                    <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Dateofjoin" HeaderText="Dateofjoin" SortExpression="Dateofjoin" />
                    <asp:BoundField DataField="Contactno" HeaderText="Contactno" SortExpression="Contactno" />
                    <asp:BoundField DataField="PreviousExp" HeaderText="PreviousExp" SortExpression="PreviousExp" />
                    <asp:BoundField DataField="Shiftid" HeaderText="Shiftid" SortExpression="Shiftid" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT * FROM [Employee_Table] WHERE ([Role] = @Role)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="Role" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        </p>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_id" DataSourceID="SqlDataSource2" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="Employee_id" HeaderText="Employee_id" ReadOnly="True" SortExpression="Employee_id" />
                    <asp:BoundField DataField="Employee_name" HeaderText="Employee_name" SortExpression="Employee_name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                    <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Dateofjoin" HeaderText="Dateofjoin" SortExpression="Dateofjoin" />
                    <asp:BoundField DataField="Contactno" HeaderText="Contactno" SortExpression="Contactno" />
                    <asp:BoundField DataField="PreviousExp" HeaderText="PreviousExp" SortExpression="PreviousExp" />
                    <asp:BoundField DataField="Shiftid" HeaderText="Shiftid" SortExpression="Shiftid" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT * FROM [Employee_Table]"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    <div>
    
    </div>
    </form>
</body>
</html>
