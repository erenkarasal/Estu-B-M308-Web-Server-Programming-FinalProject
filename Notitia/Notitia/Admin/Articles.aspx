<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="Notitia.Admin.Articles" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 200px;
        }

        .auto-style3 {
            width: 200px;
            height: 24px;
        }

        .auto-style4 {
            height: 24px;
        }

        .auto-style5 {
            width: 339px;
        }

        .auto-style6 {
            height: 23px;
            width: 700px;
        }

        .auto-style7 {
            width: 218px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height: 25px; background-color: #2a595c;">
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_open_articlePage" runat="server" Text="+" Width="30px" OnClick="btn_open_articlePage_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_close_articlePage" runat="server" Text="-" Width="30px" OnClick="btn_close_articlePage_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Article Add Panel
        </div>
        <asp:Panel ID="pnl_article_add" runat="server">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">Caetgory:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList_category" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">Title:</td>
                    <td>
                        <asp:TextBox ID="article_title_txtbox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">Summary:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="article_summary_txtbox" runat="server" Height="100px" TextMode="MultiLine" Width="616px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">Content:</td>
                    <td>
                        <div>
                            <asp:TextBox ID="txtCKEditor" runat="server" TextMode="MultiLine" Columns="60" Rows="10" class="ckeditor"></asp:TextBox>
                        </div>
                        <script>
                            $(document).ready(function () {
                                //txtCKEditor is id of the textbox
                                CKEDITOR.replace('txtCKEditor');
                            })
                        </script>
                    </td>
                </tr>
                <%-- <tr>
                    <td class="auto-style2" style="text-align: right">Slider</td>
                    <td>
                        <asp:FileUpload ID="slider_fileUpload" runat="server" />
                    </td>
                </tr>--%>
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td>
                        <asp:Button ID="btn_article_add" runat="server" Text="Add" Height="34px" Width="87px" OnClick="btn_article_add_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <div style="background-color: black; height: 20px;"></div>

        <div style="height: 25px; background-color: #2a595c;">
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_article_edit_open" runat="server" Text="+" Width="30px" OnClick="btn_article_edit_open_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_article_edit_close" runat="server" Text="-" Width="30px" OnClick="btn_article_edit_close_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Article Edit Panel
        </div>
        <asp:Panel ID="pnl_article_edit" runat="server">
            <asp:DataList ID="DataList_Articles" runat="server" Width="699px">
                <HeaderTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style5">Article Name</td>
                            <td>-Edit-</td>
                            <td>-Delete-</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style5">
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("article_title") %>'></asp:Literal>
                            </td>
                            <td>
                                <a href="EditArticle.aspx?article_Id=<%#Eval("article_Id")%>">Edit</a>

                            </td>
                            <td>
                                <a href="Articles.aspx?article_Id=<%#Eval("article_Id") %>&issue=delete">Delete
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>

        <div style="background-color: black;" class="auto-style6"></div>



        <div style="height: 25px; background-color: #2a595c;">
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_folder_pnl_open" runat="server" Text="+" Width="30px" OnClick="btn_folder_pnl_open_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_folder_pnl_close" runat="server" Text="-" Width="30px" OnClick="btn_folder_pnl_close_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Article Edit Panel
        </div>
        <asp:Panel ID="pnl_article_add_folder" runat="server">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style7" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7" style="text-align: right">Folder:</td>
                    <td>
                        <asp:FileUpload ID="FileUpload_extra_folder" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7" style="text-align: right">&nbsp;</td>
                    <td>
                        <asp:Button ID="btn_add_extra_folder" runat="server" Text="Add" Width="93px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7" style="text-align: right">Note:</td>
                    <td>We will add file like add/folders/addingFolder.(exe , excel, pdf et)</td>
                </tr>
            </table>
        </asp:Panel>
    </div>

</asp:Content>
