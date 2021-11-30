using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    private Boolean checkno()
    {
        Boolean phoneavailable = false;
        String mycon = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30";
        String myquery = "Select * from Employee_Table where Contactno='" + textBox7.Text + "'";
        SqlConnection con = new SqlConnection(mycon);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            phoneavailable = true;

        }
        con.Close();

        return phoneavailable;
    }
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30");
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter("SELECT max(cast(Employee_id as int))+1 from Employee_Table", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        textBox1.Text = dt.Rows[0][0].ToString();
        con.Close();


    }
    public void idgen()
    {

        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter("SELECT max(cast(Employee_id as int))+1 from Employee_Table", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        textBox1.Text = dt.Rows[0][0].ToString();
        con.Close();


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (checkno() != true)
        {
            String a = textBox7.Text;
            int i = a.Length;
            if (i == 10)
            {
                if (textBox2.Text != "" && textBox5.Text != "" && textBox3.Text != "" && textBox4.Text != "" && DropDownList1.Text != "" && DropDownList2.Text != "")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Employee_Table VALUES('" + textBox1.Text + "','" + textBox2.Text + "','" + textBox3.Text + "','" + textBox4.Text + "','" + DropDownList1.Text + "','" + textBox5.Text + "','" + DropDownList2.Text + "','" + textBox6.Text + "','" + textBox7.Text + "','" + DropDownList3.Text + "','1')", con);
                    cmd.ExecuteNonQuery();
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Record Inserted Successfully');", true);

                    con.Close();

                    Session["ValueID"] = textBox1.Text.ToString();
                    Response.Redirect("shiftnew.aspx");

                }
                else
                {
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('FILL ALL THE FIELDS');", true);
                }
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('invalid phone no.');", true);

            }
        }
        else
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('THIS NUMBER IS ALREADY BEING USED BY ANOTHER EMPLOYEE');", true);

    }
    

    }


