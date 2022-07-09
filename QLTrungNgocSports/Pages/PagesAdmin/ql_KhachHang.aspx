<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_KhachHang.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_KhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_KhachHang"
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
                <td>
                    <asp:Label ID="id_KhachHangLabel1" runat="server" Text='<%# Eval("id_KhachHang") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TenKhachHangTextBox" runat="server" Text='<%# Bind("TenKhachHang") %>' />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem Text="Nam" Value="0" />
                        <asp:ListItem Text="Nữ" Value="1" />
                        <asp:ListItem Text="Khác" Value="3" />
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="SoDienThoaiTextBox" runat="server" Text='<%# Bind("SoDienThoai") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NgaySinhTextBox" TextMode="Date" runat="server" Text='<%# Bind("NgaySinh") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>' />
                </td>
                <td>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="passWordTextBox" runat="server" Text='<%# Bind("passWord") %>' />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Update" ><i class="fas fa-save"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="TenKhachHangTextBox" runat="server" Text='<%# Bind("TenKhachHang") %>' />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Text="Nam" Value="0" />
                        <asp:ListItem Text="Nữ" Value="1" />
                        <asp:ListItem Text="Khác" Value="3" />
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="SoDienThoaiTextBox" runat="server" Text='<%# Bind("SoDienThoai") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NgaySinhTextBox" TextMode="Date" runat="server" Text='<%# Bind("NgaySinh") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>' />
                </td>
                <td>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="passWordTextBox" runat="server" Text='<%# Bind("passWord") %>' />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
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
                    <asp:Label ID="id_KhachHangLabel" runat="server" Text='<%# Eval("id_KhachHang") %>' />
                </td>
                <td>
                    <asp:Label ID="TenKhachHangLabel" runat="server" Text='<%# Eval("TenKhachHang") %>' />
                </td>
                <td>
                    <asp:Label ID="GioiTinhLabel" runat="server" Text='<%# Eval("GioiTinh") %>' />
                </td>
                <td>
                    <asp:Label ID="SoDienThoaiLabel" runat="server" Text='<%# Eval("SoDienThoai") %>' />
                </td>
                <td>
                    <asp:Label ID="NgaySinhLabel" runat="server" Text='<%# Eval("NgaySinh") %>' />
                </td>
                <td>
                    <asp:Label ID="DiaChiLabel" runat="server" Text='<%# Eval("DiaChi") %>' />
                </td>
                <td>
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                </td>
                <td>
                    <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("userName") %>' />
                </td>
                <td>
                    <asp:Label ID="passWordLabel" runat="server" Text='<%# Eval("passWord") %>' />
                </td>
                <td>
                    <asp:Label ID="id_TypeAccountLabel" runat="server" Text='<%# Eval("id_TypeAccount") %>' />
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
                            <table id="itemPlaceholderContainer" class="table table-bordered s13" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">ID</th>
                                    <th runat="server">Họ tên</th>
                                    <th runat="server">Giới tính</th>
                                    <th runat="server">Số điện thoại</th>
                                    <th runat="server">Ngày sinh</th>
                                    <th runat="server">Địa chỉ</th>
                                    <th runat="server">Email</th>
                                    <th runat="server">Username</th>
                                    <th runat="server">Password</th>
                                    <th runat="server">Quyền</th>
                                    <th runat="server"></th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </div>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
