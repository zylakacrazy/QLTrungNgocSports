<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_ThongKe.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_ThongKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList CssClass="btn btn-outline-dark" ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Text="Thống kê theo ngày" Value="1" Selected="True"  />
        <asp:ListItem Text="Thống kê theo tháng" Value="2"  />
    </asp:DropDownList>
    <asp:Label ID="Label6" runat="server" Text="Chọn ngày"></asp:Label>
    <asp:TextBox ID="TextBox1" Visible="true" AutoPostBack="true" TextMode="Date" OnTextChanged="TextBox1_TextChanged" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" Visible="false" runat="server" Text="Doanh thu từ "></asp:Label>
    <asp:TextBox ID="TextBox2" Visible="false" TextMode="Date" runat="server"></asp:TextBox>
    <asp:Label ID="Label5" Visible="false" runat="server" Text="đến"></asp:Label>
    <asp:TextBox ID="TextBox3" Visible="false" TextMode="Date" AutoPostBack="true" OnTextChanged="TextBox3_TextChanged" runat="server"></asp:TextBox>
    <br />
    <h5 style="color:red;"><asp:Label ID="Label1" runat="server"></asp:Label></h5>
    <br />
    <div class="container-fluid">
        <h5 style="color:red"><asp:Label ID="labelDathang" runat="server" Text=""></asp:Label></h5>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_HoaDon"
        OnPagePropertiesChanging="ListView1_PagePropertiesChanging">
        <ItemTemplate>
            <tr style="">
                <td>
                    <table>
                        <tr>
                            <td><a href="#" onclick="redir('<%# Eval("id_HoaDon") %>');">Chi tiết</a></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:Label ID="id1Label" runat="server" Text='<%# Eval("id_HoaDon") %>' />
                </td>
                <td>
                    <asp:Label ID="idkhachhangLabel" runat="server" Text='<%# Eval("id_KhachHang") %>' />
                </td>
                <td>
                    <asp:Label ID="idnhanvienLabel" runat="server" Text='<%# Eval("id_NhanVien") %>' />
                </td>
                <td>
                    <asp:Label ID="trangthaiLabel" runat="server" Text='<%# Eval("TrangThai") %>' />
                </td>
                <td>
                    <asp:Label ID="ngaydatLabel" runat="server" Text='<%# Eval("NgayDatSanPham") %>' />
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("unlog_TenKhachHang") %>' />
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("unlog_SoDienThoaiKhachHang") %>' />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("unlog_DiaChiKhachHang") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <div class="table-responsive">
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="table table-bordered table-hover s13" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">ID</th>
                                    <th runat="server">Họ tên</th>
                                    <th runat="server">Người duyệt</th>
                                    <th runat="server">trạng thái</th>
                                    <th runat="server">Ngày đặt</th>
                                    <th runat="server">Tên khách hàng</th>
                                    <th runat="server">Số điện thoại</th>
                                    <th runat="server">Địa chỉ</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                        ShowNextPageButton="false" />
                                    <asp:NumericPagerField ButtonType="Link" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton = "false" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <script type="text/javascript">
            function redir(id) {
                window.location.href = "ql_CTHD.aspx?id=" + id;                
            }
    </script>
    </div>
    <h5 style="color:red"><asp:Label ID="labelDatSan" runat="server" Text=""></asp:Label></h5>
    <asp:ListView ID="ListView2" OnPagePropertiesChanging="ListView2_PagePropertiesChanging" runat="server" DataKeyNames="id_DonDatSan">
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id_DonDatSan") %>' />
                </td>
                <td>
                    <asp:Label ID="id2Label" runat="server" Text='<%# Eval("id_NhanVien") %>' />
                </td>
                <td>
                    <asp:Label ID="idkhachhangLabel" runat="server" Text='<%# Eval("id_KhachHang") %>' />
                </td>
                <td>
                    <asp:Label ID="idnhanvienLabel" runat="server" Text='<%# Eval("id_San") %>' />
                </td>
                <td>
                    <asp:Label ID="trangthaiLabel" runat="server" Text='<%# Eval("NgayThue") %>' />
                </td>
                <td>
                    <asp:Label ID="ngaydatLabel" runat="server" Text='<%# Eval("ThoiDiemBatDau") %>' />
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ThoiDiemKetThuc") %>' />
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("NgayDatSan") %>' />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("NgayDuyet") %>' />
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("TongGia") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <div class="table-responsive">
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="table table-bordered table-hover s13" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">ID</th>
                                    <th runat="server">Người duyệt</th>
                                    <th runat="server">Khách hàng</th>
                                    <th runat="server">Sân</th>
                                    <th runat="server">Ngày thuê</th>
                                    <th runat="server">Thời điểm bắt đầu</th>
                                    <th runat="server">Thời điểm kết thúc</th>
                                    <th runat="server">Ngày đặt sân</th>
                                    <th runat="server">Ngày duyệt</th>
                                    <th runat="server">Tổng giá</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager2" runat="server" PageSize="4">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                        ShowNextPageButton="false" />
                                    <asp:NumericPagerField ButtonType="Link" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton = "false" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </div>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
