<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_LoaiSanTap.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_LoaiSanTap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_LoaiSan" DataSourceID="SqlDataSource1" InsertItemPosition="FirstItem">
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="id_LoaiSanLabel1" runat="server" Text='<%# Eval("id_LoaiSan") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TenLoaiSanTextBox" runat="server" Text='<%# Bind("TenLoaiSan") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TrangThaiTextBox" runat="server" Text='<%# Bind("TrangThai") %>' />
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" ><i class="fas fa-save"></i></asp:LinkButton>
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td></td>
                <td>
                    <asp:TextBox ID="TenLoaiSanTextBox" runat="server" Text='<%# Bind("TenLoaiSan") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TrangThaiTextBox" runat="server" Text='<%# Bind("TrangThai") %>' />
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
                    <asp:Label ID="id_LoaiSanLabel" runat="server" Text='<%# Eval("id_LoaiSan") %>' />
                </td>
                <td>
                    <asp:Label ID="TenLoaiSanLabel" runat="server" Text='<%# Eval("TenLoaiSan") %>' />
                </td>
                <td>
                    <asp:Label ID="TrangThaiLabel" runat="server" Text='<%# Eval("TrangThai") %>' />
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="" ><i class="fas fa-edit"></i></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="table">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" class="table table-bordered" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">ID</th>
                                <th runat="server">Tên loại sân</th>
                                <th runat="server">Trạng thái</th>
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
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="id_LoaiSanLabel" runat="server" Text='<%# Eval("id_LoaiSan") %>' />
                </td>
                <td>
                    <asp:Label ID="TenLoaiSanLabel" runat="server" Text='<%# Eval("TenLoaiSan") %>' />
                </td>
                <td>
                    <asp:Label ID="TrangThaiLabel" runat="server" Text='<%# Eval("TrangThai") %>' />
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="" ><i class="fas fa-edit"></i></asp:LinkButton>
                </td>
            </tr>
        </SelectedItemTemplate>

    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLTrungNgocSportsConnectionString2 %>" DeleteCommand="DELETE FROM [tbl_LoaiSan] WHERE [id_LoaiSan] = @id_LoaiSan" InsertCommand="INSERT INTO [tbl_LoaiSan] ([TenLoaiSan], [TrangThai]) VALUES (@TenLoaiSan, @TrangThai)" SelectCommand="SELECT * FROM [tbl_LoaiSan]" UpdateCommand="UPDATE [tbl_LoaiSan] SET [TenLoaiSan] = @TenLoaiSan, [TrangThai] = @TrangThai WHERE [id_LoaiSan] = @id_LoaiSan">
        <DeleteParameters>
            <asp:Parameter Name="id_LoaiSan" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenLoaiSan" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenLoaiSan" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Int32" />
            <asp:Parameter Name="id_LoaiSan" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
