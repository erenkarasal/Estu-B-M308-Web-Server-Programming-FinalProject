using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Notitia.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        SQL_Connect connect = new SQL_Connect();
        string category_Id = "";
        string issue = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("dafault.aspx");
            }
            category_Id = Request.QueryString["category_Id"];
            issue = Request.QueryString["issue"];
            if(issue=="delete")
            {
                SqlCommand cmd_delete = new SqlCommand("delete from Category where category_Id='"+category_Id+"' ",connect.Connect());
                cmd_delete.ExecuteNonQuery();
            }

            if (Page.IsPostBack == false)
            {
                pnl_category_add.Visible = false;
                pnl_ctgry_changing.Visible = false;
            }
            //Category get set 
            SqlCommand cmd_cat_get = new SqlCommand("select * from Category ", connect.Connect());
            SqlDataReader dr = cmd_cat_get.ExecuteReader();
            DataList_categories.DataSource = dr;
            DataList_categories.DataBind();
        }

        protected void btn_open_Click(object sender, EventArgs e)
        {
            pnl_category_add.Visible = true;
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            pnl_category_add.Visible = false;
        }

        protected void ctgry_add_btn_Click(object sender, EventArgs e)
        {
            SqlCommand cmd_cat_add = new SqlCommand("insert into Category(category_name,category_number) Values('" + ctgry_name.Text + "','" + ctgry_queue.Text + "')", connect.Connect());
            cmd_cat_add.ExecuteNonQuery();
            Response.Redirect("Categories.aspx");

        }

        protected void btn_changing_open_Click(object sender, EventArgs e)
        {
            pnl_ctgry_changing.Visible = true;
        }

        protected void btn_changing_close_Click(object sender, EventArgs e)
        {
            pnl_ctgry_changing.Visible = false;
        }

        protected void DataList_categories_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}