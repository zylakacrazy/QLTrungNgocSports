<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/_Layout.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesUser._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v10.0" nonce="PQ2KKpVP"></script>
    <div class="fb-comments" data-href="https://localhost:44373/Pages/PagesUser/default.aspx" data-width="" data-numposts="5"></div>--%>
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
            <div class="carousel-item active">
                  <img src="../../Images/Banner/1.jpg" class="d-block w-100" alt="banner1"><br />
            </div>
            <%  QLTrungNgocSports.QLTrungNgocSportsService sv = new QLTrungNgocSports.QLTrungNgocSportsService();
            var result = sv.Banner();
            foreach (var item in result)
            { %>
                <div class="carousel-item">
                  <img src='<% Response.Write(item.images.Trim());%>' class="d-block w-100" alt="banner1">
                  <%--<div class="carousel-caption d-none d-md-block">
                    <h5>First slide label</h5>
                    <p>Some representative placeholder content for the first slide.</p>
                  </div>--%>
                </div>
            <%}%>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
    <%--hiển thị sản phẩm--%>
    <h5 style="margin-left:30px;color:brown"><asp:Label ID="Label3" runat="server" ></asp:Label></h5>
    <div class="container-fluid" style="text-align:center;">
        <asp:Repeater ID="Repeater1" runat="server" >
            <ItemTemplate>
                <div class="hvr-float-shadow">
                    <div class="products card">
                         <div class="product card-body">
                             <asp:Label ID="idSP" Visible="false" runat="server" Text='<%# Eval("id_SanPham") %>'></asp:Label>
                             <asp:ImageButton CssClass="card-img-top" Height="200px" Width="200px" ImageUrl='<%# Eval("Images") %>' OnClick="ImageButton1_Click" ID="ImageButton1" runat="server" />
                             <asp:Label ID="Label1" runat="server" CssClass="product-Name" Text='<%# Eval("TenSanPham") %>'></asp:Label>
                             <br />
                             <asp:Label ID="Label2" runat="server" CssClass="product-Price" Text='<%# Eval("GiaSanPham","{0:0,0}")+" VNĐ" %>'></asp:Label>
                         </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <%--hiển thị sản phẩm--%>
</asp:Content>
