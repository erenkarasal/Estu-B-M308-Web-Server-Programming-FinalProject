<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="Notitia.Admin.EditCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 244px;
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
        <td class="auto-style2" style="text-align: right">Category Name</td>
        <td>
            <asp:TextBox ID="ctgry_edit_name_txtbox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" style="text-align: right">Category Number</td>
        <td>
            <asp:TextBox ID="ctgry_edit_number_txtbox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" style="text-align: right">Category Count</td>
        <td>
            <asp:TextBox ID="ctgry_edit_count_txtbox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" style="text-align: right">&nbsp;</td>
        <td>
            <asp:Button ID="edit_category_btn" runat="server" OnClick="edit_category_btn_Click" Text="Edit" />
        </td>
    </tr>
</table>
</asp:Content>
