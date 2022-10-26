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

public partial class SocietyPaymentM : System.Web.UI.Page
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
            GenerateID();
            BindMember();
            BindRoleRptr();
            
           // GenerateDate();
        }
    }

   /* private void GenerateDate()
    {
        string date = string.Format(DateTime.Now.ToString("dd-MM-yyyy"));
        txtGenerationDate.Text = date;
         
    }*/
    private void GenerateID()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select Max(BillNo) from SocietyPaymentTable", con);
            con.Open();
            rdr = cmd.ExecuteReader();
            string newId = string.Format("PAY-{0}-0001", DateTime.Now.Year);
            if (rdr.HasRows)
            {
                string prefix = string.Format("PAY-{0}", DateTime.Now.Year);
                while (rdr.Read())
                {

                    string maxId = rdr[0].ToString();
                    if (!string.IsNullOrWhiteSpace(maxId) && maxId.StartsWith(prefix))
                    {
                        int count = Convert.ToInt32(maxId.Split('-')[2]);
                        newId = string.Format("PAY-{0}-{1:0000}", DateTime.Now.Year, count + 1);
                    }
                }
            }
            txtBillNo.Text = newId;
            con.Close();
        }
    }

    private void BindMember()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from MemberTable", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlMemberName.DataSource = dt;
                ddlMemberName.DataTextField = "Name";
                ddlMemberName.DataValueField = "Name";
                ddlMemberName.DataBind();
                ddlMemberName.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string strQuery = "insert into SocietyPaymentTable(BillNo,MemberId,MemberName,BillDate,GenerationDate,Amount,Status,Details) values (@BillNo,@MemberId,@MemberName,@BillDate,@GenerationDate,@Amount,@Status,@Details)";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@BillNo", SqlDbType.VarChar).Value = txtBillNo.Text;
            cmd.Parameters.Add("@MemberId", SqlDbType.NVarChar).Value = lblMemberId.Text;
            cmd.Parameters.Add("@MemberName", SqlDbType.NVarChar).Value = ddlMemberName.Text;
            cmd.Parameters.Add("@BillDate", SqlDbType.NVarChar).Value = txtBillDate.Text;
            cmd.Parameters.Add("@GenerationDate", SqlDbType.NVarChar).Value = txtGenerationDate.Text;
            cmd.Parameters.Add("@Amount", SqlDbType.NVarChar).Value = txtAmount.Text;
            cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = "Pending";
            cmd.Parameters.Add("@Details", SqlDbType.NVarChar).Value = txtDetails.Text;
            InsertUpdateData(cmd);
            Clear();
            BindRoleRptr();
            string message = "Bill generation successfully!!";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
        //Response.Redirect("SocietyPaymentM.aspx");
    }

    private void BindRoleRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from SocietyPaymentTable order By Id asc", con))
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
        ddlMemberName.Text = null;
        txtAmount.Text = "";
        txtBillDate.Text = "";
        txtDetails.Text = "";
        txtGenerationDate.Text = "";
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

    protected void ddlMemberName_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(CS);
        SqlCommand cmd = new SqlCommand();
        con.Open();
        string myquery = null;
        myquery = "select * from MemberTable Where Name ='" + ddlMemberName.SelectedItem.Text + "'";
        SqlDataAdapter da = new SqlDataAdapter(myquery, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        lblMemberId.Text = dt.Rows[0]["Id"].ToString();
        
        txtAmount.Text = getAmountText(lblMemberId.Text).ToString();
        txtDetails.Text = "Mothly Maintenance";

    }
    

    public int getAmountText(String memID)
    {
        string myquery = "SELECT MT.[TotalMember], HT.[HouseType] FROM [dbo].[MemberTable] as MT, [dbo].[HouseTable] as HT WHERE HT.[Id] = MT.[SocietyId] AND MT.[Id]="+memID+";";
        SqlConnection con = new SqlConnection(CS);
        SqlCommand cmd = new SqlCommand(myquery,con);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        String HType = (String)dt.Rows[0]["HouseType"];
        int x = (int)HType.ToCharArray()[0] - 48;
        int y = 100 + ((x - 1) * 20);
        int tot = (int)dt.Rows[0]["TotalMember"] * y;
        return tot;
    }
    

    
}