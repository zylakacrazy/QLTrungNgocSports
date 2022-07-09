using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_NhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Label gioitinh = e.Item.FindControl("GioiTinhLabel") as Label;
            if (gioitinh != null)
            {
                if (gioitinh.Text == "0")
                {
                    gioitinh.Text = "Nam";
                }
                else if (gioitinh.Text == "3")
                {
                    gioitinh.Text = "Khác";
                }
                else
                {
                    gioitinh.Text = "Nữ";
                }
            }
            Label quyen = e.Item.FindControl("id_TypeAccountLabel") as Label;
            if (quyen != null)
            {
                if (quyen.Text == "0")
                {
                    quyen.Text = "Quyền quản trị";
                }
                else if (quyen.Text == "1")
                {
                    quyen.Text = "Quyền khách hàng";
                }
                else
                {
                    quyen.Text = "Quyền nhân viên";
                }
            }
        }
    }
}