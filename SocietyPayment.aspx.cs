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

public partial class SocietyPayment : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
    SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRoleRptr();
        }
    }

    private void BindRoleRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {   try
            {
                using (SqlCommand cmd = new SqlCommand("select * from SocietyPaymentTable Where MemberId='" + Session["ID"].ToString() + "' order By Id asc", con))
                {
                    int count = Convert.ToInt32(com.ExecuteScalar());
                    if (count > 0)
                    {
                        string message = "No Payment Details";
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append("<script type = 'text/javascript'>");
                        sb.Append("window.onload=function(){");
                        sb.Append("alert('");
                        sb.Append(message);
                        sb.Append("')};");
                        sb.Append("</script>");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

                        return;
                    }
                    else
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dtBrands = new DataTable();
                            sda.Fill(dtBrands);
                            RepeaterUser.DataSource = dtBrands;
                            RepeaterUser.DataBind();
                        }
                }
            }
            catch (Exception er)
            {
                Response.Write(er.Message);
                
             Console.WriteLine(er.Message); 
        }
        }
    }

}