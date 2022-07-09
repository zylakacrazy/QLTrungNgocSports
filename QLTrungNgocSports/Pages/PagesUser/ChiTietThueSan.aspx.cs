using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesUser
{
    public partial class ChiTietThueSan : System.Web.UI.Page
    {
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss");
                TextBox2.Text = DateTime.Now.ToString("MM/dd/yyyy");
                TextBox3.Text = DateTime.Now.ToString("HH/mm/ss");
                TextBox4.Text = DateTime.Now.AddHours(1).ToString("HH/mm/ss");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int idSan,Id;
            float tonggia;
            idSan = int.Parse(Session["idSan"].ToString());
            Id = int.Parse(Session["idKH"].ToString());
            DateTime NgayThue, Tu, Den;
            NgayThue = DateTime.Parse(TextBox2.Text);
            Tu = DateTime.Parse(TextBox3.Text);
            Den = DateTime.Parse(TextBox4.Text);
            tonggia = float.Parse(Gia.Text);
            if (NgayThue.ToString() == "" || Tu.ToString() == "" || Den.ToString() == "")
            {
                Response.Write("<script>alert('Vui lòng chọn ngày, giờ thuê đầy đủ!');</script>");
            }
            else
            {
                if (sv.DangKyThue(Id, idSan, NgayThue, Tu, Den,tonggia) == true)
                {
                    Response.Write("<script>alert('Đăng ký sân thành công!');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Đăng ký sân thất bại! Vui lòng thử lại sao');</script>");
                }
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox2.Text))
            {
                if (DateTime.Parse(TextBox2.Text) < DateTime.Now)
                {
                    Response.Write("<script>alert('Ngày thuê không được nhỏ hơn hiện tại!!!');</script>");
                }
            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            //Response.Write(TextBox3.Text);
            if (!string.IsNullOrEmpty(TextBox3.Text))
            {
                var a = TimeSpan.Parse(TextBox3.Text);
                var b = DateTime.Now.TimeOfDay;
                if (a < b)
                {
                    Response.Write("<script>alert('Giờ thuê không được nhỏ hơn hiện tại!!!');</script>");
                    TextBox3.Text = DateTime.Now.TimeOfDay.ToString();
                }
            }
        }
        dbQLTrungNgocSportsDataContext db = new dbQLTrungNgocSportsDataContext();
        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox3.Text)&& !string.IsNullOrEmpty(TextBox4.Text))
            {
                var time = (DateTime.Parse(TextBox4.Text)).TimeOfDay;
                var time1 = (DateTime.Parse(TextBox3.Text).AddHours(1)).TimeOfDay;
                if (time < time1)
                {
                    Response.Write("<script>alert('Giờ thuê không được nhỏ 60 phút!!!');</script>");
                }
                int idSan = int.Parse(Session["idSan"].ToString());
                var result = from s in db.tbl_Sans
                             where s.id_LoaiSan == idSan
                             select s;
                float gia=0;
                foreach (var item in result)
                {
                    gia = (float)item.DonGia;
                }
                var tt = time - time1;
                string a1, a2, a3, a4;
                a1 = gia.ToString();
                a2 = (gia * 2).ToString();
                a3 = (gia * tt.Hours).ToString();
                a4 = ((gia * tt.Hours) + gia).ToString();
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                string b1 = double.Parse(a1).ToString("#,###", cul.NumberFormat);
                string b2 = double.Parse(a2).ToString("#,###", cul.NumberFormat);
                string b3 = double.Parse(a3).ToString("#,###", cul.NumberFormat);
                string b4 = double.Parse(a4).ToString("#,###", cul.NumberFormat);
                if (tt.Hours == 0 && tt.Minutes == 0)
                {
                    Gia.Text = "Tổng giá: "+ b1+"VNĐ";
                }
                else if(tt.Hours ==0 &&tt.Minutes !=0)
                {
                    Gia.Text = "Tổng giá: " + b2 + "VNĐ";
                }
                else if(tt.Hours != 0 && tt.Minutes ==0)
                {
                    Gia.Text = "Tổng giá: " + b3 + "VNĐ";
                }
                else if(tt.Hours != 0 && tt.Minutes != 0)
                {
                    Gia.Text = "Tổng giá: " + b4 + "VNĐ";
                }
            }
        }
    }
}