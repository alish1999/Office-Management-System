<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewshifts.aspx.cs" Inherits="viewshifts" Theme="SkinFile" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #TextArea1 {
            height: 198px;
            width: 316px;
        }
    </style>
</head>
<body> <div id="header">
                   
                <img src="pics/288300_gSP9rx4yGAF8onxZ88LVAezAq.jpg" alt="Yo!" style="height: 173px; width: 754px;">
                <a href="MainPage.aspx"><img src="pics/home.png" alt="[short name]" style="height: 47px; width: 67px"></a>         

  </div>
    <form id="form1" runat="server"><div id="nav-bar">EMPLOYEE SHIFT INFORMATION</div>
        
        
            <asp:Label ID="Label5" runat="server" Text="Available Shifts:"></asp:Label>
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="Shiftid" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Shiftid" HeaderText="Shiftid" ReadOnly="True" SortExpression="Shiftid" />
                <asp:BoundField DataField="Workshift" HeaderText="Workshift" SortExpression="Workshift" />
                <asp:BoundField DataField="Shifttime" HeaderText="Shifttime" SortExpression="Shifttime" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT * FROM [empshift]"></asp:SqlDataSource>
        <br />
        
        
            <asp:Label ID="Label3" runat="server" Text="Search by ID"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>
       
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="Employee_id">
            <Columns>
                <asp:BoundField DataField="Employee_id" HeaderText="Employee_id" ReadOnly="True" SortExpression="Employee_id" />
                <asp:BoundField DataField="Employee_name" HeaderText="Employee_name" SortExpression="Employee_name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                <asp:BoundField DataField="Shiftid" HeaderText="Shiftid" SortExpression="Shiftid" />
                <asp:BoundField DataField="Workshift" HeaderText="Workshift" SortExpression="Workshift" />
                <asp:BoundField DataField="Shifttime" HeaderText="Shifttime" SortExpression="Shifttime" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT Employee_Table.Employee_id, Employee_Table.Employee_name, Employee_Table.Address, Employee_Table.Salary, Employee_Table.Role,  Employee_Table.Shiftid,empshift.Workshift,empshift.Shifttime FROM Employee_Table INNER JOIN empshift ON Employee_Table.Shiftid = empshift.Shiftid WHERE Employee_Table.Employee_id=@Employee_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Employee_id" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
        
        
            <asp:Label ID="Label4" runat="server" Text="Search by Shift"></asp:Label>
            &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Shiftid" DataValueField="Shiftid">
        </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT [Shiftid] FROM [empshift]"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Employee_id" HeaderText="Employee_id" ReadOnly="True" SortExpression="Employee_id" />
                    <asp:BoundField DataField="Employee_name" HeaderText="Employee_name" SortExpression="Employee_name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                    <asp:BoundField DataField="Shiftid" HeaderText="Shiftid" SortExpression="Shiftid" />
                    <asp:BoundField DataField="Workshift" HeaderText="Workshift" SortExpression="Workshift" />
                    <asp:BoundField DataField="Shifttime" HeaderText="Shifttime" SortExpression="Shifttime" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT Employee_Table.Employee_id, Employee_Table.Employee_name, Employee_Table.Address, Employee_Table.Salary, Employee_Table.Role, Employee_Table.Shiftid, empshift.Workshift, empshift.Shifttime FROM Employee_Table INNER JOIN empshift ON Employee_Table.Shiftid = empshift.Shiftid WHERE (Employee_Table.Shiftid = @Shiftid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="Shiftid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    <div style="height: 510px">
    
        <br />
    
    </div>
    </form>
</body>
</html>
