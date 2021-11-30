using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class officeleave : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30");
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            con.Open();
            string sqlSelectQuery = "SELECT * FROM Employee_Table WHERE Employee_id = " + int.Parse(TextBox1.Text);
            SqlCommand cmd = new SqlCommand(sqlSelectQuery, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                TextBox2.Text = (dr["Employee_name"].ToString());

            }
            con.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO officeleaves VALUES('" + TextBox1.Text + "','" + DropDownList1.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')", con);
        cmd.ExecuteNonQuery();
        Response.Write("Leave registered");

        con.Close();
    }
    
}