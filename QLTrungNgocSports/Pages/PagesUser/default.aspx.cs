using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesUser
{
    public partial class _default : System.Web.UI.Page
    {   
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                HienThiSanPham();
            }
        }
        dbQLTrungNgocSportsDataContext db = new dbQLTrungNgocSportsDataContext();
        public void HienThiSanPham()
        {
            string idlsp = Request.QueryString["idlsp"];
            string key = Request.QueryString["srch"];
            if (idlsp == null)
            {
                Repeater1.DataSource = sv.DisplaySanPham();
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = sv.ht_SanPham(int.Parse(idlsp));
                Repeater1.DataBind();
            }
            if (!string.IsNullOrEmpty(Request.QueryString["srch"]))
            {
                var kq = from sp in db.tbl_SanPhams
                         where sp.TenSanPham.Contains(key) || sp.MaSanPham.Contains(key)
                         select sp;
                if(kq.Count() < 1)
                {
                    Response.Write("<script>alert('Không tìm thấy sản phẩm cần tìm!');</script>");
                }
                else
                {
                    Label3.Text = "Đã tìm thấy " + kq.Count() + " sản phẩm!";
                    Repeater1.DataSource = kq.ToList();
                    Repeater1.DataBind();
                }
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton AnDeBanOi = (ImageButton)sender;
            RepeaterItem item = (RepeaterItem)AnDeBanOi.NamingContainer;
            Label ma = (Label)item.FindControl("idSP");
            Session["idSP"] = ma.Text;
            Response.Redirect("chitietSanPham.aspx");
        }
    }
}