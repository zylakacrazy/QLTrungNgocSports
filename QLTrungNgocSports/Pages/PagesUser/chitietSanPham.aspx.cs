using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesUser
{
    public partial class chitietSanPham : System.Web.UI.Page
    {
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            var c = sv.SearchSP(int.Parse(Session["idSP"].ToString()));
            lblidSP.Text = c[0].id_SanPham.ToString();
            lblMaSP.Text = c[0].MaSanPham;
            lblTenSP.Text = c[0].TenSanPham;
            lblGiaSP.Text = c[0].GiaSanPham.ToString();
            lblMoTa.Text = c[0].MoTa;
            var idSP = Session["idSP"].ToString();
            var bien = sv.SearchSP(int.Parse(idSP));
            foreach (var item in bien)
            {
                var hinhanh = item.Images;
                Image1.ImageUrl = hinhanh;
            }
            if (!IsPostBack)
            {
                DataTable cart = new DataTable();
                if (Session["GioHang"] == null)
                {
                    cart.Clear();
                    cart.Columns.Add("ID");
                    cart.Columns.Add("Name");
                    cart.Columns.Add("Price");
                    cart.Columns.Add("Quantity");
                    cart.Columns.Add("Images");
                    Session["GioHang"] = cart;
                    Session["SoLuongGioHang"] = 0;
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable tb = (DataTable)Session["GioHang"];
            int count = tb.Select("ID='" + lblidSP.Text + "'").Count();
            bool flag = false;
            foreach (DataRow r in tb.Rows)
            {
                if(r["ID"].ToString() == lblidSP.Text)
                {
                    r["Quantity"] = int.Parse(r["Quantity"].ToString()) + int.Parse(txtSoLuong.Text);
                    flag = true;
                    break;
                }
            }
            if (!flag)
            {   
                DataRow r = tb.NewRow();
                r["ID"] = lblidSP.Text;
                r["Name"] = lblTenSP.Text;
                r["Price"] = float.Parse(lblGiaSP.Text) * int.Parse(txtSoLuong.Text);
                r["Quantity"] = txtSoLuong.Text;
                r["Images"] = Image1.ImageUrl;
                tb.Rows.Add(r);
            }
            Session["GioHang"] = tb;
            Session["SoLuongGioHang"] = int.Parse(Session["SoLuongGioHang"].ToString()) + int.Parse(txtSoLuong.Text);
        }    
    }
}