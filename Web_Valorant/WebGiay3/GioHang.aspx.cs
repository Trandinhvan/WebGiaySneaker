using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

public partial class GioHang : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DAN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        load_data();

    }
    protected void load_data()
    {
        cn1.Open();
        SqlDataAdapter da = new SqlDataAdapter("select *from dbo.fu_GIOHANG()", cn1);
        DataSet ds = new DataSet();
        da.Fill(ds, "fu_GIOHANG()");
        grdContent.DataSource = ds.Tables["fu_GIOHANG()"];
        grdContent.DataBind();
        cn1.Close();
    }
    protected void grdContent_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int i =e.RowIndex;
        String id = grdContent.Rows[i].Cells[0].Text;
        cn1.Open();
        String query = "delete GIOHANG where MAGIAY='"+id+"'";
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn1;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = query;
        cmd.ExecuteNonQuery();
        cn1.Close();
        load_data();
    }
   
}