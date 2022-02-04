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
    public partial class EditArticle : System.Web.UI.Page
    {
        SQL_Connect connect = new SQL_Connect();
        string article_Id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("dafault.aspx");
            }
            article_Id = Request.QueryString["article_Id"];
            if (Page.IsPostBack == false)
            {
                SqlCommand get_article = new SqlCommand("Select * from Article where article_Id='"+article_Id+"'" , connect.Connect());
                SqlDataReader dr_get_article = get_article.ExecuteReader();

                DataTable d_tbl_article = new DataTable("table");
                d_tbl_article.Load(dr_get_article);

                DataRow row = d_tbl_article.Rows[0];
                txt_edit_title.Text = row["article_title"].ToString();
                txt_edit_summary.Text = row["article_summary"].ToString();
                txtCKEditor_edit.Text = row["article_content"].ToString();
                
                
            }

        }

        protected void btn_edit_article_Click(object sender, EventArgs e)
        {
            if (FileUpload_edit_slider.HasFile)
            {
                FileUpload_edit_slider.SaveAs(Server.MapPath("/Assets/Slider_images/"+FileUpload_edit_slider.FileName));
                SqlCommand edit_articles = new SqlCommand("Update Article Set article_title='"+txt_edit_title.Text+"' , article_summary='"+txt_edit_summary.Text+"', article_content='"+txtCKEditor_edit.Text+"', article_photo='/Assets/Slider_images"+FileUpload_edit_slider.FileName+"'" , connect.Connect());
                edit_articles.ExecuteNonQuery();

                Response.Redirect("Articles.aspx");
            }
            else
            {
                SqlCommand edit_articles = new SqlCommand("Update Article Set article_title='" + txt_edit_title.Text + "' , article_summary='" + txt_edit_summary.Text + "', article_content='" + txtCKEditor_edit.Text + "' ", connect.Connect());
                edit_articles.ExecuteNonQuery();

                Response.Redirect("Articles.aspx");
            }
        }
    }
}