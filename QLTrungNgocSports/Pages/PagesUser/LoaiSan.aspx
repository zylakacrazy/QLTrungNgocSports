<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/_Layout.Master" AutoEventWireup="true" CodeBehind="LoaiSan.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesUser.LoaiSan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:DataList ID="DataList1" RepeatColumns="2" runat="server">
        <ItemTemplate>
            <div class="card" style="margin:30px 30px;text-align:center">
                <div class="card-body">
                    <asp:ImageButton CssClass="card-img-top" OnClick="ImageButton1_Click" Height="260px" Width="500px" ImageUrl='<%# Eval("hinh") %>' ID="ImageButton1" runat="server"></asp:ImageButton>
                    <asp:Label runat="server" ID="Label1" CssClass="product-Name" Text='<%# Eval("tensan") %>'></asp:Label>
                    <asp:Label Visible="false" runat="server" ID="idSan" Text='<%# Eval("id") %>'></asp:Label>
                </div>
                <div class="card-footer" style="text-align:center">
                    <asp:Label runat="server" ID="Label2" CssClass="product-Price" Text='<%# Eval("dongia","{0:0,0}")+"đ" %>'></asp:Label>
                    (1 trận/ 1 giờ)
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    </div>
</asp:Content>
