using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string user = TextBox1.Text.ToString();
        string pass = TextBox2.Text.ToString();
        if (TextBox1.Text != "" && TextBox2.Text != "")
        {
            if (user.Equals("admin") && pass.Equals("admin"))
                Response.Redirect("MainPage.aspx");
            else
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('wrong credentials');", true);
        }
        else
        {
             System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('enter both fields');", true);
        }
    }
}