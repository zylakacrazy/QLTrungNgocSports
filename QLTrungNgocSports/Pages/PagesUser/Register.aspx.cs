using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesUser
{
    public partial class Register : System.Web.UI.Page
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
            int gioitinh;
            string userName, passWord, ten, sdt, ngaysinh, diachi, email;
            userName = TextBox1.Text;
            passWord = TextBox2.Text;
            ten = TextBox3.Text;
            if (RadioButton1.Checked)
            {
                gioitinh = 0;
            }
            else
            {
                gioitinh = 1;
            }
            sdt = TextBox4.Text;
            ngaysinh = TextBox5.Text;
            diachi = TextBox6.Text;
            email = TextBox7.Text;
            if (sv.DemTaiKhoan(userName)==1)
            {
                Response.Write("<script>alert('Tên đăng nhập đã tồn tại!');</script>");
            }
            else
            {
                try
                {
                    if (sv.Register(ten, gioitinh, sdt, DateTime.Parse(ngaysinh), diachi, email, userName, passWord) == true)
                    {
                        Response.Write("<script>alert('Đăng ký tài khoản thành công!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Đăng ký tài khoản thất bại!');</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('Lỗi truy xuất CSDL vui lòng thử lại!');</script>");
                }
            }
            
        }
    }
}