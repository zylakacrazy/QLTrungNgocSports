using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_HoaDonDaDuyet : System.Web.UI.Page
    {
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            hienthi();
        }
        
        public void hienthi()
        {
            ListView1.DataSource = sv.htHoaDon2();
            ListView1.DataBind();
        }
        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {

        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            string a = ListView1.DataKeys[e.ItemIndex].Values["id_HoaDon"].ToString();
            sv.DelHoaDon(int.Parse(a));
            sv.DelCTHD(int.Parse(a));
            hienthi();
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {

        }

        protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            ListView1.EditIndex = e.NewEditIndex;
            hienthi();
        }

        protected void ListView1_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ListView1.EditIndex = -1;
            hienthi();
        }
        dbQLTrungNgocSportsDataContext db = new dbQLTrungNgocSportsDataContext();
        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Label a = e.Item.FindControl("trangthaiLabel") as Label;
            if (a.Text != null)
            {
                if (a.Text == "1")
                {
                    a.Text = "đã duyệt";
                }
            }
            Label b = e.Item.FindControl("idkhachhangLabel") as Label;
            if(!string.IsNullOrEmpty(b.Text))
            {
                var result1 = from a1 in db.tbl_KhachHangs
                              where a1.id_KhachHang == int.Parse(b.Text)
                              select a1;
                foreach (var item in result1)
                {
                    b.Text = item.TenKhachHang;
                }
            }
            Label c = e.Item.FindControl("idnhanvienLabel") as Label;
            if(!string.IsNullOrEmpty(c.Text))
            {
                var result2 = from a2 in db.tbl_NhanViens
                              where a2.id_NhanVien == int.Parse(c.Text)
                              select a2;
                foreach (var item1 in result2)
                {
                    c.Text = item1.TenNhanVien;
                }
            }
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (ListViewDataItem item in this.ListView1.Items)
            {
                if (item.ItemType == ListViewItemType.DataItem)
                {
                    CheckBox checkBox = item.FindControl("CheckBox1") as CheckBox;
                    if (checkBox.Checked)
                    {
                        int Id = int.Parse((item.FindControl("id1Label") as Label).Text.Trim());
                        sv.DelHoaDon(Id);
                        sv.DelCTHD(Id);
                    }
                }
            }
            Response.Redirect(Request.Url.AbsolutePath);
        }

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pg = (DataPager)ListView1.FindControl("DataPager1");
            pg.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            hienthi();
        }
    }
}