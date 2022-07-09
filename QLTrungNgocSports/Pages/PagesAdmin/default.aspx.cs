using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class _default : System.Web.UI.Page
    {
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string tdn, mk;
            int role;
            tdn = TextBox1.Text;
            mk = TextBox2.Text;
            if (tdn == "" || mk == "")
            {
                Response.Write("<script>alert('Vui lòng nhập đầy đủ thông tin!');</script>");
            }
            else
            {
                role = sv.Login1(tdn, mk);
                if (role == 1)
                {
                    foreach (var item in sv.SearchNV(tdn))
                    {
                        Session["id"] = item.id_NhanVien;
                        Session["user"] = item.TenNhanVien;
                    }
                    Response.Write("<script>alert('Đăng nhập thành công!');window.location.href='default.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Sai tài khoản hoặc mật khẩu!');</script>");
                }
            }
        }
    }
}