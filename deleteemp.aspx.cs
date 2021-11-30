using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class deleteemp : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM Employee_Table WHERE Employee_id='" + TextBox1.Text + "'", con);
            cmd.ExecuteNonQuery();
            Response.Write("Record Deleted Sucessfully");
            con.Close();
        }
        else
            Response.Write("Enter an ID to delete first");
    }
}