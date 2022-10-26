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
using System.Collections.Specialized;
using System.Text;
using System.Data.SqlClient;

public partial class Vote : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
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
            string id = Request.QueryString["ID"].ToString();
            string sql = "select * from PollingBoothTable where Id='" + id + "'";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            SqlDataAdapter adpt = new SqlDataAdapter(sql, con.ConnectionString);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            txtPollTopics.Text = dt.Rows[0]["PollTopics"].ToString();
            txtPollDescription.Text = dt.Rows[0]["PollDescription"].ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["ID"].ToString();
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlConnection con1 = new SqlConnection(connStr);
            con1.Open();
            str = "select count(*) from Votetable where MemberId='" + Session["Id"].ToString() + "' and PollId='"+ id +"'";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string message = "Your Already Voted The Candidates Please Check Your My Votes Page";
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
            {
                SqlCommand cmd = new SqlCommand("insert into Votetable(PollId,PollTopics,PollDescription,PollOptions,MemberId,MemberName) values('" + id + "','" + txtPollTopics.Text + "','" + txtPollDescription.Text + "','" + ddlPollOptions.Text + "','" + Session["ID"].ToString() + "','" + Session["NAME"].ToString() + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("PollingBooth.aspx");
            }
        }
    }
}