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


public partial class PollingBoothM : System.Web.UI.Page
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

    private Boolean InsertUpdateData(SqlCommand cmd)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    private void Clear()
    {
        txtPollDescription.Text = "";
        txtPollTopics.Text = "";
    }

    private void BindRoleRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from PollingBoothTable order By Id asc", con))
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strQuery = "insert into PollingBoothTable(PollTopics,PollDescription,Status) values (@PollTopics,@PollDescription,@Status)";
        SqlCommand cmd = new SqlCommand(strQuery);
        cmd.Parameters.Add("@PollTopics", SqlDbType.VarChar).Value = txtPollTopics.Text;
        cmd.Parameters.Add("@PollDescription", SqlDbType.NVarChar).Value = txtPollDescription.Text;
        cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = "Active";
        InsertUpdateData(cmd);
        Clear();
        BindRoleRptr();
        string message = "New Polling Booth added successfully!!";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("<script type = 'text/javascript'>");
        sb.Append("window.onload=function(){");
        sb.Append("alert('");
        sb.Append(message);
        sb.Append("')};");
        sb.Append("</script>");
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
    }
}