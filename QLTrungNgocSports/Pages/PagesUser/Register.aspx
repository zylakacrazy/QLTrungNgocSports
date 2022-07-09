<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/_Layout.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesUser.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card" style="margin:40px auto;background-color:aliceblue;width:60%;">
            <div class="row card-body" style="margin:40px auto;">
                <h2 class="card-title text-center" style="padding:10px; color:darkgreen">ĐĂNG KÝ TÀI KHOẢN</h2>
                <div class="col">
                    <div class="mb-3">
                        <label for="TextBox1" class="form-label">Tên đăng nhập</label>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="TextBox2" class="form-label">Mật khẩu</label>
                        <asp:TextBox TextMode="Password" CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="TextBox2" class="form-label">Tên khách hàng</label>
                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="RadioButton1" class="form-label">Giới tính</label><br />
                        <asp:RadioButton ID="RadioButton1" Text="Nam" GroupName="gioiTinh" runat="server" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="RadioButton2" Text="Nữ" GroupName="gioiTinh" runat="server" />
                    </div>
                </div>
                <div class="col">
                    <div class="mb-3">
                        <label for="TextBox3" class="form-label">Số điện thoại</label>
                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="TextBox3" class="form-label">Ngày sinh</label>
                        <asp:TextBox ID="TextBox5" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="TextBox3" class="form-label">Địa chỉ</label>
                        <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="TextBox3" class="form-label">Email</label>
                        <asp:TextBox ID="TextBox7" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <asp:Button CssClass="btn-dangky" ID="Button1" runat="server" Text="ĐĂNG KÝ" OnClick="Button1_Click" />
            </div>
        </div>
       
    </div>
</asp:Content>
