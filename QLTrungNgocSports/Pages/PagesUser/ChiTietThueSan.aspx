<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/_Layout.Master" AutoEventWireup="true" CodeBehind="ChiTietThueSan.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesUser.ChiTietThueSan" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-bordered border-primary table-responsive-md">
        <tr>
            <th>Giờ:</th>
            <% for (int i = 0; i < 24; i++)
                { %>
                <th style="text-align:center;"><% Response.Write(i); %>h - <%Response.Write(i + 1); %>h<%i++; %> </th>
            <%} %>
        </tr>
        <tr>
            <td><strong>Trạng thái</strong></td>
            <%  QLTrungNgocSports.QLTrungNgocSportsService sv = new QLTrungNgocSports.QLTrungNgocSportsService();
                int idSan;
                idSan = int.Parse(Session["idSan"].ToString());
                for (int i = 0; i < 24; i++)
                { %>
                <td style="text-align:center;">
                    <% 
                        DateTime Ngay = DateTime.Now.Date;//new DateTime(2020, 6, 7);
                        String Tu, Den;
                        Tu = i.ToString() + ":00:00";
                        Den = (i + 1).ToString() + ":00:00";
                        Response.Write(sv.DemSoDonDatSan(idSan, Ngay, Tu, Den));
                        %>
                    <% i++; %>
                </td>
            <%} %>
        </tr>
    </table>
    <asp:TextBox ID="TextBox1" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-dark" Text="Tìm" OnClick="Button1_Click" />
    <br />
    <div style="margin:30px auto;width:60%;">
        <table class="table table-borderless">
            <tr>
                <td>Chọn ngày thuê</td>
                <td><asp:TextBox ID="TextBox2" AutoPostBack="true" OnTextChanged="TextBox2_TextChanged" runat="server" TextMode="Date"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Bắt đầu từ</td>
                <td><asp:TextBox ID="TextBox3" AutoPostBack="true" OnTextChanged="TextBox3_TextChanged" TextMode="Time" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Kết thúc vào</td>
                <td><asp:TextBox ID="TextBox4" AutoPostBack="true" OnTextChanged="TextBox4_TextChanged" TextMode="Time" runat="server"></asp:TextBox></td>
            </tr>
            <tr><td><h5 style="color:red;"><asp:Label ID="Gia" runat="server" Text=""></asp:Label></h5></td></tr>
            <tr>
                <td colspan="2" style="text-align:center;"><asp:Button ID="Button2" CssClass="btn btn-outline-danger" runat="server" Text="Đăng ký thuê" OnClick="Button2_Click" /></td>
            </tr>
        </table>
        
    </div>
    
</asp:Content>
