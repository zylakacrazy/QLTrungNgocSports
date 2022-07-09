<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_HangSanXuat.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_HangSanXuat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_HangSanXuat" DataSourceID="SqlDataSource1" InsertItemPosition="FirstItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="id_HangSanXuatLabel" runat="server" Text='<%# Eval("id_HangSanXuat") %>' />
                </td>
                <td>
                    <asp:Label ID="TenHangSanXuatLabel" runat="server" Text='<%# Eval("TenHangSanXuat") %>' />
                </td>
                <td>
                    <asp:Label ID="HinhAnhLabel" runat="server" Text='<%# Eval("HinhAnh") %>' />
                </td>
                <td>
                    <asp:Label ID="MoTaLabel" runat="server" Text='<%# Eval("MoTa") %>' />
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="" ><i class="fas fa-edit"></i></asp:LinkButton>
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="id_HangSanXuatLabel1" runat="server" Text='<%# Eval("id_HangSanXuat") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TenHangSanXuatTextBox" runat="server" Text='<%# Bind("TenHangSanXuat") %>' />
                </td>
                <td>
                    <asp:TextBox ID="HinhAnhTextBox" runat="server" Text='<%# Bind("HinhAnh") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" ><i class="fas fa-save"></i></asp:LinkButton>
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="" class="table table-bordered">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="TenHangSanXuatTextBox" runat="server" Text='<%# Bind("TenHangSanXuat") %>' />
                </td>
                <td>
                    <asp:TextBox ID="HinhAnhTextBox" runat="server" Text='<%# Bind("HinhAnh") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                </td>
                <td style="padding:5px">
                    <asp:linkButton ID="InsertButton" runat="server" CommandName="Insert"><i class="fas fa-save"></i></asp:linkButton>
                    <asp:linkbutton  ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:linkbutton>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="id_HangSanXuatLabel" runat="server" Text='<%# Eval("id_HangSanXuat") %>' />
                </td>
                <td>
                    <asp:Label ID="TenHangSanXuatLabel" runat="server" Text='<%# Eval("TenHangSanXuat") %>' />
                </td>
                <td>
                    <asp:Label ID="HinhAnhLabel" runat="server" Text='<%# Eval("HinhAnh") %>' />
                </td>
                <td>
                    <asp:Label ID="MoTaLabel" runat="server" Text='<%# Eval("MoTa") %>' />
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="" ><i class="fas fa-edit"></i></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="table table-bordered">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" class="table table-bordered" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">ID</th>
                                <th runat="server">Tên hãng sản xuất</th>
                                <th runat="server">Hình ảnh</th>
                                <th runat="server">Mô tả</th>
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
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="id_HangSanXuatLabel" runat="server" Text='<%# Eval("id_HangSanXuat") %>' />
                </td>
                <td>
                    <asp:Label ID="TenHangSanXuatLabel" runat="server" Text='<%# Eval("TenHangSanXuat") %>' />
                </td>
                <td>
                    <asp:Label ID="HinhAnhLabel" runat="server" Text='<%# Eval("HinhAnh") %>' />
                </td>
                <td>
                    <asp:Label ID="MoTaLabel" runat="server" Text='<%# Eval("MoTa") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLTrungNgocSportsConnectionString %>" DeleteCommand="DELETE FROM [tbl_HangSanXuat] WHERE [id_HangSanXuat] = @id_HangSanXuat" InsertCommand="INSERT INTO [tbl_HangSanXuat] ([TenHangSanXuat], [HinhAnh], [MoTa]) VALUES (@TenHangSanXuat, @HinhAnh, @MoTa)" SelectCommand="SELECT * FROM [tbl_HangSanXuat]" UpdateCommand="UPDATE [tbl_HangSanXuat] SET [TenHangSanXuat] = @TenHangSanXuat, [HinhAnh] = @HinhAnh, [MoTa] = @MoTa WHERE [id_HangSanXuat] = @id_HangSanXuat">
        <DeleteParameters>
            <asp:Parameter Name="id_HangSanXuat" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenHangSanXuat" Type="String" />
            <asp:Parameter Name="HinhAnh" Type="String" />
            <asp:Parameter Name="MoTa" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenHangSanXuat" Type="String" />
            <asp:Parameter Name="HinhAnh" Type="String" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="id_HangSanXuat" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
