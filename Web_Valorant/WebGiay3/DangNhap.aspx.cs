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

public partial class DangNhap : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DAN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btn_dangNhap_Click(object sender, EventArgs e)
    {
        string user1 = text_user.Text;
        string pass = text_pass.Text;
        cn1.Open();
        SqlDataAdapter da = new SqlDataAdapter("select *from account where userName='"+user1+"' and pass='"+pass+"' ", cn1);
        DataSet ds = new DataSet();
        da.Fill(ds, "account");
        string count_row = ds.Tables["account"].Rows.Count.ToString();
         int rs = int.Parse(count_row);
         
        if (rs >=1)
        {
            Response.Write(rs);

            Response.Redirect("Home.aspx?id=" + user1 + "");
            cn1.Close();
        }
        else
        {
            lb_thongbao.Text = "Sai tài khoản hoặc mật khẩu!";
        }
    }
}