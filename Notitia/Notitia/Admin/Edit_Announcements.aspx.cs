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
    public partial class Edit_Announcements : System.Web.UI.Page
    {
        SQL_Connect connect = new SQL_Connect();
        string announcements_Id = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("dafault.aspx");
            }

            announcements_Id = Request.QueryString["announcements_Id"];
            if (Page.IsPostBack == false)
            {
                SqlCommand get_editted_announcement = new SqlCommand("Select * from Announcements where announcements_Id='"+announcements_Id+"'", connect.Connect());
                SqlDataReader dr_get_editted_announcement = get_editted_announcement.ExecuteReader();

                DataTable dt_get_editted_announcement = new DataTable("table");
                dt_get_editted_announcement.Load(dr_get_editted_announcement);
                try
                {
                    DataRow row = dt_get_editted_announcement.Rows[0];
                    txt_edit_announcement.Text = row["announcements_title"].ToString();
                    txtCKEditor_edit_announcements.Text = row["announcements_content"].ToString();
                }
                catch(IndexOutOfRangeException ex)
                {

                }
                catch(NullReferenceException ex)
                {

                }

            }

        }

        protected void btn_edit_acnnouncement_Click(object sender, EventArgs e)
        {
            SqlCommand edit_announcement = new SqlCommand("Update Announcements set announcements_title='"+txt_edit_announcement.Text+ "' , announcements_content='"+txtCKEditor_edit_announcements.Text+ "' where announcements_Id='"+announcements_Id+"'", connect.Connect());
            edit_announcement.ExecuteNonQuery();

            Response.Redirect("Announcements.aspx");
        }
    }
}