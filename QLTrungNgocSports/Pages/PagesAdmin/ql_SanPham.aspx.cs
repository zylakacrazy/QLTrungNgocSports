using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_SanPham : System.Web.UI.Page
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
            ListView1.DataSource = sv.DisplaySanPham();
            ListView1.DataBind();
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            FileUpload fileName = (FileUpload)ListView1.InsertItem.FindControl("FileUpload1");
            if (Page.IsValid && fileName.HasFile)
            {
                TextBox masp = (TextBox)ListView1.InsertItem.FindControl("masanphamTextBox");
                TextBox tensp = (TextBox)ListView1.InsertItem.FindControl("tensanphamTextBox");
                int a = DateTime.Now.Millisecond;
                string hinhanh = "~/Images/LoaiSan/" + a + fileName.FileName;
                string filePath = MapPath(hinhanh);
                fileName.SaveAs(filePath);
                TextBox giasp = (TextBox)ListView1.InsertItem.FindControl("giasanphamTextBox");
                DropDownList loaisp = (DropDownList)ListView1.InsertItem.FindControl("DropDownList1");
                DropDownList hang = (DropDownList)ListView1.InsertItem.FindControl("DropDownList2");
                TextBox mota = (TextBox)ListView1.InsertItem.FindControl("motaTextBox");
                TextBox soluong = (TextBox)ListView1.InsertItem.FindControl("soluongTextBox");
                if (sv.AddSanPham(masp.Text, tensp.Text, int.Parse(loaisp.SelectedValue), float.Parse(giasp.Text), hinhanh, int.Parse(hang.SelectedValue), mota.Text, int.Parse(soluong.Text)) == true)
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
            string a = ListView1.DataKeys[e.ItemIndex].Values["id_SanPham"].ToString();
            sv.DelSanPham(int.Parse(a));
            hienthi();
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            FileUpload fileName = (FileUpload)ListView1.EditItem.FindControl("FileUpload2");
            if (Page.IsValid && fileName.HasFile)
            {
                int id = (int)ListView1.DataKeys[e.ItemIndex].Values["id_SanPham"];
                TextBox masp = (TextBox)ListView1.EditItem.FindControl("masanphamTextBox");
                TextBox tensp = (TextBox)ListView1.EditItem.FindControl("tensanphamTextBox");
                //int a = DateTime.Now.Millisecond;
                string hinhanh = "~/Images/imgSanPham/" + fileName.FileName;
                string filePath = MapPath(hinhanh);
                fileName.SaveAs(filePath);
                TextBox giasp = (TextBox)ListView1.EditItem.FindControl("giasanphamTextBox");
                DropDownList loaisp = (ListView1.EditItem.FindControl("DropDownList3") as DropDownList);
                DropDownList hang = (ListView1.EditItem.FindControl("DropDownList4") as DropDownList);
                TextBox mota = (TextBox)ListView1.EditItem.FindControl("motaTextBox");
                TextBox soluong = (TextBox)ListView1.EditItem.FindControl("soluongTextBox");
                if (sv.EditSanPham(id, masp.Text, tensp.Text, int.Parse(loaisp.SelectedValue), float.Parse(giasp.Text), hinhanh, int.Parse(hang.SelectedValue), mota.Text, int.Parse(soluong.Text)) == true)
                {
                    Response.Write("<script>alert('Sửa thành công!');</script>");
                    hienthi();
                }
                else
                {
                    Response.Write("<script>alert('Sửa không thành công!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Ảnh không được để trống!');</script>");
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

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            DropDownList drop = (DropDownList)ListView1.InsertItem.FindControl("DropDownList1");
            drop.DataSource = sv.DisplayLoaiSanPham();
            drop.DataValueField = "id_LoaiSanPham";
            drop.DataTextField = "TenLoaiSanPham";
            drop.DataBind();

            DropDownList drop1 = (DropDownList)ListView1.InsertItem.FindControl("DropDownList2");
            drop1.DataSource = sv.DisplayHSX();
            drop1.DataValueField = "id_HangSanXuat";
            drop1.DataTextField = "TenHangSanXuat";
            drop1.DataBind();
            // 
            DropDownList drop2 = (e.Item.FindControl("DropDownList3") as DropDownList);
            if (drop2 != null)
            {
                drop2.DataSource = sv.DisplayLoaiSan();
                drop2.DataValueField = "id_LoaiSan";
                drop2.DataTextField = "TenLoaiSan";
                drop2.DataBind();
            }
            DropDownList drop3 = (e.Item.FindControl("DropDownList4") as DropDownList);
            if (drop3 != null)
            {
                drop3.DataSource = sv.DisplayHSX();
                drop3.DataValueField = "id_HangSanXuat";
                drop3.DataTextField = "TenHangSanXuat";
                drop3.DataBind();
            }
        }

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pg = (DataPager)ListView1.FindControl("DataPager1");
            pg.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            hienthi();
        }

        protected void ListView1_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {

        }
    }
}