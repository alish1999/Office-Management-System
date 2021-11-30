<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changeshift.aspx.cs" Inherits="officeshift" Theme="SkinFile" %>

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
    <form id="form1" runat="server"><div id="nav-bar">CHANGE EMPLOYEE SHIFT</div>
    <div>
    
        
        <asp:Label ID="Label1" runat="server" Text="emp id"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox5" runat="server" AutoPostBack="True" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="emp name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="current shift id"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox7" runat="server" AutoPostBack="True"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="current shift"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="shift time"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" Text="new shift id"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Shiftid" DataValueField="Shiftid" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeeConnectionString %>" SelectCommand="SELECT [Shiftid] FROM [empshift]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="Label5" runat="server" Text="new shift"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="new shift time"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
    
    </div>
        <asp:Button ID="Button1" runat="server" Text="CHANGE SHIFT" OnClick="Button1_Click" />
    </form>
</body>
</html>
