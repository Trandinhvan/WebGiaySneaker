using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Puma : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["DAN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        cn1.Open();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM  GIAY WHERE MAHANG='G03'", cn1);
        DataSet ds = new DataSet();
        da.Fill(ds, "GIAY");

        DataList1.DataSource = ds.Tables["GIAY"];
        DataList1.DataBind();
        cn1.Close();
    }

    protected void ImageButton1_Command(object sender, CommandEventArgs e)
    {
        string magiay = e.CommandArgument.ToString();
        cn1.Open();
        String strcmd = "Insert into GIOHANG(MAGIAY,SOLUONG)values(@magiay,@soluong)";
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn1;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strcmd;

        SqlParameter par = cmd.CreateParameter();
        par.ParameterName = "@magiay";
        par.Value = magiay;
        cmd.Parameters.Add(par);

        SqlParameter par1 = cmd.CreateParameter();
        par1.ParameterName = "@soluong";
        par1.Value = 1;
        cmd.Parameters.Add(par1);
        int rs = cmd.ExecuteNonQuery();
        if (rs == 1)
        {
            String query = "update GIOHANG set TongDON=SOLUONG*(select GIABAN from GIAY where GIAY.MAGIAY=GIOHANG.MAGIAY)";
            SqlCommand cmd1 = new SqlCommand();
            cmd.Connection = cn1;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strcmd;
            cn1.Close();
        }
    }
}