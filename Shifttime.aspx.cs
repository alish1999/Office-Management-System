using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Shifttime : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox4.Text = "";
        TextBox1.Text = "";
        con.Open();
        string sqlSelectQuery2 = "SELECT * FROM empshift WHERE Shiftid = " + (int.Parse(DropDownList1.SelectedIndex.ToString()) + 1);
        SqlCommand cmd2 = new SqlCommand(sqlSelectQuery2, con);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        if (dr2.Read())
        {
            TextBox4.Text = (dr2["Workshift"].ToString());
            TextBox1.Text = (dr2["Shifttime"].ToString());


        }

        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox4.Text != "" && TextBox1.Text != "" && TextBox5.Text != "" && DropDownList1.Text != "")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE empshift SET Shifttime='" + TextBox5.Text + "'WHERE Shiftid='" + (int.Parse(DropDownList1.SelectedIndex.ToString()) + 1) + "'", con);
            cmd.ExecuteNonQuery();
            Response.Write("Shift Timing Changed Successfully");
            con.Close();

        }
        else
        {
            Response.Write("FILL ALL THE FIELDS");
        }
    }
}