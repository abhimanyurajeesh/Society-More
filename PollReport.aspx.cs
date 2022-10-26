using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;
using System.Xml.Linq;
using System.Web.Services;
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class PollReportPage : System.Web.UI.Page
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
           // BindPollToipcs();

        }
    }

    private void BindRoleRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from VoteTable order By Id asc", con))
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

        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select DISTINCT PollTopics from VoteTable", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                TxtTopic.DataSource = dt;
                TxtTopic.DataTextField = "PollTopics";
                TxtTopic.DataValueField = "PollTopics";
                TxtTopic.DataBind();
                TxtTopic.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }
    protected void TxtTopic_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            {
                String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
                con = new SqlConnection(CS);
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = "select COUNT(PollOptions) from VoteTable where PollOptions = 'Yes' AND  PollTopics ='" + TxtTopic.SelectedItem.Text + "'";
                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                    TxtYes.Text = rdr.GetValue(0).ToString();
                else
                    TxtYes.Text = "0";
                if ((rdr != null))
                    rdr.Close();
                if (con.State == ConnectionState.Open)
                    con.Close();

            }
            {
                String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
                con = new SqlConnection(CS);
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = "select COUNT(PollOptions) from VoteTable where PollOptions = 'No' AND  PollTopics ='" + TxtTopic.SelectedItem.Text + "' ";
                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                    TxtNo.Text = rdr.GetValue(0).ToString();
                else
                    TxtNo.Text = "0";
                if ((rdr != null))
                    rdr.Close();
                if (con.State == ConnectionState.Open)
                    con.Close();

            }
        }
        catch (Exception ex)
        { Console.WriteLine(ex.Message); }
    }
 
    protected void btnView_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from VoteTable where MemberName LIKE '"+ txtMember.Text + '%' + "' order By Id asc", con))
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
   /* protected void btnView1_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "select COUNT(PollOptions) from VoteTable where PollOptions = 'Yes' ";
        rdr = cmd.ExecuteReader();
       
            if (rdr.Read())
                TxtYes.Text = rdr.GetValue(0).ToString();
            else
                TxtYes.Text = "0";
            if ((rdr != null))
                rdr.Close();
            if (con.State == ConnectionState.Open)
                con.Close();
        
    }*/
  
   

}