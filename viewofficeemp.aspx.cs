using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class viewofficeemp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string stmt = "SELECT COUNT(*) FROM dbo.Employee_table";
        int count = 0;

        using (SqlConnection thisConnection = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30"))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                count = (int)cmdCount.ExecuteScalar();
            }
        }
        Label6.Text = count.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String mycon = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30";
        String myquery = "select Employee_id,Employee_name,Address,Salary,Role,BirthDate,Gender,convert(varchar, cast(convert(varchar(10),Dateofjoin, 110) as date), 106) as Dateofjoin,Contactno,PreviousExp,Shiftid from Employee_Table where month(Dateofjoin)=" + DropDownList1.SelectedItem.Value + " and year(Dateofjoin)=" + TextBox3.Text;
        SqlConnection con = new SqlConnection(mycon);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView3.DataSource = ds;
        GridView3.DataBind();
        con.Close();
    }
}