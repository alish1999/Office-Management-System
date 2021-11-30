using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;


public partial class Officepay : System.Web.UI.Page
{
    int totalleaves;
    int bsal, tax;

        int allowance;
        int leaveded;
        int leaves;
        int nsal;
        int pf;
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30");
    protected void leavediff()
    {
        con.Open();
        string sqlSelectQuery = "SELECT Employee_id,convert(varchar, cast(convert(varchar(10), Leavefrom, 110) as date), 106) as Leavefrom,convert(varchar,cast(convert(varchar(10),Leavetill,110)as date),106) as Leavetill FROM officeleaves where month(Leavefrom)=" + DropDownList1.SelectedItem.Value + " and year(Leavefrom)=" + TextBox11.Text + " and Employee_id=" + TextBox1.Text;
        SqlCommand cmd = new SqlCommand(sqlSelectQuery, con);
        SqlDataReader dr = cmd.ExecuteReader();
        
        if (dr.Read())
        {
            DateTime d1 = DateTime.Parse(dr["Leavefrom"].ToString());
            DateTime d2 = DateTime.Parse(dr["Leavetill"].ToString());
            
            totalleaves += int.Parse((d2 - d1).TotalDays.ToString());
            TextBox9.Text = totalleaves.ToString();
            //Leave deduction calculation

            leaves = int.Parse(TextBox9.Text);
            leaveded = leaves * 1000;
            TextBox10.Text = leaveded.ToString();
            //NET SALARY CALCULATION           
            pf = int.Parse(TextBox6.Text);
            nsal = bsal + allowance - tax - pf - leaveded;
            TextBox7.Text = nsal.ToString();
        }

       

    }
    protected void showleave()
    {

        String mycon = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Manish\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30";
        String myquery = "select Employee_Table.Employee_id,Employee_Table.Employee_name,Leavetype,convert(varchar, cast(convert(varchar(10), officeleaves.Leavefrom, 110) as date), 106) as Leavefrom,convert(varchar,cast(convert(varchar(10),Leavetill,110)as date),106) from  Employee_Table INNER JOIN officeleaves ON Employee_Table.Employee_id = officeleaves.Employee_id where month(Leavefrom)=" + DropDownList1.SelectedItem.Value + " and year(Leavefrom)=" + TextBox11.Text + " and Employee_Table.Employee_id=" + TextBox1.Text;
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
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        TextBox9.Text = "0";
        TextBox10.Text = "0";
        calucaltesal();
        TextBox8.Text = DateTime.Now.ToString("yyyy-MM-dd");
        TextBox11.Text = DateTime.Now.ToString("yyyy");
        DropDownList1.SelectedIndex = int.Parse(DateTime.Now.ToString("MM"))-1;
        showleave();
        leavediff();

    }
    protected void TextBox9_TextChanged(object sender, EventArgs e)
    {

        calucaltesal();
    }
    public void calucaltesal()
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

                TextBox3.Text = (dr["Salary"].ToString());
            }
            con.Close();
            
            //taxcalculation          

            bsal = int.Parse(TextBox3.Text);
            if (bsal >= 50000)
            {
                tax = 10;
                tax = (tax * bsal) / 100;
                TextBox5.Text = tax.ToString();
            }
            else if (bsal >= 30000)
            {
                tax = 5;
                tax = (tax * bsal) / 100;
                TextBox5.Text = tax.ToString();
            }
            else
            {
                tax = 0;
                tax = (tax * bsal) / 100;
                TextBox5.Text = tax.ToString();
            }
            //ALLOWANCE CALCULATION

            allowance = bsal / 5;
            TextBox4.Text = allowance.ToString();

            //Leave deduction calculation

            leaves = int.Parse(TextBox9.Text);
            leaveded = leaves * 1000;
            TextBox10.Text = leaveded.ToString();
            //NET SALARY CALCULATION           
            pf = int.Parse(TextBox6.Text);
            nsal = bsal + allowance - tax - pf - leaveded;
            TextBox7.Text = nsal.ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Officepayroll VALUES('" + TextBox1.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox10.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("PAYMENT RECORDED SUCCESSFULLY");

            con.Close();
        }
        catch (Exception)
        {
            
        }
    }
    protected void TextBox8_TextChanged(object sender, EventArgs e)
    {
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        showleave();
        leavediff();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string employeeName = TextBox2.Text;
        int Employeeid = int.Parse(TextBox1.Text);
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[9] {
                            new DataColumn("Employee_Id", typeof(string)),
                            new DataColumn("EmployeeName", typeof(string)),
                            new DataColumn("Salary", typeof(string)),
                            new DataColumn("Allowances", typeof(string)),
                            new DataColumn("Tax", typeof(string)),
        new DataColumn("PF", typeof(string)),
        new DataColumn("Leave deduction", typeof(string)),
        new DataColumn("NetSalary", typeof(string)),
        new DataColumn("Payment_date", typeof(string))});
        dt.Rows.Add(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox10.Text, TextBox7.Text, TextBox8.Text);
        
        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                StringBuilder sb = new StringBuilder();

                //Generate receipt (Bill) Header.
                sb.Append("<table width='100%' cellspacing='1' cellpadding='2'>");
                sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><b>Payment receipt</b></td></tr>");
                sb.Append("<tr><td colspan = '2'></td></tr>");
                sb.Append("<tr><td><b>Employee ID: </b>");
                sb.Append(Employeeid);
                sb.Append("</td><td align = 'right'><b>Date: </b>");
                sb.Append(DateTime.Now);
                sb.Append(" </td></tr>");
                sb.Append("<tr><td colspan = '2'><b>Employee Name: </b>");
                sb.Append(employeeName);
                sb.Append("</td></tr>");
                sb.Append("</table>");
                sb.Append("<br />");

                //Generate receipt (Bill) Items Grid.
                sb.Append("<table border = '1'>");
                sb.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    sb.Append("<th style = 'background-color: #D20B0C;color:#ffffff'>");
                    sb.Append(column.ColumnName);
                    sb.Append("</th>");
                }
                sb.Append("</tr>");
                foreach (DataRow row in dt.Rows)
                {
                    sb.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        sb.Append("<td>");
                        sb.Append(row[column]);
                        sb.Append("</td>");
                    }
                    sb.Append("</tr>");
                }
              
                sb.Append("</tr></table>");

                //Export HTML String as PDF.
                StringReader sr = new StringReader(sb.ToString());
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Receipt_" + Employeeid + ".pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Write(pdfDoc);
                Response.End();
            }
        }
    }
}