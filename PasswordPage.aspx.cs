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

public partial class PasswordPage : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
    SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con1 = new SqlConnection(CS);
        con1.Open();
        str = "select count(*)from MemberTable where Id='" + Session["Id"].ToString() + "' And Password='" + txtCurrentPassword .Text + "'";
        com = new SqlCommand(str, con1);
        int count = Convert.ToInt32(com.ExecuteScalar());
        if (count > 0)
        {
            string strQuery = "Update MemberTable set Password=@Password Where Id=@id ";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@Id", SqlDbType.VarChar).Value = Session["Id"].ToString();
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = txtNewPassword.Text;
            InsertUpdateData(cmd);
            string message = "Password Set Successfully";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            txtConfrimPassword.Text = "";
            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
        }
        else
        {
            string message = "Current Password Not Match..!!";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            txtCurrentPassword.Text = "";
            return;
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

}