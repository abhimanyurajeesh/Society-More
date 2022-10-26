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

public partial class AdminProfile : System.Web.UI.Page
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
                BindImageRptr();
                LoadData();
            }
            else
            {
                Response.Redirect("LoginPage.aspx");
            }
        }
    }

    private void LoadData()
    {
        string sql = "select * from UserTable where Id='" + Session["Id"].ToString() + "'";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        SqlDataAdapter adpt = new SqlDataAdapter(sql, con.ConnectionString);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        txtFullName.Text = dt.Rows[0]["Name"].ToString();
        txtEmail.Text = dt.Rows[0]["Email"].ToString();
        txtMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
    }

    private void BindImageRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from UserTable Where Id='" + Session["Id"].ToString() + "' order By Id asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    RepeaterImage.DataSource = dtBrands;
                    RepeaterImage.DataBind();
                }

            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString);
        con.Open();
        string myquery = null;
        myquery = "Update UserTable Set Name='" + txtFullName.Text + "',Email='" + txtEmail.Text + "',MobileNo='" + txtMobileNo.Text + "' Where Id='" + Session["Id"].ToString() + "'";
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = myquery;
        cmd.ExecuteNonQuery();
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string filePath = FileUpload1.PostedFile.FileName;
        string filename = Path.GetFileName(filePath);
        string ext = Path.GetExtension(filename);
        string contenttype = String.Empty;
        switch (ext)
        {
            case ".jpg":
                contenttype = "image/jpg";
                break;
            case ".png":
                contenttype = "image/png";
                break;
        }
        if (contenttype != String.Empty)
        {
            Stream fs = FileUpload1.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            string strQuery = "Update UserTable Set Image=@Image,ContentType=@ContentType Where Id ='" + Session["Id"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@Image", SqlDbType.Binary).Value = bytes;
            cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contenttype;
            InsertUpdateData(cmd);
            string message = "Image Uploaded successfully!!";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
        string formatError = "File format not recognised. Upload Image formats";
        System.Text.StringBuilder sb1 = new System.Text.StringBuilder();
        sb1.Append("<script type = 'text/javascript'>");
        sb1.Append("window.onload=function(){");
        sb1.Append("alert('");
        sb1.Append(formatError);
        sb1.Append("')};");
        sb1.Append("</script>");
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb1.ToString());
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
            BindImageRptr();
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