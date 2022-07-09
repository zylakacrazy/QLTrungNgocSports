<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_CTHD.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_CTHD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <a href="javascript:window.history.back();" style="margin:20px 20px;" class="btn btn-dark"><i class="fas fa-arrow-left"></i> Trở về</a>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered"> 
                    <tr>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                    <tr>
                        <td><%# Eval("id") %></td>
                        <td><%# Eval("tensp") %></td>
                        <td><%# Eval("soluong") %></td>
                        <td><%# Eval("tongtien") %></td>
                    </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
