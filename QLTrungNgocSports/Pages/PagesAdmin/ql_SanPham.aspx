<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_SanPham.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_SanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="fixed-content">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:ListView ID="ListView1" runat="server"
                DataKeyNames="id_SanPham"
                InsertItemPosition="FirstItem"
                OnItemInserting="ListView1_ItemInserting"
                OnItemDeleting="ListView1_ItemDeleting"
                OnItemUpdating="ListView1_ItemUpdating"
                OnItemEditing="ListView1_ItemEditing"
                OnItemCanceling="ListView1_ItemCanceling"
                OnItemDataBound="ListView1_ItemDataBound"
                OnPagePropertiesChanging="ListView1_PagePropertiesChanging">
                <LayoutTemplate>
                    <div class="table-responsive">
                        <table runat="server" class="table table-bordered table-responsive-sm">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" class="table table-bordered s13" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">ID</th>
                                        <th runat="server">Mã sản phẩm</th>
                                        <th runat="server">Tên sản phẩm</th>
                                        <th runat="server">Hình ảnh</th>
                                        <th runat="server">Giá sản phẩm</th>
                                        <th runat="server">Loại sản phẩm</th>
                                        <th runat="server">Hãng</th>
                                        <th runat="server">Mô tả</th>
                                        <th runat="server">Số lượng</th>
                                        <th runat="server"></th>
                                   </tr>
                                   <tr id="itemPlaceholder" runat="server">
                                   </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <%-----------%>
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="2">
                                     <Fields>
                                         <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                         <asp:NumericPagerField />
                                         <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                     </Fields>
                                </asp:DataPager>
                               <%-------------%>
                            </td>
                        </tr>
                    </table>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr style="" onclick="redir('<%# Eval("id_SanPham") %>');">
                        <td>
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id_SanPham") %>' />
                        </td>
                        <td>
                            <asp:Label ID="masanphamLabel" runat="server" Text='<%# Eval("MaSanPham") %>' />
                        </td>
                        <td>
                            <asp:Label ID="tensanphamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' />
                        </td>
                        <td>
                            <asp:Image ID="hinhLabel"  ImageUrl='<%# Eval("Images") %>' Width="100px" Height="100px" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="giasanphamLabel" runat="server" Text='<%# Eval("GiaSanPham") %>' />
                        </td>
                        <td>
                            <asp:Label ID="loaisanphamLabel" runat="server" Text='<%# Eval("id_LoaiSanPham") %>' />
                        </td>
                        <td>
                            <asp:Label ID="hangsanxuatLabel" runat="server" Text='<%# Eval("id_HangSanXuat") %>' />
                        </td>
                        <td>
                            <asp:Label ID="motaLabel" runat="server" Text='<%# Eval("MoTa") %>' />
                        </td>
                        <td>
                            <asp:Label ID="soluongLabel" runat="server" Text='<%# Eval("SoLuong") %>' />
                        </td>
                        <td style="padding:5px">
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="" ><i class="fas fa-edit"></i></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="masanphamTextBox" runat="server" Text='<%# Bind("MaSanPham") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="tensanphamTextBox" runat="server" Text='<%# Bind("TenSanPham") %>' />
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUpload1"  runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="giasanphamTextBox" runat="server" Text='<%# Bind("GiaSanPham") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="motaTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("MoTa") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="soluongTextBox" TextMode="Number" runat="server" Text='<%# Bind("SoLuong") %>' />
                        </td>
                        <td style="padding:5px;display:inline;">
                            <asp:linkButton ID="InsertButton" runat="server" CommandName="Insert"><i class="fas fa-save"></i></asp:linkButton>
                            <asp:linkbutton  ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:linkbutton>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="masanphamTextBox" runat="server" Text='<%# Bind("MaSanPham") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="tensanphamTextBox" runat="server"  Text='<%# Bind("TenSanPham") %>' />
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUpload2" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="giasanphamTextBox" runat="server" Text='<%# Bind("GiaSanPham") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="motaTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="soluongTextBox" TextMode="Number" runat="server" Text='<%# Bind("SoLuong") %>' />
                        </td>
                        <td style="padding:5px">
                            <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" ><i class="fas fa-save"></i></asp:LinkButton>
                            <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:LinkButton>
                        </td>
                    </tr>
                </EditItemTemplate>
            </asp:ListView>
            </ContentTemplate>
            </asp:UpdatePanel>
    </div>
    
</asp:Content>
