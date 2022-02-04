<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="EditArticle.aspx.cs" Inherits="Notitia.Admin.EditArticle" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 298px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2" style="text-align: right">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">Title:</td>
            <td>
                <asp:TextBox ID="txt_edit_title" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">Summary:</td>
            <td>
                <asp:TextBox ID="txt_edit_summary" runat="server" Height="104px" Width="525px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">Content:
                 
            </td>
            <td>
                <div>
                    <asp:TextBox ID="txtCKEditor_edit" runat="server" TextMode="MultiLine" Columns="60" Rows="10" class="ckeditor" Width="525px"></asp:TextBox>
                </div>
                <script>
                    $(document).ready(function () {
                        //txtCKEditor is id of the textbox
                        CKEDITOR.replace('txtCKEditor_edit');
                    })
                </script>
            </td>
        </tr>
          <tr>
            <td class="auto-style2" style="text-align: right">Slider:</td>
            <td>
                <asp:FileUpload ID="FileUpload_edit_slider" runat="server" />
            </td>
        </tr>
     <%--   <tr>
            <td class="auto-style2" style="text-align: right">Comment Counter:</td>
            <td>
                <asp:TextBox ID="txt_edit_commentCounter" runat="server"></asp:TextBox>
            </td>
        </tr>--%>
        <tr>
            <td class="auto-style2" style="text-align: right">&nbsp;</td>
            <td>
                <asp:Button ID="btn_edit_article" runat="server" Height="36px" Text="Edit" Width="102px" OnClick="btn_edit_article_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
