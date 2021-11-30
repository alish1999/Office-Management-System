<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" Theme="SkinFile"   %>

<!DOCTYPE html>
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
</head>
    <title>OFFICE MANAGEMENT SYSTEM</title>
    
<body>
    
    <div id="header">
                   
                <img src="pics/288300_gSP9rx4yGAF8onxZ88LVAezAq.jpg" alt="Yo!" style="height: 173px; width: 754px;">
                <a href="MainPage.aspx"><img src="pics/home.png" alt="[short name]" style="height: 47px; width: 67px"></a>         

  </div>
    
    <form id="form1" runat="server"  >
         <div id="nav-bar">OFFICE MANAGEMENT </div>
        <asp:Panel ID="Panel1" runat="server" >
            <p>
            EMPLOYEE MANAGEMENT:</p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add new Employee" />
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Update employee details" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="View all employees"  />
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Delete employee record" />
        </p>
        
        </asp:Panel>
         <asp:Panel ID="Panel2" runat="server">
         
         <p>
            &nbsp; WORKSHIFT MANAGEMENT:</p>
        <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Change Office employee shifts" />
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Office Workshifts reports" />
            &nbsp;&nbsp;
            <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="Manage Shift timings" />
        </p>
        </asp:Panel>
         <asp:Panel ID="Panel3" runat="server">
         
         <p>
            &nbsp; LEAVE MANAGEMENT:</p>
        <p>
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Register Leave" Width="136px" />
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="All Leave reports" Width="121px" />
        </p>
        </asp:Panel>
         <asp:Panel ID="Panel4" runat="server">
         
         <p>
             &nbsp; PAYROLL MANAGEMENT:</p>
        <p>
            <asp:Button ID="Button8" runat="server" Text="Generate Payroll" OnClick="Button8_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button9" runat="server" Text="View payment reports" OnClick="Button9_Click" />
        </p>
        </asp:Panel>
        <p>
            &nbsp;</p>
    <div>
    
    </div>
    </form>
        

</body>
</html>
