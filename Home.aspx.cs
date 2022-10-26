using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;
public partial class Home : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
    SqlDataReader rdr;    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["NAME"] != null)
        {
            lblUserName.Text = Session["NAME"].ToString();
        }
        else
        {
            Response.Redirect("MLogin.aspx");
        }
    }

    protected void btnRentPrice_Click(object sender, EventArgs e)
    {
 
    }
     
    protected void btnSellPrice_Click(object sender, EventArgs e)
    {
       
    }
}