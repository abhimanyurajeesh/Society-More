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

public partial class HousePage : System.Web.UI.Page
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
    protected void ddlSocietyName_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(CS);
        SqlCommand cmd = new SqlCommand();
        con.Open();
        string myquery = null;
        myquery = "SELECT * FROM SocietyTable where SocietyName='" + ddlSocietyName.SelectedItem.Text + "'";
        SqlDataAdapter da = new SqlDataAdapter(myquery, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        lblNoOfHouses.Text = dt.Rows[0]["NoOfHouses"].ToString();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlConnection con1 = new SqlConnection(CS);
            con1.Open();
            str = "select Count(SocietyName) from HouseTable where SocietyName='" + ddlSocietyName.SelectedItem.Text + "' Group BY SocietyName HAVING COUNT(Id) = " + lblNoOfHouses.Text + "";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string message = "No House avaible to add";
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
                SqlConnection con2 = new SqlConnection(CS);
                con2.Open();
                str = "select count(*)from HouseTable where  BlockNo='" + txtBlockNo.Text + "' And SocietyName='" + ddlSocietyName.SelectedItem.Text + "'";
                com = new SqlCommand(str, con2);
                int count1 = Convert.ToInt32(com.ExecuteScalar());
                if (count1 > 0)
                {
                    string message = "House Number Already Exit In This SocietyName, Check The Entery Again";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    txtBlockNo.Text = "";
                    return;
                }
                else
                {
                    string strQuery = "insert into HouseTable(SocietyName, NoOfHouse, BlockNo, HouseType , Details) values (@SocietyName, @NoOfHouse, @BlockNo,@HouseType,@Details)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.Add("@SocietyName", SqlDbType.VarChar).Value = ddlSocietyName.SelectedItem.Text;
                    cmd.Parameters.Add("@NoOfHouse", SqlDbType.NVarChar).Value = lblNoOfHouses.Text;
                    cmd.Parameters.Add("@BlockNo", SqlDbType.NVarChar).Value = txtBlockNo.Text;
                    cmd.Parameters.Add("@HouseType", SqlDbType.NVarChar).Value = ddlHouseType.SelectedItem.Text;
                    cmd.Parameters.Add("@Details", SqlDbType.Char).Value = txtDetails.Text;
                    InsertUpdateData(cmd);
                    Clear();
                    string message = "New House added successfully!!";
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
        txtBlockNo.Text = "";
        txtDetails.Text = "";
        ddlSocietyName.Text = null;
        ddlHouseType.SelectedItem.Text = null;
       // ddlSocietyName.SelectedItem.Text = null;
        lblNoOfHouses.Text = "";

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtBlockNo.Text = "";
        txtDetails.Text = "";
        Response.Redirect("AdminDashBoard.aspx");
    }
}