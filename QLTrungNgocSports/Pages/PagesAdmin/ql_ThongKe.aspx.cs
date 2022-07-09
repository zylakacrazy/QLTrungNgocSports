using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_ThongKe : System.Web.UI.Page
    {
        dbQLTrungNgocSportsDataContext db = new dbQLTrungNgocSportsDataContext();
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox2.Text = DateTime.Now.Date.ToString();
            }
        }
        public void hienthi()
        {
            var result = from hd in db.tbl_HoaDons
                         from ct in db.tbl_ChiTietHoaDons
                         where hd.id_HoaDon == ct.id_HoaDon && hd.id_NhanVien != null
                         && hd.NgayDuyet == DateTime.Parse(TextBox1.Text)
                         select hd;
            ListView1.DataSource = result.ToList();
            ListView1.DataBind();
        }
        public void hienthi1()
        {
            var result = from hd in db.tbl_HoaDons
                         from ct in db.tbl_ChiTietHoaDons
                         where hd.id_HoaDon == ct.id_HoaDon && hd.id_NhanVien != null
                         && hd.NgayDuyet >= DateTime.Parse(TextBox2.Text)
                         && hd.NgayDuyet <= DateTime.Parse(TextBox3.Text)
                         select hd;
            ListView1.DataSource = result.ToList();
            ListView1.DataBind();
        }
        public void hienthi2()
        {
            ListView2.DataSource = db.tbl_DonDatSans.Where(x => x.NgayDuyet >= DateTime.Parse(TextBox2.Text) && x.NgayDuyet <= DateTime.Parse(TextBox3.Text));
            ListView2.DataBind();
        }
        public void hienthi3()
        {
            ListView2.DataSource = db.tbl_DonDatSans.Where(x => x.NgayDuyet == DateTime.Parse(TextBox1.Text));
            ListView2.DataBind();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "1")
            {
                TextBox1.Visible = true;
                TextBox2.Visible = false;
                TextBox3.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label6.Visible = true;

            }
            else if(DropDownList1.SelectedValue == "2")
            {
                TextBox1.Visible = false;
                Label4.Visible = true;
                Label5.Visible = true;
                Label6.Visible = false;
                TextBox2.Visible = true;
                TextBox3.Visible = true;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            //---Đặt sản phẩm---
            var result = from hd in db.tbl_HoaDons
                         from ct in db.tbl_ChiTietHoaDons
                         where hd.id_HoaDon == ct.id_HoaDon && hd.id_NhanVien != null
                         && hd.NgayDuyet == DateTime.Parse(TextBox1.Text)
                         select ct;
            double tt = 0;
            foreach (var item in result)
            {
                tt = (double)(tt + item.TongTien);
            }
            // Đặt sân
            var result1 = from ds in db.tbl_DonDatSans
                          join sa in db.tbl_Sans on ds.id_San equals sa.id_San
                          where ds.id_NhanVien != null
                          && ds.NgayDuyet == DateTime.Parse(TextBox1.Text)
                          select ds;
            double tt1 = 0;
            foreach (var item in result1)
            {
                tt1 = (double)(tt1 + item.TongGia);
            }
            double tt2 = tt1 + tt;
            CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
            string a = double.Parse(tt2.ToString()).ToString("#,###", cul.NumberFormat);
            Label1.Text ="Tổng doanh thu: "+ a + " VNĐ";
            hienthi();
            hienthi3();
            string b = double.Parse(tt1.ToString()).ToString("#,###", cul.NumberFormat);
            string c = double.Parse(tt.ToString()).ToString("#,###", cul.NumberFormat);
            labelDatSan.Text = "Doanh thu cho thuê sân: " + b + "VNĐ";
            labelDathang.Text = "Doanh thu bán hàng: " + c + "VNĐ";
        }

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pg = (DataPager)ListView2.FindControl("DataPager1");
            pg.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            hienthi();
            hienthi3();
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            var result = from hd in db.tbl_HoaDons
                         from ct in db.tbl_ChiTietHoaDons
                         where hd.id_HoaDon == ct.id_HoaDon && hd.id_NhanVien != null
                         && hd.NgayDuyet >= DateTime.Parse(TextBox2.Text)
                         && hd.NgayDuyet <= DateTime.Parse(TextBox3.Text)
                         select ct;
            double tt = 0;
            foreach (var item in result)
            {
                tt = (double)(tt + item.TongTien);
            }
            // đặt sân
            // Đặt sân
            var result1 = from ds in db.tbl_DonDatSans
                          join sa in db.tbl_Sans on ds.id_San equals sa.id_San
                          where ds.id_NhanVien != null
                          && ds.NgayDuyet >= DateTime.Parse(TextBox2.Text) && ds.NgayDuyet <= DateTime.Parse(TextBox3.Text)
                          select ds;
            double tt1 = 0;
            foreach (var item in result1)
            {
                tt1 = (double)(tt1 + item.TongGia);
            }

            double tt2 = tt + tt1;
            CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
            string a = double.Parse(tt2.ToString()).ToString("#,###", cul.NumberFormat);
            Label1.Text = "Tổng doanh thu: "+a + " VNĐ";
            hienthi1();
            hienthi2();
            string b = double.Parse(tt1.ToString()).ToString("#,###", cul.NumberFormat);
            string c = double.Parse(tt.ToString()).ToString("#,###", cul.NumberFormat);
            labelDatSan.Text = "Doanh thu cho thuê sân: " + b + "VNĐ";
            labelDathang.Text = "Doanh thu bán hàng: " + c + "VNĐ";
        }

        protected void ListView2_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pg = (DataPager)ListView1.FindControl("DataPager2");
            pg.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            hienthi1();
            hienthi2();
        }
    }
}