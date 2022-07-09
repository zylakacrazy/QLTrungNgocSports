using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_San : System.Web.UI.Page
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
            ListView1.DataSource = sv.DisplaySan();
            ListView1.DataBind();
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            
            FileUpload fileName = (FileUpload)ListView1.InsertItem.FindControl("FileUpload1");
            if (Page.IsValid && fileName.HasFile)
            {
                TextBox tensan = (TextBox)ListView1.InsertItem.FindControl("tensanTextBox");
                //int a = DateTime.Now.Millisecond;
                string hinhanh = "~/Images/LoaiSan/" + fileName.FileName;
                string filePath = MapPath(hinhanh);
                fileName.SaveAs(filePath);
                TextBox chitiet = (TextBox)ListView1.InsertItem.FindControl("chitietTextBox");
                DropDownList loaisan = (DropDownList)ListView1.InsertItem.FindControl("DropDownList1");
                TextBox trangthai = (TextBox)ListView1.InsertItem.FindControl("trangthaiTextBox");
                TextBox soluong = (TextBox)ListView1.InsertItem.FindControl("soluongTextBox");
                TextBox dongia = (TextBox)ListView1.InsertItem.FindControl("dongiaTextBox");
                if (sv.AddSan(tensan.Text, hinhanh, chitiet.Text, int.Parse(loaisan.SelectedValue), int.Parse(trangthai.Text), int.Parse(soluong.Text), float.Parse(dongia.Text)) == true)
                {
                    Response.Write("<script>alert('Thêm thành công!');</script>");
                    hienthi();
                }
                else
                {
                    Response.Write("<script>alert('Thêm không thành công!');</script>");
                }
            }else{
                Response.Write("<script>alert('Ảnh không được để trống!');</script>");
            }
           
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            string a = ListView1.DataKeys[e.ItemIndex].Values["id"].ToString();
            sv.DelSan(int.Parse(a));
            hienthi();
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            FileUpload fileName = (FileUpload)ListView1.EditItem.FindControl("FileUpload2");
            if (Page.IsValid && fileName.HasFile)
            {
                string id = ListView1.DataKeys[e.ItemIndex].Values["id"].ToString();
                TextBox tensan = (TextBox)ListView1.EditItem.FindControl("tensanTextBox");
                int a = DateTime.Now.Millisecond;
                string hinhanh = "~/Images/LoaiSan/" + a + fileName.FileName;
                string filePath = MapPath(hinhanh);
                fileName.SaveAs(filePath);
                TextBox chitiet = (TextBox)ListView1.EditItem.FindControl("chitietTextBox");
                DropDownList loaisan = (ListView1.EditItem.FindControl("DropDownList2") as DropDownList);
                TextBox trangthai = (TextBox)ListView1.EditItem.FindControl("trangthaiTextBox");
                TextBox soluong = (TextBox)ListView1.EditItem.FindControl("soluongTextBox");
                TextBox dongia = (TextBox)ListView1.EditItem.FindControl("dongiaTextBox");
                if(sv.EditSan(int.Parse(id), tensan.Text, hinhanh, chitiet.Text, int.Parse(loaisan.SelectedValue), int.Parse(trangthai.Text), int.Parse(soluong.Text), float.Parse(dongia.Text)) == true){
                    Response.Write("<script>alert('Sửa thành công!');</script>");
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
            drop.DataSource = sv.DisplayLoaiSan();
            drop.DataValueField = "id_LoaiSan";
            drop.DataTextField = "TenLoaiSan";
            drop.DataBind();

            DropDownList drop1 = (e.Item.FindControl("DropDownList2") as DropDownList);
            if (drop1 != null)
            {
                drop1.DataSource = sv.DisplayLoaiSan();
                drop1.DataValueField = "id_LoaiSan";
                drop1.DataTextField = "TenLoaiSan";
                drop1.DataBind();
            }
        }

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pg = (DataPager)ListView1.FindControl("DataPager1");
            pg.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            hienthi();
        }
    }
}