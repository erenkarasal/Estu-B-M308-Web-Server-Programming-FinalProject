<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Announcements.aspx.cs" Inherits="Notitia.Admin.Announcements"ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style3 {
            width: 316px;
        }

        .auto-style4 {
            margin-left: 82;
        }

        .auto-style5 {
            width: 365px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height: 25px; background-color: #2a595c;">
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_announcement_open" runat="server" Text="+" Width="30px" OnClick="btn_announcement_open_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_announcement_close" runat="server" Text="-" Width="30px" OnClick="btn_announcement_close_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Announcement Add Panel
        </div>
        <asp:Panel ID="pnl_announcement_add" runat="server">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">Announcement Title:</td>
                    <td>
                        <asp:TextBox ID="txt_announcement_title" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">Announcement Content:</td>
                    <td>
                        <div>
                            <asp:TextBox ID="txtCKEditor_announcement" runat="server" TextMode="MultiLine" Columns="60" Rows="10" class="ckeditor" CssClass="auto-style4" Width="495px"></asp:TextBox>
                        </div>
                        <script>
                            $(document).ready(function () {
                                //txtCKEditor is id of the textbox
                                CKEDITOR.replace('txtCKEditor_announcement');
                            })
                        </script>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">&nbsp;</td>
                    <td>
                        <asp:Button ID="btn_announcement_add" runat="server" Height="35px" Text="Add" Width="85px" OnClick="btn_announcement_add_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>

        <div style="background-color: black; height: 20px;"></div>


        <div style="height: 25px; background-color: #2a595c;">
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_announcement_edit_open" runat="server" Text="+" Width="30px" OnClick="btn_announcement_edit_open_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_announcement_edit_close" runat="server" Text="-" Width="30px" OnClick="btn_announcement_edit_close_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Announcement Edit Panel
        </div>
        <asp:Panel ID="pnl_announcement_edit" runat="server">
            <asp:DataList ID="DataList_get_announcement" runat="server" Width="699px">
                <HeaderTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style5">Announcement Title</td>
                            <td>-Edit-</td>
                            <td>-Delete-</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style5">
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("announcements_title") %>'></asp:Literal>
                            </td>
                            <td>
                                <a href="Edit_Announcements.aspx?announcements_Id=<%#Eval("announcements_Id") %>">Edit</a></td>
                            <td>
                                <a href="Announcements.aspx?announcements_Id=<%#Eval("announcements_Id") %>&issue=delete">Delete</a></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>

        <div style="background-color: black; height: 20px;"></div>


    </div>
</asp:Content>
