using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesUser
{
    public partial class Login : System.Web.UI.Page
    {
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
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
                role = sv.Login(tdn, mk);
                if (role == 2)
                {
                    foreach (var item in sv.SearchKH(tdn))
                    {
                        Session["idKH"] = item.id_KhachHang;
                        Session["user"] = item.TenKhachHang;
                    }
                    Response.Write("<script>alert('Đăng nhập thành công!');window.location.href='default.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Chuyển trang quản trị!');</script>");
                }
            }
        }
    }
}