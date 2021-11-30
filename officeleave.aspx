<%@ Page Language="C#" AutoEventWireup="true" CodeFile="officeleave.aspx.cs" Inherits="officeleave" Theme="SkinFile" %>

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
    <form id="form1" runat="server"><div id="nav-bar">REGISTER EMPLOYEE LEAVE</div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Employee ID"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Employee Name"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
    <div>
    
        <asp:Label ID="Label3" runat="server" Text="Leave Type"></asp:Label>
&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Casual Leave</asp:ListItem>
            <asp:ListItem>Earned Leave</asp:ListItem>
            <asp:ListItem>Maternity Leave</asp:ListItem>
            <asp:ListItem>Study Leave</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Leave from"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Leave till"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register Leave" />
    
    </div>
    </form>
</body>
</html>
