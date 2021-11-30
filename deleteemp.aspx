<%@ Page Language="C#" AutoEventWireup="true" CodeFile="deleteemp.aspx.cs" Inherits="deleteemp" Theme="SkinFile" %>

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
    
    <form id="form1" runat="server"><div id="nav-bar">DELETE EMPLOYEE</div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Employee ID to delete"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>
        &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" BackColor="#CC0000" EnableTheming="False" ForeColor="White" OnClick="Button1_Click" Text="DELETE" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_id" DataSourceID="SqlDataSource2" BackColor="#9999FF">
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
                </Columns>
                <HeaderStyle BackColor="#3333CC" BorderColor="#6699FF" Font-Bold="True" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT * FROM [Employee_Table] WHERE ([Employee_id] = @Employee_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Employee_id" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_id" DataSourceID="SqlDataSource1">
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
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT * FROM [Employee_Table]"></asp:SqlDataSource>
        </p>
    <div>
    
    </div>
    </form>
</body>
</html>
