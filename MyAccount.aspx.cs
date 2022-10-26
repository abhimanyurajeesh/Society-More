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
public partial class MyAccount : System.Web.UI.Page
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
            if (Session["NAME"] != null)
            {
                LoadData();
            }
            else
            {
                Response.Redirect("MLogin.aspx");
            }
        }
    }
    private void LoadData()
    {
        string sql = "select * from MemberTable where Id='" + Session["Id"].ToString() + "'";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        SqlDataAdapter adpt = new SqlDataAdapter(sql, con.ConnectionString);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        txtFullName.Text = dt.Rows[0]["Name"].ToString();
        txtEmail.Text = dt.Rows[0]["Email"].ToString();
        txtMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
        txtSocietyName.Text = dt.Rows[0]["SocietyName"].ToString();
        txtBlockNo.Text = dt.Rows[0]["BlockNo"].ToString();
    }

    
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString);
        con.Open();
        string myquery = null;
        myquery = "Update MemberTable Set Name='" + txtFullName.Text + "',Email='" + txtEmail.Text + "',MobileNo='" + txtMobileNo.Text + "',SocietyName='" + txtSocietyName.Text + "',BlockNo='" + txtBlockNo.Text + "' Where Id='" + Session["Id"].ToString() + "'";
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = myquery;
        cmd.ExecuteNonQuery();
    }
     
}