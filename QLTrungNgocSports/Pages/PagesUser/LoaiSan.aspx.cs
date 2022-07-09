using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesUser
{
    public partial class LoaiSan : System.Web.UI.Page
    {
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["idKH"] == null)
                {
                    Response.Write("<script>alert('Phải đăng nhập để sử dụng chức năng này!');window.location.href=('default.aspx');</script>");
                }
                hienthi();
            }
        }
        public void hienthi() 
        {
            DataList1.DataSource = sv.DisplaySan();
            DataList1.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton AnDeBanOi = (ImageButton)sender;
            DataListItem item = (DataListItem)AnDeBanOi.NamingContainer;
            Label ma = (Label)item.FindControl("idSan");
            Session["idSan"] = ma.Text;
            Response.Redirect("ChiTietThueSan.aspx");
        }

    }
}