using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;
public partial class DeleteUserPage : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
    SqlDataReader rdr;

    protected void Page_Load(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string Id = Request.QueryString["Id"].ToString();
                if (Session["Id"].ToString() == Id)
                {
                    string message = "Email Id already register";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    Response.Redirect("UserPage.aspx");
                    return;

                }
                else
                {

                    string Id1 = Request.QueryString["Id"].ToString();
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete from UserTable where Id='" + Id1 + "'", con);
                    cmd.ExecuteNonQuery(); ;
                    Response.Redirect("UserPage.aspx");
                }
        }
    }
}