using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class kqtimKiem : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["DAN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string key = Request.QueryString["tengiay"];
        cn1.Open();

        SqlDataAdapter da = new SqlDataAdapter("select *from GIAY where dbo.fuConvertToUnsign1(TENGIAY) like N'%' +dbo.fuConvertToUnsign1('" + key+ "')+'%'", cn1);
        DataSet ds = new DataSet();
        da.Fill(ds, "GIAY");

        DataList1.DataSource = ds.Tables["GIAY"];
        DataList1.DataBind();
        cn1.Close();

    }
}