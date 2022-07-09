<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_NhanVien.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_NhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server"
        OnItemDataBound="ListView1_ItemDataBound"
        DataKeyNames="id_NhanVien" DataSourceID="SqlDataSource1" InsertItemPosition="FirstItem">
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="id_NhanVienLabel1" runat="server" Text='<%# Eval("id_NhanVien") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TenNhanVienTextBox" runat="server" Text='<%# Bind("TenNhanVien") %>' />
                </td>
                <td>
                    <asp:TextBox ID="GioiTinhTextBox" runat="server" Text='<%# Bind("GioiTinh") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CMNDTextBox" runat="server" Text='<%# Bind("CMND") %>' />
                </td>
                <td>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NgaySinhTextBox" runat="server" Text='<%# Bind("NgaySinh") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>' />
                </td>
                <td>
                    <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="passWordTextBox" runat="server" Text='<%# Bind("passWord") %>' />
                </td>
                <td>
                    <asp:TextBox ID="id_TypeAccountTextBox" runat="server" Text='<%# Bind("id_TypeAccount") %>' />
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
                    <asp:TextBox ID="TenNhanVienTextBox" runat="server" Text='<%# Bind("TenNhanVien") %>' />
                </td>
                <td>
                    <asp:TextBox ID="GioiTinhTextBox" runat="server" Text='<%# Bind("GioiTinh") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CMNDTextBox" runat="server" Text='<%# Bind("CMND") %>' />
                </td>
                <td>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NgaySinhTextBox" runat="server" Text='<%# Bind("NgaySinh") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>' />
                </td>
                <td>
                    <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="passWordTextBox" runat="server" Text='<%# Bind("passWord") %>' />
                </td>
                <td>
                    <asp:TextBox ID="id_TypeAccountTextBox" runat="server" Text='<%# Bind("id_TypeAccount") %>' />
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
                    <asp:Label ID="id_NhanVienLabel" runat="server" Text='<%# Eval("id_NhanVien") %>' />
                </td>
                <td>
                    <asp:Label ID="TenNhanVienLabel" runat="server" Text='<%# Eval("TenNhanVien") %>' />
                </td>
                <td>
                    <asp:Label ID="GioiTinhLabel" runat="server" Text='<%# Eval("GioiTinh") %>' />
                </td>
                <td>
                    <asp:Label ID="CMNDLabel" runat="server" Text='<%# Eval("CMND") %>' />
                </td>
                <td>
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                </td>
                <td>
                    <asp:Label ID="NgaySinhLabel" runat="server" Text='<%# Eval("NgaySinh") %>' />
                </td>
                <td>
                    <asp:Label ID="DiaChiLabel" runat="server" Text='<%# Eval("DiaChi") %>' />
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
                                    <th runat="server">CMND</th>
                                    <th runat="server">Email</th>
                                    <th runat="server">Ngày sinh</th>
                                    <th runat="server">Địa chỉ</th>
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
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="id_NhanVienLabel" runat="server" Text='<%# Eval("id_NhanVien") %>' />
                </td>
                <td>
                    <asp:Label ID="TenNhanVienLabel" runat="server" Text='<%# Eval("TenNhanVien") %>' />
                </td>
                <td>
                    <asp:Label ID="GioiTinhLabel" runat="server" Text='<%# Eval("GioiTinh") %>' />
                </td>
                <td>
                    <asp:Label ID="CMNDLabel" runat="server" Text='<%# Eval("CMND") %>' />
                </td>
                <td>
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                </td>
                <td>
                    <asp:Label ID="NgaySinhLabel" runat="server" Text='<%# Eval("NgaySinh") %>' />
                </td>
                <td>
                    <asp:Label ID="DiaChiLabel" runat="server" Text='<%# Eval("DiaChi") %>' />
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
                    <asp:LinkButton ID="LinkButton7" runat="server" CommandName="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton8" runat="server" CommandName="Edit" Text="" ><i class="fas fa-edit"></i></asp:LinkButton>
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLTrungNgocSportsConnectionString %>" DeleteCommand="DELETE FROM [tbl_NhanVien] WHERE [id_NhanVien] = @id_NhanVien" InsertCommand="INSERT INTO [tbl_NhanVien] ([TenNhanVien], [GioiTinh], [CMND], [Email], [NgaySinh], [DiaChi], [userName], [passWord], [id_TypeAccount]) VALUES (@TenNhanVien, @GioiTinh, @CMND, @Email, @NgaySinh, @DiaChi, @userName, @passWord, @id_TypeAccount)" SelectCommand="SELECT * FROM [tbl_NhanVien]" UpdateCommand="UPDATE [tbl_NhanVien] SET [TenNhanVien] = @TenNhanVien, [GioiTinh] = @GioiTinh, [CMND] = @CMND, [Email] = @Email, [NgaySinh] = @NgaySinh, [DiaChi] = @DiaChi, [userName] = @userName, [passWord] = @passWord, [id_TypeAccount] = @id_TypeAccount WHERE [id_NhanVien] = @id_NhanVien">
        <DeleteParameters>
            <asp:Parameter Name="id_NhanVien" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenNhanVien" Type="String" />
            <asp:Parameter Name="GioiTinh" Type="Int32" />
            <asp:Parameter Name="CMND" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter DbType="Date" Name="NgaySinh" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="passWord" Type="String" />
            <asp:Parameter Name="id_TypeAccount" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenNhanVien" Type="String" />
            <asp:Parameter Name="GioiTinh" Type="Int32" />
            <asp:Parameter Name="CMND" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter DbType="Date" Name="NgaySinh" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="passWord" Type="String" />
            <asp:Parameter Name="id_TypeAccount" Type="Int32" />
            <asp:Parameter Name="id_NhanVien" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
