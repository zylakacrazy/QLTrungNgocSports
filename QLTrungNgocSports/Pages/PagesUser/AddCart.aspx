<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Share/_Layout.Master" AutoEventWireup="true" CodeBehind="AddCart.aspx.cs" Inherits="QLTrungNgocSports.Pages.PagesUser.AddCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID"
        OnItemDeleting="ListView1_ItemDeleting"
        OnItemDataBound="ListView1_ItemDataBound">
        <ItemTemplate>
            <tr style="">
                 <%--<td runat="server">--%>
                     <asp:Label ID="idSP" Visible="false" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                 <%--</td>--%>
                 <td runat="server">
                     <asp:Label ID="tenSP" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                 </td>
                 <td runat="server">
                     <asp:Label ID="giaHD" Visible="false" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                     <asp:Image ID="Image1" ImageUrl='<%# Eval("Images") %>' Height="100px" runat="server" />
                 </td>
                 <%--<td runat="server">
                     
                 </td>--%>
                 <td runat="server">
                     <asp:TextBox ID="SoLuong" Width="60px" OnTextChanged="SoLuong_TextChanged" AutoPostBack="true" runat="server" TextMode="Number" Text='<%# Eval("Quantity") %>' Min="1" />
                 </td>
                <td>
                    <h5 style="color:red;"<asp:Label ID="tongGia" Text='<%# Eval("Price","{0:0,0}")+"đ" %>' runat="server"></asp:Label></h5>
                    <asp:Label ID="tongtien1" Visible="false" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton5" runat="server" CommandName='Delete' ><i class="fas fa-trash-alt"></i></asp:LinkButton>
                </td>
                
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" style="width:70%;margin:40px auto;" class="table table-borderless">
                <tr runat="server">
                    <td runat="server">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        <table id="itemPlaceholderContainer" class="table table-bordered" runat="server" border="0" style="width:90%;margin:20px auto;">
                            <tr runat="server" style="">
                                <%--<th runat="server">ID</th>--%>
                                <th runat="server">Tên sản phẩm</th>
                                <th runat="server">Hình ảnh</th>
                                <%--<th runat="server">Giá sản phẩm</th>--%>
                                <th runat="server">Số lượng</th>
                                <th runat="server">Giá</th>
                                <th runat="server"></th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="float:right">
                        <table>
                            <tr>
                                <td><h5 style="color:red">Tổng: <asp:Label ID="tongHD" Text="0" runat="server"></asp:Label> VNĐ</h5></td>
                                <td><asp:LinkButton CssClass="btn btn-outline-dark" ID="LinkButton1" OnClick="LinkButton1_Click" runat="server">Cập nhật</asp:LinkButton></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="float:right;">
                        <div style="float:right">
                        <%
                            if (Session["idKH"] != null)
                            {%>
                                <asp:Button ID="Button1" OnClick="Button1_Click" CssClass="btn btn-outline-danger" runat="server" Text="Đặt hàng" />
                            <%}
                            else
                            {%>
                                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Đặt hàng</button>
                            <%}
                            %>
                        </div>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <!-- Modal -->
        <div class="modal fade" id="exampleModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thông tin khách hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <%--<asp:ScriptManager runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox AutoPostBack="true" Height="35" ID="txtSL"  runat="server" min="1" value="1" Width="100px" TextMode="Number" OnTextChanged="txtSL_TextChanged"></asp:TextBox>
                            <br />
                            <h3 style="color:red;">Tổng tiền: <asp:Label ID="tongGia" runat="server">0</asp:Label> VNĐ</h3></h3>
                    </ContentTemplate>
                </asp:UpdatePanel>--%>
                <table class="table table-borderless">
                     <tr>
                         <td>Họ và tên:</td>
                         <td><asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox></td>
                     </tr>
                     <tr>
                         <td>Số điện thoại:</td>
                         <td><asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox></td>
                     </tr>
                     <tr>
                         <td>Địa chỉ:</td>
                         <td><asp:TextBox TextMode="MultiLine" CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox></td>
                     </tr>
                  </table>
                  <div>
                      <p style="color:darkgreen;font-size:12px;"><i class="fas fa-check"></i> Đăng ký tài khoản để nhận nhiều ưu đãi và đặt hàng dể dàng hơn!</p>
                      <p style="color:darkgreen;font-size:12px;"><i class="fas fa-check"></i> Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</p>
                  </div>
              </div>
              <div class="modal-footer">
                <asp:Button ID="Button2" OnClick="Button1_Click" CssClass="btn btn-outline-danger" runat="server" Text="Đặt hàng" />
              </div>
            </div>
          </div>
        </div>
    <!-- The Modal -->
</asp:Content>
