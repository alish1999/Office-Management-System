using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class allleaves : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      /*  DateTime d1 = DateTime.Parse("2020-04-23");
        DateTime d2 = DateTime.Parse("2020-05-1");
        Response.Write((d2-d1).TotalDays);*/

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String mycon = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30";
        String myquery = "select Employee_Table.Employee_id,Employee_Table.Employee_name,Leavetype,convert(varchar, cast(convert(varchar(10), officeleaves.Leavefrom, 110) as date), 106) as Leavefrom,convert(varchar,cast(convert(varchar(10), officeleaves.Leavetill,110)as date),106) from  Employee_Table INNER JOIN officeleaves ON Employee_Table.Employee_id = officeleaves.Employee_id where month(Leavefrom)=" + DropDownList1.SelectedItem.Value + " and year(Leavefrom)=" + TextBox3.Text;

        //String myquery = "select Employee_Table.Employee_id,Employee_Table.Employee_name,Leavetype,convert(varchar, cast(convert(varchar(10), officeleaves.Leavefrom, 110) as date), 106) as Leavefrom,Leavetill from  Employee_Table INNER JOIN officeleaves ON Employee_Table.Employee_id = officeleaves.Employee_id where month(Leavefrom)=" + DropDownList1.SelectedItem.Value + " and year(Leavefrom)=" + TextBox3.Text;
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