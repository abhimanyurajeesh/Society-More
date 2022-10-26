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

public partial class ComplainReplay : System.Web.UI.Page
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
           
            BindComplainRptr();
        }
    }

    private void BindComplainRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from ComplainTable Join MemberTable on MemberTable.Id = ComplainTable.MemberId Where ComplainTable.Status='Pending'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    RepeaterSociety.DataSource = dtBrands;
                    RepeaterSociety.DataBind();
                }

            }
        }
    }
    
    protected void btnReplay_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string Id = Request.QueryString["Id"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("Update ComplainTable Set Replay ='" + txtReplay.Text + "',Status='Resolved' where Id='" + Id + "'", con);
            cmd.ExecuteNonQuery(); ;
            Response.Redirect("ComplainPage.aspx");
            
        }
        
    }
    

}