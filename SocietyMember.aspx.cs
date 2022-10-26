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

public partial class AllocateHouse : System.Web.UI.Page
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
            BindSociety();
            txtPassword.Text = "12345";
        }
    }

    private void BindSociety()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {try
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
            catch (Exception er)
            {
                Response.Write(er.Message);
            }
        }
    }
    private void BindBlockNo()
    { 
        using (SqlConnection con= new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select * from HouseTable Where SocietyName ='" + ddlSocietyName.SelectedItem.Text + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count !=0)
            {
                ddlBlockNo.DataSource = dt;
                ddlBlockNo.DataTextField = "BlockNo";
                ddlBlockNo.DataValueField = "BlockNo";
                ddlBlockNo.DataBind();
                ddlBlockNo.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string gender = string.Empty;
        if (rbMale.Checked)
        {
            gender = "M";
        }
        else if (rbFemale.Checked)
        {
            gender = "F";
        }
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlConnection con1 = new SqlConnection(CS);
                con1.Open();
                str = "select count(*)from MemberTable where Email='" + txtEmail.Text + "'";
                com = new SqlCommand(str, con1);
                int count = Convert.ToInt32(com.ExecuteScalar());
                if (count > 0)
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
                        txtEmail.Text = "";
                        return;
                }
                else
                {
                        SqlConnection con2 = new SqlConnection(CS);
                        con2.Open();
                        str = "select count(*)from MemberTable where SocietyName='" + ddlSocietyName.SelectedItem.Text + "' And BlockNo='" + ddlBlockNo.SelectedItem.Text + "'";
                        com = new SqlCommand(str, con2);
                        int count1 = Convert.ToInt32(com.ExecuteScalar());
                        if (count1 > 0)
                        {
                            string message = "Society Name and Bloack No Already Alocated to member";
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
                            string strQuery = "insert into MemberTable(Name,Email,Password,MobileNo,Gender,DateOfBirth,SocietyName,BlockNo,TotalMember,SocietyId) values (@Name, @Email, @Password,@MobileNo,@Gender,@DateOfBirth,@SocietyName,@BlockNo,@TotalMember,@SocietyId)";
                            SqlCommand cmd = new SqlCommand(strQuery);
                            cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = txtFullName.Text;
                            cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
                            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = txtPassword.Text;
                            cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = txtMobileNo.Text;
                            cmd.Parameters.Add("@Gender", SqlDbType.Char).Value = gender;
                            cmd.Parameters.Add("@DateOfBirth", SqlDbType.Date).Value = txtDateOfBirth.Text;
                            cmd.Parameters.Add("@SocietyName", SqlDbType.NVarChar).Value = ddlSocietyName.SelectedItem.Text;
                            cmd.Parameters.Add("@BlockNo", SqlDbType.NVarChar).Value = ddlBlockNo.SelectedItem.Text;
                            cmd.Parameters.Add("@TotalMember", SqlDbType.NVarChar).Value = txtTotalMember.Text;
                            cmd.Parameters.Add("@SocietyId", SqlDbType.VarChar).Value = lblSocietyId.Text;
                            InsertUpdateData(cmd);
                            Clear();
                            BindRoleRptr();
                            string message = "New Society Member successfully!!";
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
            }
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
        txtTotalMember.Text = "";
        txtFullName.Text = "";
        txtDateOfBirth.Text = System.DateTime.Today.ToString();
        txtEmail.Text = "";
        txtMobileNo.Text = "";
        txtPassword.Text = "";
    }

    private void BindRoleRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from MemberTable order By Id asc", con))
            {   try
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);
                        RepeaterUser.DataSource = dtBrands;
                        RepeaterUser.DataBind();
                    }
                }
                catch (Exception er)
                {
                    Response.Write(er.Message);
                }
            }
        }
    }
    protected void clear_Click(object sender, EventArgs e)
    {
        txtTotalMember.Text = "";
        txtFullName.Text = "";
        txtDateOfBirth.Text = System.DateTime.Today.ToString();
        txtEmail.Text = "";
        txtMobileNo.Text = "";
        txtPassword.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtTotalMember.Text = "";
        txtFullName.Text = "";
        txtDateOfBirth.Text = System.DateTime.Today.ToString();
        txtEmail.Text = "";
        txtMobileNo.Text = "";
        txtPassword.Text = "";
        Response.Redirect("AdminDashBoard.aspx");
    }
    protected void ddlSocietyName_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindBlockNo();
    }
    protected void ddlBlockNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(CS);
        SqlCommand cmd = new SqlCommand();
        con.Open();
        string myquery = null;
        myquery = "Select * from HouseTable Where SocietyName ='" + ddlSocietyName.SelectedItem.Text + "' And BlockNo ='"+ ddlBlockNo.SelectedItem.Text +"' ";
        SqlDataAdapter da = new SqlDataAdapter(myquery, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        lblSocietyId.Text = dt.Rows[0]["Id"].ToString();
    }
}