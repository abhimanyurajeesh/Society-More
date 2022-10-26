using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["UEMAIL"] != null && Request.Cookies["PWD"] != null)
            {
                txtEmail.Text = Request.Cookies["UEMAIL"].Value;
                txtPassword.Attributes["value"] = Request.Cookies["PWD"].Value;
                CheckBox1.Checked = true;
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from UserTable where Email='" + txtEmail.Text + "' and Password='" + txtPassword.Text + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                Session["ID"] = dt.Rows[0]["Id"].ToString();
                Session["MAIL"] = dt.Rows[0]["Email"].ToString();
                Session["NAME"] = dt.Rows[0]["Name"].ToString();
               
                if (CheckBox1.Checked)
                {
                    Response.Cookies["UEMAIL"].Value = txtEmail.Text;
                    Response.Cookies["PWD"].Value = txtPassword.Text;

                    Response.Cookies["UEMAIL"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
                }
                else
                {
                    Response.Cookies["UEMAIL"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
                }
                Response.Redirect("AdminDashBoard.aspx");
            }
            else
            {
                string message = "Invalid Email or Password !";
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