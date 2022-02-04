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
    public partial class Articles : System.Web.UI.Page
    {
        SQL_Connect connect = new SQL_Connect();
        string article_Id = "";
        string issue = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"]==null)
            {
                Response.Redirect("dafault.aspx");
            }

            article_Id = Request.QueryString["article_Id"];
            issue = Request.QueryString["issue"];

            if (issue == "delete")
            {
                SqlCommand delete_article = new SqlCommand("delete from Article where article_Id='"+article_Id+"'", connect.Connect());
                delete_article.ExecuteNonQuery();
            }

            if (Page.IsPostBack == false)
            {
                pnl_article_add.Visible = false;
                pnl_article_edit.Visible = false;
                pnl_article_add_folder.Visible = false;

                //Category getting
                SqlCommand get_category = new SqlCommand("select * from Category",connect.Connect());
                SqlDataReader dr_get_Category = get_category.ExecuteReader();

                DropDownList_category.DataTextField = "category_name";
                DropDownList_category.DataValueField = "category_Id";

                DropDownList_category.DataSource = dr_get_Category;
                DropDownList_category.DataBind();

                //Article Getting
                SqlCommand get_article = new SqlCommand("Select * from Article" , connect.Connect());
                SqlDataReader dr_get_article = get_article.ExecuteReader();

                DataList_Articles.DataSource = dr_get_article;
                DataList_Articles.DataBind();



            }
        }

        protected void btn_open_articlePage_Click(object sender, EventArgs e)
        {
            pnl_article_add.Visible = true;
        }

        protected void btn_close_articlePage_Click(object sender, EventArgs e)
        {
            pnl_article_add.Visible = false;
        }

        protected void btn_article_add_Click(object sender, EventArgs e)
        {
            SqlCommand cmd_add_article = new SqlCommand("insert into Article(article_title,article_summary,article_content,category_Id) Values('" + article_title_txtbox.Text + "','" + article_summary_txtbox.Text + "','" + txtCKEditor.Text + "','" + DropDownList_category.SelectedValue + "')", connect.Connect());
            cmd_add_article.ExecuteNonQuery();

            Response.Redirect("AdminPanel.aspx");

            //Bu article content den sonra eklenmeli
            //,article_photo


            // Bu values içinde photo kısmına gelmeli 
            // ,'/Assets/Slider_images/" + slider_fileUpload.FileName + "',  


            //try
            //{
            //    if (slider_fileUpload.HasFile==true)
            //    {
            //        slider_fileUpload.SaveAs(Server.MapPath("/Assets/Slider_images/" + slider_fileUpload.FileName));


            //    }
            //    else
            //    {
            //        btn_article_add.Text = "Add image!!";
            //    }
            //}
            //catch (Exception ex)
            //{
            //    txtCKEditor.Text = ex.ToString();
            //}



        }

        protected void btn_article_edit_open_Click(object sender, EventArgs e)
        {
            pnl_article_edit.Visible = true;
        }

        protected void btn_article_edit_close_Click(object sender, EventArgs e)
        {
            pnl_article_edit.Visible = false;
        }

        protected void btn_folder_pnl_open_Click(object sender, EventArgs e)
        {
            pnl_article_add_folder.Visible = true;
        }

        protected void btn_folder_pnl_close_Click(object sender, EventArgs e)
        {
            pnl_article_add_folder.Visible = false;

        }

        protected void btn_add_extra_folder_Click(object sender, EventArgs e)
        {
            if (FileUpload_extra_folder.HasFile)
            {
                FileUpload_extra_folder.SaveAs(Server.MapPath("/Assets/Extra_Folders/"+FileUpload_extra_folder.FileName));
                Response.Redirect("Articles.aspx");         
            }
            else
            {
                btn_add_extra_folder.Text = "Please select folder!!";
            }
        }
    }
}