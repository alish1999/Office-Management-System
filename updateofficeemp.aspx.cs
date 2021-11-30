using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class updateofficeemp : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void textBox1_TextChanged(object sender, EventArgs e)
    {
        con.Open();
        string sqlSelectQuery = "SELECT * FROM Employee_Table WHERE Employee_id = " + int.Parse(textBox1.Text);
        SqlCommand cmd = new SqlCommand(sqlSelectQuery, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            textBox2.Text = (dr["Employee_name"].ToString());
            textBox3.Text = (dr["Address"].ToString());
            textBox4.Text = (dr["Salary"].ToString());
            DropDownList1.Text = (dr["Role"].ToString());
            textBox5.Text = (dr["BirthDate"].ToString());
            DropDownList2.Text = (dr["Gender"].ToString());
            textBox6.Text = (dr["Dateofjoin"].ToString());
            textBox7.Text = (dr["Contactno"].ToString());
            DropDownList3.Text = (dr["PreviousExp"].ToString());
        }
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (textBox2.Text != "" && textBox3.Text != "" && textBox1.Text != "" && textBox4.Text != "" && DropDownList1.Text != "" && DropDownList2.Text != "" && textBox7.Text != "" && textBox5.Text != "" && textBox6.Text != "" && DropDownList3.Text != "" && textBox5.Text != "")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Employee_Table SET Employee_name='" + textBox2.Text + "',Address='" + textBox3.Text + "',Salary='" + textBox4.Text + "',Role='" + DropDownList1.Text + "',BirthDate='" + textBox5.Text + "',Gender='" + DropDownList2.Text + "',Dateofjoin='" + textBox6.Text + "',Contactno='" + textBox7.Text + "',PreviousExp='" + DropDownList3.Text + "'WHERE Employee_id='" + textBox1.Text + "'", con);
            cmd.ExecuteNonQuery();
            Response.Write("Record Updated Successfully");
            con.Close();

        }
        else
        {
            Response.Write("Some fields are empty");
        }
    }
}