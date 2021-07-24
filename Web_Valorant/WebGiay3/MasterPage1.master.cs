using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage1 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void timkiem1(object sender, EventArgs e)
    {
        string key = TextBox1.Text;
        Response.Redirect("kqtimKiem.aspx?tengiay=" + key + "");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string user = Request.QueryString["id"];
        Response.Redirect("GioHang.aspx?user="+user+"");
    }
}
