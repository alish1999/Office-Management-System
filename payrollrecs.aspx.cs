using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class payrollrecs : System.Web.UI.Page
{
    private decimal totalsalary = (decimal)0.0;
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
        Label6.Text =count.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String mycon = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30";
        String myquery = "select Employee_Table.Employee_id,Employee_Table.Employee_name,Employee_Table.Salary,Officepayroll.Allowances,Officepayroll.Tax,Officepayroll.PF,Officepayroll.Leavededuction,Officepayroll.Netsalary,convert(varchar, cast(convert(varchar(10),Officepayroll.Paymentdate, 110) as date), 106) as Paymentdate from  Employee_Table INNER JOIN Officepayroll ON Employee_Table.Employee_id = Officepayroll.Emp_ID where month(Paymentdate)=" + DropDownList1.SelectedItem.Value + " and year(Paymentdate)=" + TextBox3.Text;
        // String myquery = "select Emp_ID,Employeename,Basicsalary,Allowances,Tax,PF,Leavededuction,Netsalary,convert(varchar, cast(convert(varchar(10),Paymentdate, 110) as date), 106) as Paymentdate from Officepayroll where month(Paymentdate)=" + DropDownList1.SelectedItem.Value + " and year(Paymentdate)=" + TextBox3.Text;
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
    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            totalsalary += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Netsalary"));
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[7].Text = totalsalary.ToString();
        }
    }
}