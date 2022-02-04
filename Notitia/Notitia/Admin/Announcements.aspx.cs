using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Notitia.Admin
{
    public partial class Announcements : System.Web.UI.Page
    {
        SQL_Connect connect = new SQL_Connect();
        string announcements_Id = "";
        string issue = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("dafault.aspx");
            }
            announcements_Id = Request.QueryString["announcements_Id"];
            issue = Request.QueryString["issue"];

            if (issue=="delete")
            {
                SqlCommand delete_announcement = new SqlCommand("Delete from Announcements where announcements_Id='"+announcements_Id+"'", connect.Connect());
                delete_announcement.ExecuteNonQuery();
            }
            if (Page.IsPostBack == false)
            {
                pnl_announcement_add.Visible = false;
                pnl_announcement_edit.Visible = false;
                //Get announcements

                SqlCommand get_announcement = new SqlCommand("Select * from Announcements" , connect.Connect());
                SqlDataReader dr_get_announcement = get_announcement.ExecuteReader();

                DataList_get_announcement.DataSource = dr_get_announcement;
                DataList_get_announcement.DataBind();
            }



        }

        protected void btn_announcement_open_Click(object sender, EventArgs e)
        {
            pnl_announcement_add.Visible = true;
        }

        protected void btn_announcement_close_Click(object sender, EventArgs e)
        {
            pnl_announcement_add.Visible = false;
        }

        protected void btn_announcement_add_Click(object sender, EventArgs e)
        {
            SqlCommand add_announcment = new SqlCommand("insert into Announcements(announcements_title,announcements_content) Values('"+txt_announcement_title.Text+"', '"+txtCKEditor_announcement.Text+"') ", connect.Connect());
            add_announcment.ExecuteNonQuery();

            Response.Redirect("Announcements.aspx");
        }

        protected void btn_announcement_edit_open_Click(object sender, EventArgs e)
        {
            pnl_announcement_edit.Visible = true;
        }

        protected void btn_announcement_edit_close_Click(object sender, EventArgs e)
        {
            pnl_announcement_edit.Visible = false;

        }
    }
}