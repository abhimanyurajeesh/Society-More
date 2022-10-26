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

public partial class FacilityBook : System.Web.UI.Page
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
            BindSociety();
            BindRoleRptr();
        }
    }

    private void BindSociety()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from SocietyTable", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlSocietyName.DataSource = dt;
                ddlSocietyName.DataTextField = "SocietyName";
                ddlSocietyName.DataValueField = "SocietyName";
                ddlSocietyName.DataBind();
                ddlSocietyName.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string strQuery = "insert into FacilityBookTable(FacilityName,FacilityTimeFrom,FacilityTimeTill,FacilityDateFrom,FacilityDateTill,SocietyName,Descrpition,Status,MemberId,MemberName) values (@FacilityName,@FacilityTimeFrom,@FacilityTimeTill,@FacilityDateFrom,@FacilityDateTill,@SocietyName,@Descrpition,@Status,@MemberId,@MemberName)";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@FacilityName", SqlDbType.VarChar).Value = txtFacilityName.Text;
            cmd.Parameters.Add("@FacilityTimeFrom", SqlDbType.NVarChar).Value = txtFacilityTimeFrom.Text;
            cmd.Parameters.Add("@FacilityTimeTill", SqlDbType.NVarChar).Value = txtFacilityTimeTill.Text;
            cmd.Parameters.Add("@FacilityDateFrom", SqlDbType.NVarChar).Value = txtFacilityDateFrom.Text;
            cmd.Parameters.Add("@FacilityDateTill", SqlDbType.NVarChar).Value = txtFacilityDateTill.Text;
            cmd.Parameters.Add("@SocietyName", SqlDbType.NVarChar).Value = ddlSocietyName.Text;
            cmd.Parameters.Add("@Descrpition", SqlDbType.NVarChar).Value = txtDescrpition.Text;
            cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = "Pending";
            cmd.Parameters.Add("@MemberId", SqlDbType.NVarChar).Value = Session["ID"].ToString();
            cmd.Parameters.Add("@MemberName", SqlDbType.NVarChar).Value = Session["NAME"].ToString();
            InsertUpdateData(cmd);
            Clear();
            BindRoleRptr();
            string message = "Your request has been sent successfully!!";
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

    private void BindRoleRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from FacilityBookTable Where MemberId ='"+ Session["ID"].ToString() +"' order By Id asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {

                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    RepeaterUser.DataSource = dtBrands;
                    RepeaterUser.DataBind();
                }
            }
        }
    }

    private void Clear()
    {
        txtFacilityName.Text = null;
        txtDescrpition.Text = "";
        txtFacilityDateFrom.Text = "";
        txtFacilityDateTill.Text = "";
        txtFacilityTimeFrom.Text = "";
        txtFacilityTimeTill.Text = "";
        txtFacilityName.Text = "";
        txtUsageGuidance.Text = "";
        ddlSocietyName.Text = null;
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

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
}