using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class officeshift : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TextBox5_TextChanged(object sender, EventArgs e)
    {
        if (TextBox5.Text != "")
        {
            con.Open();
            string sqlSelectQuery = "SELECT * FROM Employee_Table WHERE Employee_id = " + int.Parse(TextBox5.Text);
            SqlCommand cmd = new SqlCommand(sqlSelectQuery, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                TextBox2.Text = (dr["Employee_name"].ToString());
                TextBox7.Text = (dr["Shiftid"].ToString());


            }
            con.Close();
            con.Open();
            string sqlSelectQuery2 = "SELECT * FROM empshift WHERE Shiftid = " + int.Parse(TextBox7.Text);
            SqlCommand cmd2 = new SqlCommand(sqlSelectQuery2, con);
            SqlDataReader dr2 = cmd2.ExecuteReader();
            if (dr2.Read())
            {
                TextBox3.Text = (dr2["Workshift"].ToString());
                TextBox6.Text = (dr2["Shifttime"].ToString());


            }
           
            con.Close();
        }
    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {
        if (TextBox3.Text == "1st Shift")
        {
            TextBox4.Text = "2nd Shift";
            TextBox1.Text = "4pm-12am";
            DropDownList1.SelectedIndex = 1;

        }
        if (TextBox3.Text == "2nd Shift")
        {
            TextBox4.Text = "1st Shift";
            TextBox1.Text = "8am-4pm";
            DropDownList1.SelectedIndex = 2;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && TextBox4.Text != "" && TextBox5.Text != "" && TextBox2.Text != "")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Employee_Table SET Shiftid='" + (int.Parse(DropDownList1.SelectedIndex.ToString()) + 1) + "'WHERE Employee_id='" + TextBox5.Text + "'", con);
                cmd.ExecuteNonQuery();
                Response.Write("Shift Changed Successfully");
                con.Close();


            }
            else
            {
                Response.Write("Some fields are empty");
            }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox4.Text = "";
        TextBox1.Text = "";
        con.Open();
        string sqlSelectQuery2 = "SELECT * FROM empshift WHERE Shiftid = "+(int.Parse(DropDownList1.SelectedIndex.ToString())+1) ;
        SqlCommand cmd2 = new SqlCommand(sqlSelectQuery2, con);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        if (dr2.Read())
        {
            TextBox4.Text = (dr2["Workshift"].ToString());
            TextBox1.Text = (dr2["Shifttime"].ToString());


        }

        con.Close();
    }
}