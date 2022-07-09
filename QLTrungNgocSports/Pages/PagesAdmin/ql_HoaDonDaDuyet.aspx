<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_HoaDonDaDuyet.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_HoaDonDaDuyet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_HoaDon"
        InsertItemPosition="FirstItem"
        OnItemInserting="ListView1_ItemInserting"
        OnItemDeleting="ListView1_ItemDeleting"
        OnItemUpdating="ListView1_ItemUpdating"
        OnItemEditing="ListView1_ItemEditing"
        OnItemCanceling="ListView1_ItemCanceling"
        OnItemDataBound="ListView1_ItemDataBound"
        OnPagePropertiesChanging="ListView1_PagePropertiesChanging">
        <EditItemTemplate>
            <tr style="">
                <td runat="server"></td>
                <td>
                    <asp:TextBox ID="id_HoaDonTextBox" runat="server" Text='<%# Bind("id_HoaDon") %>' />
                </td>
                <td>
                    <asp:TextBox ID="id_KhachHangTextBox" runat="server" Text='<%# Bind("id_KhachHang") %>' />
                </td>
                <td>
                    <asp:TextBox ID="id_NhanVienTextBox" runat="server" Text='<%# Bind("id_NhanVien") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TrangThaiTextBox" runat="server" Text='<%# Bind("TrangThai") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NgayDatTextBox" TextMode="Date" runat="server" Text='<%# Bind("NgayDatSanPham") %>' />
                </td>
                <td>
                    <asp:TextBox ID="unlog_TenKhachHangTextBox" runat="server" Text='<%# Bind("unlog_TenKhachHang") %>' />
                </td>
                <td>
                    <asp:TextBox ID="unlog_SoDienThoaiKhachHangTextBox" runat="server" Text='<%# Bind("unlog_SoDienThoaiKhachHang") %>' />
                </td>
                <td>
                    <asp:TextBox ID="unlog_DiaChiKhachHangTextBox" runat="server" Text='<%# Bind("unlog_DiaChiKhachHang") %>' />
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Update" ><i class="fas fa-save"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td runat="server"></td>
                <td>
                    <asp:TextBox ID="id_HoaDonTextBox" runat="server" Text='<%# Bind("id_HoaDon") %>' />
                </td>
                <td>
                    <asp:TextBox ID="id_KhachHangTextBox" runat="server" Text='<%# Bind("id_KhachHang") %>' />
                </td>
                <td>
                    <asp:TextBox ID="id_NhanVienTextBox" runat="server" Text='<%# Bind("id_NhanVien") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TrangThaiTextBox" runat="server" Text='<%# Bind("TrangThai") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NgayDatTextBox" TextMode="Date" runat="server" Text='<%# Bind("NgayDatSanPham") %>' />
                </td>
                <td>
                    <asp:TextBox ID="unlog_TenKhachHangTextBox" runat="server" Text='<%# Bind("unlog_TenKhachHang") %>' />
                </td>
                <td>
                    <asp:TextBox ID="unlog_SoDienThoaiKhachHangTextBox" runat="server" Text='<%# Bind("unlog_SoDienThoaiKhachHang") %>' />
                </td>
                <td>
                    <asp:TextBox ID="unlog_DiaChiKhachHangTextBox" runat="server" Text='<%# Bind("unlog_DiaChiKhachHang") %>' />
                </td>
                <td style="padding:5px">
                    <asp:linkButton ID="LinkButton3" runat="server" CommandName="Insert"><i class="fas fa-save"></i></asp:linkButton>
                    <asp:linkbutton  ID="Linkbutton4" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:linkbutton>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <table>
                        <tr>
                            <td><asp:CheckBox ID="CheckBox1" runat="server" /></td>
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
                <td style="padding:5px">
                    <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Edit" Text="" ><i class="fas fa-edit"></i></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <div class="table-responsive">
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <asp:Button ID="Button2" OnClick="Button2_Click" CssClass="btn btn-outline-danger" runat="server" Text="Xóa đơn" />
                        </td>
                    </tr>
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
                                    <th runat="server"></th>
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
</asp:Content>
