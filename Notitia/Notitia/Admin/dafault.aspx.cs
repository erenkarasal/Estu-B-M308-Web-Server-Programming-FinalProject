using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace Notitia.Admin
{
    public partial class dafault : System.Web.UI.Page
    {
        SQL_Connect _connection = new SQL_Connect();
        protected void Page_Load(object sender, EventArgs e)
        {

            

        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from Admin where admin_username='"+username_textBox.Text+"'and admin_pass='"+password_textBox.Text+"'",_connection.Connect());
            SqlDataReader dreader = cmd.ExecuteReader();
            if (dreader.Read())
            {
                Session["admin_username"] = dreader["admin_username"];

                Response.Redirect("Announcements.aspx");
            }
            else
            {
                lbl_info.Text = "Please input a valid information";
            }
        }
    }
}