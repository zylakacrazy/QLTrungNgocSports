<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_LoaiSanPham.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_LoaiSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server" 
        DataKeyNames="id_LoaiSanPham"
        InsertItemPosition="FirstItem"
        OnItemInserting="ListView1_ItemInserting"
        OnItemDeleting="ListView1_ItemDeleting"
        OnItemUpdating="ListView1_ItemUpdating"
        OnItemEditing="ListView1_ItemEditing"
        OnItemCanceling="ListView1_ItemCanceling"
        OnPagePropertiesChanging="ListView1_PagePropertiesChanging" >
        <LayoutTemplate>
            <table runat="server" class="table table-bordered">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" class="table table-bordered" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">ID</th>
                                <th runat="server">Tên loại sản phẩm</th>
                                <th runat="server">Mô tả</th>
                                <th runat="server">Logo</th>
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
        </LayoutTemplate>
        <ItemTemplate>
            <tr style="">
                
                <td>
                    <asp:Label ID="id_HangSanXuatLabel" runat="server" Text='<%# Eval("id_LoaiSanPham") %>' />
                </td>
                <td>
                    <asp:Label ID="TenHangSanXuatLabel" runat="server" Text='<%# Eval("TenLoaiSanPham") %>' />
                </td>
                <td>
                    <asp:Label ID="HinhAnhLabel" runat="server" Text='<%# Eval("MoTa") %>' />
                </td>
                <td>
                    <asp:Label ID="MoTaLabel" runat="server" Text='<%# Eval("logoLoaiSanPham") %>' />
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
                    <asp:TextBox ID="TenHangSanXuatTextBox" runat="server" Text='<%# Bind("TenLoaiSanPham") %>' />
                </td>
                <td>
                    <asp:TextBox ID="HinhAnhTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("logoLoaiSanPham") %>' />
                </td>
                <td style="padding:5px">
                    <asp:linkButton ID="InsertButton" runat="server" CommandName="Insert"><i class="fas fa-save"></i></asp:linkButton>
                    <asp:linkbutton  ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:linkbutton>
                </td>
            </tr>
        </InsertItemTemplate>
        <EditItemTemplate>
            <tr style="">
                
                <td>
                    <asp:Label ID="id_HangSanXuatLabel1" runat="server" Text='<%# Eval("id_LoaiSanPham") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TenHangSanXuatTextBox" runat="server" Text='<%# Bind("TenLoaiSanPham") %>' />
                </td>
                <td>
                    <asp:TextBox ID="HinhAnhTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("logoLoaiSanPham") %>' />
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" ><i class="fas fa-save"></i></asp:LinkButton>
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
</asp:Content>
