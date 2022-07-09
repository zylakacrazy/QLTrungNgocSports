using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_LoaiSanPham : System.Web.UI.Page
    {
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hienthi();
            }
        }
        public void hienthi()
        {
            ListView1.DataSource = sv.DisplayLoaiSanPham();
            ListView1.DataBind();
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            TextBox TenLoaiSanPham = (TextBox)ListView1.InsertItem.FindControl("TenHangSanXuatTextBox");
            TextBox MoTa = (TextBox)ListView1.InsertItem.FindControl("HinhAnhTextBox");
            TextBox logoLoaiSanPham = (TextBox)ListView1.InsertItem.FindControl("MoTaTextBox");
            sv.AddLoaiSanPham(TenLoaiSanPham.Text, MoTa.Text, logoLoaiSanPham.Text);
            hienthi();
        }
        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            //string a = GridView1.DataKeys[e.RowIndex].Values["id_dk"].ToString();
            string a = ListView1.DataKeys[e.ItemIndex].Values["id_LoaiSanPham"].ToString();
            sv.DelLoaiSanPham(int.Parse(a));
            hienthi();
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            string id = ListView1.DataKeys[e.ItemIndex].Values["id_LoaiSanPham"].ToString();
            //string id = ((Label)ListView1.Items[e.ItemIndex].FindControl("id_LoaiSanPham")).Text.ToString();
            TextBox TenLoaiSanPham = (TextBox)ListView1.EditItem.FindControl("TenHangSanXuatTextBox");
            TextBox MoTa = (TextBox)ListView1.EditItem.FindControl("HinhAnhTextBox");
            TextBox logoLoaiSanPham = (TextBox)ListView1.EditItem.FindControl("MoTaTextBox");
            sv.EditLoaiSanPham(int.Parse(id), TenLoaiSanPham.Text, MoTa.Text, logoLoaiSanPham.Text);
            ListView1.EditIndex = -1;
            hienthi();
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

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pg = (DataPager)ListView1.FindControl("DataPager1");
            pg.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            hienthi();
        }
    }
}