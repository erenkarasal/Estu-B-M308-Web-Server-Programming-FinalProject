<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dafault.aspx.cs" Inherits="Notitia.Admin.dafault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        *{
            margin:0;
            padding:0;
            border:0;
        }

        .auto-style1 {
            height: 114px;
        }

    </style>
</head>
<body style="background-color:#e1e1e1">
    <form id="form1" runat="server">
        <div style="background-color:#2a595c;color:#fff" class="auto-style1">
            <div style="float:left;width:250px;margin-top:20px;">Username: <asp:TextBox ID="username_textBox" runat="server" Height="25px"></asp:TextBox></div>
            <div style="float:left;width:250px;margin-top:20px;">Password: <asp:TextBox ID="password_textBox" runat="server" Height="25px" TextMode="Password"></asp:TextBox></div>
            <div style="float:left;width:250px;margin-top:20px;">
                <asp:Button ID="login_btn" runat="server" Text="Login" Height="25px" Width="90px" OnClick="login_btn_Click" />
            </div>
            <div style="float:right;width:250px;margin-top:20px;text-align:right;">
                <asp:Label ID="lbl_info" runat="server" Text="Admin Panel" ForeColor="white"></asp:Label>
            </div>
              <div style="float:right;width:250px;margin-top:20px;text-align:right;">
                <asp:Label ID="Label1" runat="server" Text="We use sessions , please input username:eren password:1234 for default login" ForeColor="white"></asp:Label>
            </div>

        </div>
    </form>
</body>
</html>
