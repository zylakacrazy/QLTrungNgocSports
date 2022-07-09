<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/template.Master" AutoEventWireup="true" CodeBehind="ql_HoaDon.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesAdmin.ql_HoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id"
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
                <td runat="server"> </td>
                <td>
                    <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="tenkhTextBox" runat="server" Text='<%# Bind("tenkh") %>' />
                </td>
                <td>
                    <asp:TextBox ID="diachiTextBox" runat="server" Text='<%# Bind("diachi") %>' />
                </td>
                <td>
                    <asp:TextBox ID="sdtTextBox" runat="server" Text='<%# Bind("sdt") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ngaydatTextBox" TextMode="Date" runat="server" Text='<%# Bind("ngaydat") %>' />
                </td>
                <td style="padding:5px">
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Update" ><i class="fas fa-save"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td runat="server"> </td>
                <td>
                    <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="tenkhTextBox" runat="server" Text='<%# Bind("tenkh") %>' />
                </td>
                <td>
                    <asp:TextBox ID="diachiTextBox" runat="server" Text='<%# Bind("diachi") %>' />
                </td>
                <td>
                    <asp:TextBox ID="sdtTextBox" runat="server" Text='<%# Bind("sdt") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ngaydatTextBox" TextMode="Date" runat="server" Text='<%# Bind("ngaydat") %>' />
                </td>
                <td style="padding:5px">
                    <asp:linkButton ID="LinkButton3" runat="server" CommandName="Insert"><i class="fas fa-save"></i></asp:linkButton>
                    <asp:linkbutton  ID="Linkbutton4" runat="server" CommandName="Cancel" ><i class="fas fa-undo"></i></asp:linkbutton>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="" >
                <td><asp:CheckBox ID="CheckBox2" runat="server" />
                    <a href="#" onclick="redir('<%# Eval("id") %>');">Chi tiết</a>
                </td>
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:Label ID="tenkhLabel" runat="server" Text='<%# Eval("tenkh") %>' />
                </td>
                <td>
                    <asp:Label ID="diachiLabel" runat="server" Text='<%# Eval("diachi") %>' />
                </td>
                <td>
                    <asp:Label ID="sdtLabel" runat="server" Text='<%# Eval("sdt") %>' />
                </td>
                <td>
                    <asp:Label ID="ngaydatLabel" runat="server" Text='<%# Eval("ngaydat") %>' />
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
                            <asp:Button ID="Button1" OnClick="Button1_Click" CssClass="btn btn-outline-danger" runat="server" Text="Duyệt đơn" />
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="table table-bordered table-hover s13" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"> </th>
                                    <th runat="server">ID</th>
                                    <th runat="server">Họ tên</th>
                                    <th runat="server">Địa chỉ</th>
                                    <th runat="server">Số điện thoại</th>
                                    <th runat="server">Ngày đặt</th>
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
    <script type="text/javascript">
            function redir(id) {
                window.location.href = "ql_CTHD.aspx?id=" + id;                
            }
    </script>
</asp:Content>
