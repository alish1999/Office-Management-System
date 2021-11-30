<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="adminlogin" Theme="SkinFile" %>

<!DOCTYPE html>
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
</head>
<body><div id="header">
                   
                <img src="pics/288300_gSP9rx4yGAF8onxZ88LVAezAq.jpg" alt="Yo!" style="height: 173px; width: 754px;">

  </div>
    <form id="form1" runat="server"><div id="nav-bar">ADMIN LOGIN</div>
    <div style="height: 550px">
    
        <br />
        <asp:Label ID="Label1" runat="server" Text="Admin ID"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server">admin</asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password">admin</asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
    
    </div>
    </form>
</body>
</html>
