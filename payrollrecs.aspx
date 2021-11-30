<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payrollrecs.aspx.cs" Inherits="payrollrecs" Theme="SkinFile" %>

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
    <form id="form1" runat="server"><div id="nav-bar">PAYMENT RECORDS</div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Search by ID"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label5" runat="server" Text="Total Active employees"></asp:Label>
&nbsp;:&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server" BorderColor="#33CC33" BorderStyle="Outset" EnableTheming="True" Font-Bold="True" Font-Underline="True" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Employee_id" HeaderText="Employee_id" ReadOnly="True" SortExpression="Employee_id" />
                    <asp:BoundField DataField="Employee_name" HeaderText="Employee_name" SortExpression="Employee_name" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Allowances" HeaderText="Allowances" SortExpression="Allowances" />
                    <asp:BoundField DataField="Tax" HeaderText="Tax" SortExpression="Tax" />
                    <asp:BoundField DataField="PF" HeaderText="PF" SortExpression="PF" />
                    <asp:BoundField DataField="Leavededuction" HeaderText="Leavededuction" SortExpression="Leavededuction" />
                    <asp:BoundField DataField="Netsalary" HeaderText="Netsalary" SortExpression="Netsalary" />
                    <asp:BoundField DataField="Paymentdate" HeaderText="Paymentdate" SortExpression="Paymentdate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT Employee_Table.Employee_id, Employee_Table.Employee_name,Employee_Table.Salary, Officepayroll.Allowances, Officepayroll.Tax, Officepayroll.PF, Officepayroll.Leavededuction, Officepayroll.Netsalary, Officepayroll.Paymentdate FROM Employee_Table INNER JOIN Officepayroll ON Employee_Table.Employee_id = Officepayroll.Emp_ID WHERE ([Emp_ID] = @Emp_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Emp_ID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Search by period of payment :     month"></asp:Label>
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

            <asp:GridView ID="GridView3" runat="server" EmptyDataText="No records found" OnRowDataBound="GridView3_RowDataBound" ShowFooter="True">
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT * FROM [officeleaves]"></asp:SqlDataSource>
        <p>
            &nbsp;</p>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="ALL PAYMENTS"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_id" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="Employee_id" HeaderText="Employee_id" ReadOnly="True" SortExpression="Employee_id" />
                    <asp:BoundField DataField="Employee_name" HeaderText="Employee_name" SortExpression="Employee_name" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Allowances" HeaderText="Allowances" SortExpression="Allowances" />
                    <asp:BoundField DataField="Tax" HeaderText="Tax" SortExpression="Tax" />
                    <asp:BoundField DataField="PF" HeaderText="PF" SortExpression="PF" />
                    <asp:BoundField DataField="Leavededuction" HeaderText="Leavededuction" SortExpression="Leavededuction" />
                    <asp:BoundField DataField="Netsalary" HeaderText="Netsalary" SortExpression="Netsalary" />
                    <asp:BoundField DataField="Paymentdate" HeaderText="Paymentdate" SortExpression="Paymentdate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT Employee_Table.Employee_id, Employee_Table.Employee_name,Employee_Table.Salary, Officepayroll.Allowances, Officepayroll.Tax, Officepayroll.PF, Officepayroll.Leavededuction, Officepayroll.Netsalary, Officepayroll.Paymentdate FROM Employee_Table INNER JOIN Officepayroll ON Employee_Table.Employee_id = Officepayroll.Emp_ID"></asp:SqlDataSource>
        </p>
    <div style="height: 239px">
    
    </div>
    </form>
</body>
</html>
