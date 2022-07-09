<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_San.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_San" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" class="table table-bordered s13" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">ID</th>
                                <th runat="server">Tên sân</th>
                                <th runat="server">hình ảnh</th>
                                <th runat="server">chi tiết sân</th>
                                <th runat="server">Loại sân</th>
                                <th runat="server">Trạng thái</th>
                                <th runat="server">Số lượng</th>
                                <th runat="server">Đơn giá</th>
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
                
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:Label ID="tensanLabel" runat="server" Text='<%# Eval("tensan") %>' />
                </td>
                <td>
                    <asp:Image ID="hinhLabel" ImageUrl='<%# Eval("hinh") %>' Width="150px" Height="80px" runat="server" />
                </td>
                <td>
                    <asp:Label ID="chitietLabel" runat="server" Text='<%# Eval("chitiet") %>' />
                </td>
                <td>
                    <asp:Label ID="loaisanLabel" runat="server" Text='<%# Eval("loaisan") %>' />
                </td>
                <td>
                    <asp:Label ID="trangthaiLabel" runat="server" Text='<%# Eval("trangthai") %>' />
                </td>
                <td>
                    <asp:Label ID="soluongLabel" runat="server" Text='<%# Eval("soluong") %>' />
                </td>
                <td>
                    <asp:Label ID="donngiaLabel" runat="server" Text='<%# Eval("dongia") %>' />
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
                    <asp:TextBox ID="tensanTextBox" runat="server" Text='<%# Bind("tensan") %>' />
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="chitietTextBox" runat="server" Text='<%# Bind("chitiet") %>' />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="trangthaiTextBox" runat="server" Text='<%# Bind("trangthai") %>' />
                </td>
                <td>
                    <asp:TextBox ID="soluongTextBox" runat="server" Text='<%# Bind("soluong") %>' />
                </td>
                <td>
                    <asp:TextBox ID="dongiaTextBox" runat="server" Text='<%# Bind("dongia") %>' />
                </td>
                <td style="padding:5px">
                    <asp:linkButton ID="InsertButton" runat="server" CommandName="Insert"><i class="fas fa-save"></i></asp:linkButton>
                    <asp:linkbutton  ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:linkbutton>
                </td>
            </tr>
        </InsertItemTemplate>
        <EditItemTemplate>
            <tr style="">
                
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="tensanTextBox" runat="server" Width="100px" Text='<%# Bind("tensan") %>' />
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload2" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="chitietTextBox" runat="server" Width="150px" Text='<%# Bind("chitiet") %>' />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="trangthaiTextBox" runat="server" Width="100px" Text='<%# Bind("trangthai") %>' />
                </td>
                <td>
                    <asp:TextBox ID="soluongTextBox" runat="server" Width="60px" Text='<%# Bind("soluong") %>' />
                </td>
                <td>
                    <asp:TextBox ID="dongiaTextBox" runat="server" Width="80px" Text='<%# Bind("dongia") %>' />
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" ><i class="fas fa-save"></i></asp:LinkButton>
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
</asp:Content>

