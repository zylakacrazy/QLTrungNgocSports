using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_BannerSlide : System.Web.UI.Page
    {
        dbQLTrungNgocSportsDataContext db = new dbQLTrungNgocSportsDataContext();
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
            var result = (from h in db.tbl_BannerSildes
                          select h).ToList();
            ListView1.DataSource = result;
            ListView1.DataBind();
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            FileUpload fileName = (FileUpload)ListView1.InsertItem.FindControl("FileUpload1");
            if (Page.IsValid && fileName.HasFile)
            {
                int a = DateTime.Now.Millisecond;
                string hinhanh = "~/Images/Banner/" + a + fileName.FileName;
                string filePath = MapPath(hinhanh);
                fileName.SaveAs(filePath);
                TextBox MoTa = (TextBox)ListView1.InsertItem.FindControl("MoTaTextBox");
                if (sv.ThemBanner(hinhanh, MoTa.Text) == true)
                {
                    Response.Write("<script>alert('Thêm thành công!');</script>");
                    hienthi();
                }
                else
                {
                    Response.Write("<script>alert('Thêm không thành công!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Ảnh không được để trống!');</script>");
            }

        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            string a = ListView1.DataKeys[e.ItemIndex].Values["id_BannerSlide"].ToString();
            sv.DelBanner(int.Parse(a));
            hienthi();
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            FileUpload fileName = (FileUpload)ListView1.EditItem.FindControl("FileUpload2");
            if (Page.IsValid && fileName.HasFile)
            {
                int id = (int)ListView1.DataKeys[e.ItemIndex].Values["id_BannerSlide"];
                int a = DateTime.Now.Millisecond;
                string hinhanh = "../../Images/Banner/" + a + fileName.FileName;
                string filePath = MapPath(hinhanh);
                fileName.SaveAs(filePath);
                TextBox MoTa = (TextBox)ListView1.EditItem.FindControl("MoTaTextBox");
                if (sv.EditBanner(id, hinhanh, MoTa.Text) == true)
                {
                    Response.Write("<script>allert('Sửa thành công!');</script>");
                }
                else
                {
                    Response.Write("<script>allert('Sửa không thành công!');</script>");
                }
            }
            else
            {
                Response.Write("<script>allert('Ảnh không được để trống!');</script>");
            }
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