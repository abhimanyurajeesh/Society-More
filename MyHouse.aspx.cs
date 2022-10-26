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

public partial class MyHouse : System.Web.UI.Page
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
        try
        {
            string sql = "select * from MemberTable where Id='" + Session["Id"].ToString() + "'";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            SqlDataAdapter adpt = new SqlDataAdapter(sql, con.ConnectionString);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            txtSocietyName.Text = dt.Rows[0]["SocietyName"].ToString();
            txtBlockNo.Text = dt.Rows[0]["BlockNo"].ToString();
            BlockNo();
        }
       
            catch (Exception ex)
        { Console.WriteLine(ex.Message); }
    
    }

    private void BlockNo()
    {
        try
        {
            string sql = "select * from HouseTable where SocietyName='" + txtSocietyName.Text + "' And BlockNo ='" + txtBlockNo.Text + "'";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            SqlDataAdapter adpt = new SqlDataAdapter(sql, con.ConnectionString);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            txtHouseType.Text = dt.Rows[0]["HouseType"].ToString();
            txtBlock.Text = dt.Rows[0]["NoOfHouse"].ToString();
            txtDetails.Text = dt.Rows[0]["Details"].ToString();
        }

        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }
}