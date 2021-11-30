using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //pageBody.Attributes.Add("bgcolor", "yellow");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("empregister.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("changeshift.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewshifts.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewofficeemp.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("updateofficeemp.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("officeleave.aspx");
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("allleaves.aspx");
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        Response.Redirect("deleteemp.aspx");
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Officepay.aspx");
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("payrollrecs.aspx");
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        Response.Redirect("Shifttime.aspx");

    }
}