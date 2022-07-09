using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesUser
{
    public partial class AddCart : System.Web.UI.Page
    {
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListView1.DataSource = (DataTable)Session["GioHang"];
                ListView1.DataBind();
            }
        }
        dbQLTrungNgocSportsDataContext db = new dbQLTrungNgocSportsDataContext();
        protected void Button1_Click(object sender, EventArgs e)
        { 
            DateTime ngaydat = DateTime.Now;
            if (Session["idKH"] != null)
            {
                int idkh = (int)Session["idKH"];

                if (sv.AddHoaDon(idkh, 0, ngaydat, null, null, null) == true)
                {
                    foreach (ListViewDataItem item in this.ListView1.Items)
                    {
                        if (item.ItemType == ListViewItemType.DataItem)
                        {
                            Label idsp = item.FindControl("idSP") as Label;
                            Label gia = item.FindControl("tongGia") as Label;
                            TextBox soluong = item.FindControl("SoLuong") as TextBox;
                            var result = (from hd in db.tbl_HoaDons
                                          orderby hd.id_HoaDon descending
                                          select hd).Take(1);
                            foreach (var us in result)
                            {
                                int idhd = us.id_HoaDon;
                                sv.AddCTHD(int.Parse(idsp.Text), idhd, int.Parse(soluong.Text), float.Parse(gia.Text));
                            }
                        }
                    }
                    Session["GioHang"] = null;
                    Response.Write("<script>alert('Đặt sản phẩm thành công vui lòng đợi xác nhận!');window.location.href=('default.aspx');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Đặt sản phẩm thất bại');</script>");
                } 
            }
            else
            {
                string ten, sdt, diachi;
                ten = TextBox1.Text;
                sdt = TextBox2.Text;
                diachi = TextBox3.Text;
                if (sv.AddHoaDon1(0, ngaydat, ten, sdt, diachi) == true)
                {
                    foreach (ListViewDataItem item in this.ListView1.Items)
                    {
                        if (item.ItemType == ListViewItemType.DataItem)
                        {
                            Label idsp = item.FindControl("idSP") as Label;
                            Label gia = item.FindControl("tongGia") as Label;
                            TextBox soluong = item.FindControl("SoLuong") as TextBox;
                            var result = (from hd in db.tbl_HoaDons
                                          orderby hd.id_HoaDon descending
                                          select hd).Take(1);
                            foreach (var us in result)
                            {
                                int idhd = us.id_HoaDon;
                                sv.AddCTHD(int.Parse(idsp.Text), idhd, int.Parse(soluong.Text), float.Parse(gia.Text));
                            }
                        }
                    }
                    Session["GioHang"] = null;
                    Response.Write("<script>alert('Đặt sản phẩm thành công vui lòng đợi xác nhận!');window.location.href=('default.aspx');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Đặt sản phẩm thất bại');</script>");
                }
            }
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            string a = ListView1.DataKeys[e.ItemIndex].Values["ID"].ToString();
            DataTable dt = Session["GioHang"] as DataTable;
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["ID"].ToString() == a)
                {
                    Session["SoLuongGioHang"] = int.Parse(Session["SoLuongGioHang"].ToString()) - int.Parse(dr["Quantity"].ToString());
                    dr.Delete();
                    break;
                }
            }
            dt.AcceptChanges();
            Session["GioHang"] = dt;
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            
        }

        protected void SoLuong_TextChanged(object sender, EventArgs e)
        {
            foreach (ListViewItem item in ListView1.Items)
            {
                Label gia = item.FindControl("giaHD") as Label;
                Label gia1 = item.FindControl("tongGia") as Label;
                Label gia2 = item.FindControl("tongtien1") as Label;
                TextBox soluong = item.FindControl("SoLuong") as TextBox;
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                string a = double.Parse((float.Parse(gia.Text) * int.Parse(soluong.Text)).ToString()).ToString("#,###", cul.NumberFormat);
                gia1.Text = a+ "đ";
                gia2.Text = (float.Parse(gia.Text) * int.Parse(soluong.Text)).ToString();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            float tong=0;
            foreach (ListViewItem item in ListView1.Items)
            {
                Label gia = item.FindControl("tongtien1") as Label;
                tong = tong + float.Parse(gia.Text);
            }
            Label b = ListView1.FindControl("tongHD") as Label;
            CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
            string bb = double.Parse(tong.ToString()).ToString("#,###", cul.NumberFormat);
            b.Text = bb;
        }
    }
}