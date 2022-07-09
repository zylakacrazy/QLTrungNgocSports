<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/_Layout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesUser.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin:20px auto;">
        <div class="card" style="width:50%;margin:20px auto;">
            <div class="card-header">
                <h3 style="font-weight:bold;font-family:Arial;">LOGIN</h3>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="TextBox1" class="form-label">Tên đăng nhập</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="TextBox2" class="form-label">Tên đăng nhập</label>
                    <asp:TextBox ID="TextBox2" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Button CssClass="btn-dangky" ID="Button1" runat="server" Text="Đăng nhập" OnClick="Button1_Click" />
                <a href="#" class="font1">Quên mật khẩu?</a>
            </div>
        </div>
    </div>
</asp:Content>
