using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_DonDatSan : System.Web.UI.Page
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
            ListView1.DataSource = sv.htDonDatSan();
            ListView1.DataBind();
        }
        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            DropDownList tensan = ListView1.InsertItem.FindControl("DropDownList1") as DropDownList;
            TextBox loaisan = ListView1.InsertItem.FindControl("tenloaisanTextBox") as TextBox;
            TextBox ngaythue = ListView1.InsertItem.FindControl("ngaythueTextBox") as TextBox;
            DateTime nt = DateTime.Parse(ngaythue.Text);
            TextBox thoigianbatdau = ListView1.InsertItem.FindControl("timeStarTextBox") as TextBox;
            DateTime bd = DateTime.Parse(thoigianbatdau.Text);
            TextBox thoigianketthuc = ListView1.InsertItem.FindControl("timeOverTextBox") as TextBox;
            DateTime kt = DateTime.Parse(thoigianketthuc.Text);
            DropDownList tenkh = ListView1.InsertItem.FindControl("DropDownList2") as DropDownList;
            TextBox sdt = ListView1.InsertItem.FindControl("sdt") as TextBox;
            TextBox tonggia = ListView1.InsertItem.FindControl("giaTextBox") as TextBox;
            DateTime ngaydk = DateTime.Now.Date;
            if (sv.DangKyThue(int.Parse(tenkh.SelectedValue), int.Parse(tensan.SelectedValue), nt.Date, bd, kt,float.Parse(tonggia.Text)) == true)
            {
                Response.Write("<script>alert('Thêm thành công!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Thêm không thành công!');</script>");
            }
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            string a = ListView1.DataKeys[e.ItemIndex].Values["id"].ToString();
            sv.DelDonDatSan(int.Parse(a));
            hienthi();
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            int id = (int)ListView1.DataKeys[e.ItemIndex].Values["id"];
            DropDownList tensan = ListView1.EditItem.FindControl("DropDownList3") as DropDownList;
            TextBox loaisan = ListView1.EditItem.FindControl("tenloaisanTextBox") as TextBox;
            TextBox ngaythue = ListView1.EditItem.FindControl("ngaythueTextBox") as TextBox;
            DateTime nt = DateTime.Parse(ngaythue.Text);
            TextBox thoigianbatdau = ListView1.EditItem.FindControl("timeStarTextBox") as TextBox;
            DateTime bd = DateTime.Parse(thoigianbatdau.Text);
            TextBox thoigianketthuc = ListView1.EditItem.FindControl("timeOverTextBox") as TextBox;
            DateTime kt = DateTime.Parse(thoigianketthuc.Text);
            DropDownList tenkh = ListView1.EditItem.FindControl("DropDownList4") as DropDownList;
            TextBox sdt = ListView1.EditItem.FindControl("sdt") as TextBox;
            DateTime ngaydk = DateTime.Now.Date;
            if (sv.EditDonDatSan(id, int.Parse(tenkh.SelectedValue), int.Parse(tensan.SelectedValue), nt.Date, bd, kt) == true)
            {
                Response.Write("<script>alert('Sửa thành công!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Sửa không thành công!');</script>");
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
        dbQLTrungNgocSportsDataContext db = new dbQLTrungNgocSportsDataContext();
        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            DropDownList drop = ListView1.InsertItem.FindControl("DropDownList1") as DropDownList;
            if(drop != null)
            {
                drop.DataSource = sv.DisplaySan();
                drop.DataTextField = "tensan";
                drop.DataValueField = "id";
                drop.DataBind();
            }

            var result = (from kh in db.tbl_KhachHangs
                          select kh).ToList();

            DropDownList drop1 = ListView1.InsertItem.FindControl("DropDownList2") as DropDownList;
            if (drop1 != null)
            {
                drop1.DataSource = result;
                drop1.DataTextField = "userName";
                drop1.DataValueField = "id_KhachHang";
                drop1.DataBind();
            }
            //
            DropDownList drop2 = e.Item.FindControl("DropDownList3") as DropDownList;
            if (drop2 != null)
            {
                drop2.DataSource = sv.DisplaySan();
                drop2.DataTextField = "tensan";
                drop2.DataValueField = "id";
                drop2.DataBind();
            }

            DropDownList drop3 = e.Item.FindControl("DropDownList4") as DropDownList;
            if (drop3 != null)
            {
                drop3.DataSource = result;
                drop3.DataTextField = "userName";
                drop3.DataValueField = "id_KhachHang";
                drop3.DataBind();
            }
            Label tt = e.Item.FindControl("trangthaiLabel") as Label;
            if (tt != null)
            {
                if (tt.Text == "")
                {
                    tt.Text = "<p style='color:green;'>Đang chờ</p>";
                }
                //else
                //{
                //    tt.Text = "Nữ";
                //}
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (ListViewDataItem item in this.ListView1.Items)
            {
                if (item.ItemType == ListViewItemType.DataItem)
                {
                    CheckBox checkBox = item.FindControl("CheckBox1") as CheckBox;
                    if (checkBox.Checked)
                    {
                        int Id = int.Parse((item.FindControl("idLabel") as Label).Text.Trim());
                        sv.DelDonDatSan(Id);
                    }
                }
            }
            Response.Redirect(Request.Url.AbsolutePath);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int idnv = (int)Session["id"];
            foreach (ListViewDataItem item in this.ListView1.Items)
            {
                if (item.ItemType == ListViewItemType.DataItem)
                {
                    CheckBox checkBox = item.FindControl("CheckBox1") as CheckBox;
                    if (checkBox.Checked)
                    {
                        int Id = int.Parse((item.FindControl("idLabel") as Label).Text.Trim());
                        sv.DuyetDonDatSan(Id,idnv);
                    }
                }
            }
            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}