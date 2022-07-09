<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_BannerSlide.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_BannerSlide" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:ListView ID="ListView1" style="margin:30px auto" runat="server" 
            DataKeyNames="id_BannerSlide" InsertItemPosition="FirstItem"
            OnItemInserting="ListView1_ItemInserting"
            OnItemDeleting="ListView1_ItemDeleting"
            OnItemUpdating="ListView1_ItemUpdating"
            OnItemEditing="ListView1_ItemEditing"
            OnItemCanceling="ListView1_ItemCanceling"
            OnPagePropertiesChanging="ListView1_PagePropertiesChanging">
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <%--<asp:Label ID="id_BannerSlideLabel1" runat="server" Text='<%# Eval("id_BannerSlide") %>' />--%>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                    </td>
                    <td style="padding:5px">
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Update" ><i class="fas fa-save"></i></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:LinkButton>
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
                    <td>&nbsp;</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <%--<asp:TextBox ID="imagesTextBox" runat="server" Text='<%# Bind("images") %>' />--%>
                    </td>
                    <td>
                        <asp:TextBox ID="MoTaTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("MoTa") %>' />
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
                        <asp:Label ID="id_BannerSlideLabel" runat="server" Text='<%# Eval("id_BannerSlide") %>' />
                    </td>
                    <td>
                        <asp:Image ID="Image1" ImageUrl='<%# Eval("images") %>' Width="60%" runat="server" />
                    </td>
                    <td>
                        <asp:Label ID="MoTaLabel" runat="server" Text='<%# Eval("MoTa") %>' />
                    </td>
                    <td style="padding:5px">
                        <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Edit" Text="" ><i class="fas fa-edit"></i></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <div class="table-responsive">
                    <table runat="server" class="table table-bordered">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" class="table table-bordered" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">ID</th>
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
        </asp:ListView>
    </div>
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLTrungNgocSportsConnectionString3 %>" DeleteCommand="DELETE FROM [tbl_BannerSilde] WHERE [id_BannerSlide] = @id_BannerSlide" InsertCommand="INSERT INTO [tbl_BannerSilde] ([images], [MoTa]) VALUES (@images, @MoTa)" SelectCommand="SELECT * FROM [tbl_BannerSilde]" UpdateCommand="UPDATE [tbl_BannerSilde] SET [images] = @images, [MoTa] = @MoTa WHERE [id_BannerSlide] = @id_BannerSlide">
        <DeleteParameters>
            <asp:Parameter Name="id_BannerSlide" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="images" Type="String" />
            <asp:Parameter Name="MoTa" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="images" Type="String" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="id_BannerSlide" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>--%>
</asp:Content>
