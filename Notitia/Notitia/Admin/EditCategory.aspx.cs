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
    public partial class EditCategory : System.Web.UI.Page
    {
        SQL_Connect connect = new SQL_Connect();
        string category_Id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("dafault.aspx");
            }
            category_Id = Request.QueryString["category_Id"];
            if (Page.IsPostBack==false)
            {
                SqlCommand cmd_category_edit = new SqlCommand("Select * from Category where category_Id='"+category_Id +"'" , connect.Connect());
                SqlDataReader dr_Edit = cmd_category_edit.ExecuteReader();

                DataTable dt_category_edit = new DataTable("table");
                dt_category_edit.Load(dr_Edit);

                DataRow row = dt_category_edit.Rows[0];

                ctgry_edit_name_txtbox.Text = row["category_name"].ToString();
                ctgry_edit_number_txtbox.Text = row["category_number"].ToString();
                ctgry_edit_count_txtbox.Text = row["category_counter"].ToString();


            }
        }

        protected void edit_category_btn_Click(object sender, EventArgs e)
        {
            SqlCommand cmd_category_editting = new SqlCommand("Update Category Set category_name='"+ctgry_edit_name_txtbox.Text+"', category_number='"+ctgry_edit_number_txtbox.Text+"', category_counter='"+ctgry_edit_count_txtbox.Text+"' where category_Id='"+category_Id+"'",connect.Connect());
            cmd_category_editting.ExecuteNonQuery();

            Response.Redirect("Categories.aspx");
        }
    }
}