<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Edit_Announcements.aspx.cs" Inherits="Notitia.Admin.Edit_Announcements" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 84%;
        }
        .auto-style2 {
            width: 263px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1" style="text-align: right">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Announcements Title:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txt_edit_announcement" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Announcements Content:</td>
            <td style="text-align: left">
                 <div>
                            <asp:TextBox ID="txtCKEditor_edit_announcements" runat="server" TextMode="MultiLine" Columns="60" Rows="10" class="ckeditor" Width="402px"></asp:TextBox>
                        </div>
                        <script>
                            $(document).ready(function () {
                                //txtCKEditor is id of the textbox
                                CKEDITOR.replace('txtCKEditor_edit_announcements');
                            })
                        </script>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="btn_edit_acnnouncement" runat="server" Text="Edit" Height="33px" OnClick="btn_edit_acnnouncement_Click" Width="64px" />
            </td>
        </tr>
    </table>
</asp:Content>
