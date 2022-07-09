<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_DonDatSan.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_DonDatSan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <asp:ListView ID="ListView1" runat="server"
            DataKeyNames="id"
            InsertItemPosition="FirstItem"
            OnItemInserting="ListView1_ItemInserting"
            OnItemDeleting="ListView1_ItemDeleting"
            OnItemUpdating="ListView1_ItemUpdating"
            OnItemEditing="ListView1_ItemEditing"
            OnItemCanceling="ListView1_ItemCanceling"
            OnItemDataBound="ListView1_ItemDataBound"
            OnPagePropertiesChanging="ListView1_PagePropertiesChanging" >
            <LayoutTemplate>
                <div class="table-responsive">
                    <table runat="server" class="table table-bordered">
                        <tr>
                            <td runat="server" style="">
                                <asp:Button ID="Button2" CssClass="btn btn-outline-dark" runat="server" Text="Duyệt đơn" OnClick="Button2_Click" />
                                <asp:Button ID="Button1" CssClass="btn btn-outline-dark" runat="server" Text="Xóa nhiều" OnClick="Button1_Click" />
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" class="table table-bordered s13" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"> </th>
                                        <th runat="server">ID</th>
                                        <th runat="server">Tên sân</th>
                                        <th runat="server">Loại sân</th>
                                        <th runat="server">Ngày thuê</th>
                                        <th runat="server">Thời gian bắt đầu</th>
                                        <th runat="server">Thời gian kết thúc</th>
                                        <th runat="server">Tên khách hàng</th>
                                        <th runat="server">Số điện thoại</th>
                                        <th runat="server">Trạng thái</th>
                                        <th runat="server">Ngày đăng ký</th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
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
            <ItemTemplate>
                <tr style="">
                   <td><asp:CheckBox ID="CheckBox1" runat="server" /></td>
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="tensanLabel" runat="server" Text='<%# Eval("tensan") %>' />
                    </td>
                    <td>
                        <asp:Label ID="tenloaisanLabel" runat="server" Text='<%# Eval("tenloaisan") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ngaythueLabel" runat="server" Text='<%# Eval("ngaythue") %>' />
                    </td>
                    <td>
                        <asp:Label ID="timeStarLabel" runat="server" Text='<%# Eval("timeStar") %>' />
                    </td>
                    <td>
                        <asp:Label ID="timeOverLabel" runat="server" Text='<%# Eval("timeOver") %>' />
                    </td>
                    <td>
                        <asp:Label ID="tenkhachhangLabel" runat="server" Text='<%# Eval("tenkhachhang") %>' />
                    </td>
                    <td>
                        <asp:Label ID="sdtLabel" runat="server" Text='<%# Eval("sdt") %>' />
                    </td>
                    <td>
                        <asp:Label ID="trangthaiLabel" runat="server" Text='<%# Eval("duyet") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ngaydkLabel" runat="server" Text='<%# Eval("ngaydk") %>' />
                    </td>
                    <td>
                        <asp:Label ID="giaLabel" runat="server" Text='<%# Eval("TongGia") %>' />
                    </td>
                    <td style="padding:5px">
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="" ><i class="fas fa-edit"></i></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td></td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        <%--<asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>--%>
                    </td>
                    <td>
                        <asp:TextBox ID="ngaythueTextBox" TextMode="Date" runat="server" Text='<%# Bind("ngaythue") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="timeStarTextBox" TextMode="Time" runat="server" Text='<%# Bind("timeStar") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="timeOverTextBox" TextMode="Time" runat="server" Text='<%# Bind("timeOver") %>' />
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        <%--<asp:TextBox ID="sdtLabel" runat="server" Text='<%# Bind("sdt") %>' />--%>
                    </td>
                    <td>
                        <%--<asp:TextBox ID="sdtLabel" runat="server" Text='<%# Bind("sdt") %>' />--%>
                    </td>
                    <td>
                        <%--<asp:TextBox ID="ngaydkLabel" runat="server" Text='<%# Bind("ngaydk") %>' />--%>
                    </td>
                    <td>
                        <asp:TextBox ID="giaTextBox" runat="server" Text='<%# Bind("TongGia") %>' />
                    </td>
                    <td style="padding:5px">
                        <asp:linkButton ID="InsertButton" runat="server" CommandName="Insert"><i class="fas fa-save"></i></asp:linkButton>
                        <asp:linkbutton  ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:linkbutton>
                    </td>
                </tr>
            </InsertItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td></td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        <%--<asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>--%>
                    </td>
                    <td>
                        <asp:TextBox ID="ngaythueTextBox" TextMode="Date" runat="server" Text='<%# Bind("ngaythue") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="timeStarTextBox" TextMode="Time" runat="server" Text='<%# Bind("timeStar") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="timeOverTextBox" TextMode="Time" runat="server" Text='<%# Bind("timeOver") %>' />
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        <%--<asp:TextBox ID="sdtLabel" runat="server" Text='<%# Bind("sdt") %>' />--%>
                    </td>
                    <td>
                        <%--<asp:TextBox ID="sdtLabel" runat="server" Text='<%# Bind("sdt") %>' />--%>
                    </td>
                    <td>
                        <%--<asp:TextBox ID="ngaydkLabel" runat="server" Text='<%# Bind("ngaydk") %>' />--%>
                    </td>
                    <td style="padding:5px">
                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" ><i class="fas fa-save"></i></asp:LinkButton>
                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:LinkButton>
                    </td>
                </tr>
            </EditItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
