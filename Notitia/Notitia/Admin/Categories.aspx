<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="Notitia.Admin.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 370px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height: 25px; background-color: #2a595c;">
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_open" runat="server" Text="+" Width="30px" OnClick="btn_open_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_close" runat="server" Text="-" Width="30px" OnClick="btn_close_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Category Add Panel
        </div>
        <asp:Panel ID="pnl_category_add" runat="server">
            <table class="auto-style1" style="background-color: #669999">
                <tr>
                    <td style="text-align: right">Category Name:<br />
                        Category Queue:<br />
                        <br />
                        <br />
                    </td>
                    <td>
                        <br />
                        <asp:TextBox ID="ctgry_name" runat="server"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="ctgry_queue" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="ctgry_add_btn" runat="server" Text="Add" OnClick="ctgry_add_btn_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>



        <div style="height: 30px; background-color: black;"></div>


        <div style="height: 25px; background-color: #2a595c;">
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_changing_open" runat="server" Text="+" Width="30px" OnClick="btn_changing_open_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_changing_close" runat="server" Text="-" Width="30px" OnClick="btn_changing_close_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Category Changing Panel
        </div>
        <asp:Panel ID="pnl_ctgry_changing" runat="server">
            <asp:DataList ID="DataList_categories" runat="server" Width="666px" OnSelectedIndexChanged="DataList_categories_SelectedIndexChanged">
                <HeaderTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">Category Name</td>
                            <td>-Edit-</td>
                            <td>-Delete-</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("category_name") %>'></asp:Literal>
                            </td>
                            <td>
                                <a href="EditCategory.aspx?category_Id=<%#Eval("category_Id")%>">Edit</a>
                                

                            </td>
                            <td>
                                <a href="Categories.aspx?category_Id=<%#Eval("category_Id")%>&issue=delete">Delete
                                </a>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>

        <div style="height: 30px; background-color: black;"></div>



    </div>
</asp:Content>
