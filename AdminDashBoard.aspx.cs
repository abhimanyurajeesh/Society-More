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

public partial class AdminDashBoard : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
    SqlDataReader rdr;  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Mail"] != null)
        {
            lblUserName.Text = Session["NAME"].ToString();
            SocietyTotal();
            HouseTotal();
            UserTotal();
            ComplainTotal();
            FaclTotal();
            MembTotal();
            PayTotal();
            VoteTotal();
        }
        else
        {
            Response.Redirect("LoginPage.aspx");
        }
    }


    private void SocietyTotal()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from SocietyTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblSociety.Text = rdr.GetValue(0).ToString();
        else
            lblSociety.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void HouseTotal()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from HouseTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblHouse.Text = rdr.GetValue(0).ToString();
        else
            lblHouse.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();

    }

    private void ComplainTotal()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from ComplainTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblComplain.Text = rdr.GetValue(0).ToString();
        else
            lblComplain.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void UserTotal()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from UserTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblUser.Text = rdr.GetValue(0).ToString();
        else
            lblUser.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void FaclTotal()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from FacilityBookTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblfacl.Text = rdr.GetValue(0).ToString();
        else
            lblfacl.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }
    private void MembTotal()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from MemberTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblmemb.Text = rdr.GetValue(0).ToString();
        else
            lblmemb.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }
    private void PayTotal()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from SocietyPaymentTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblpay.Text = rdr.GetValue(0).ToString();
        else
            lblpay.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }
    private void VoteTotal()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from VoteTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblpol.Text = rdr.GetValue(0).ToString();
        else
            lblpol.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }
}