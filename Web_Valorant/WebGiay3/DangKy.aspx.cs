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


public partial class DangKy : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DAN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_dangNhap_Click(object sender, EventArgs e)
    {
        string user = text_user.Text;
        string pass = text_confirm.Text;
        cn1.Open();
        String strcmd = "insert into account values(@user,@pass)";
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn1;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strcmd;

        SqlParameter par = cmd.CreateParameter();
        par.ParameterName = "@user";
        par.Value = user;
        cmd.Parameters.Add(par);

        SqlParameter par1 = cmd.CreateParameter();
        par1.ParameterName = "@pass";
        par1.Value = pass;
        cmd.Parameters.Add(par1);
        int rs = cmd.ExecuteNonQuery();
        Response.Write(rs);
        if (rs == 1)
        {
            
            string user1 = text_user.Text;
            Response.Redirect("DangNhap.aspx?user=" + user1 + "");
            cn1.Close();
        }
    }
}