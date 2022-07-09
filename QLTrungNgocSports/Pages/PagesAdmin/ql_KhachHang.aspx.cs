using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_KhachHang : System.Web.UI.Page
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
            var result = (from d in db.tbl_KhachHangs
                         select d).ToList();
            ListView1.DataSource = result;
            ListView1.DataBind();
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            TextBox tenkh = (TextBox)ListView1.InsertItem.FindControl("TenKhachHangTextBox");
            DropDownList gioitinh = (ListView1.InsertItem.FindControl("DropDownList1") as DropDownList);
            TextBox sdt = (TextBox)ListView1.InsertItem.FindControl("SoDienThoaiTextBox");
            TextBox ngaysinh = (TextBox)ListView1.InsertItem.FindControl("NgaySinhTextBox");
            DateTime ns =  DateTime.Parse(ngaysinh.Text);
            TextBox diachi = (TextBox)ListView1.InsertItem.FindControl("DiaChiTextBox");
            TextBox email = (TextBox)ListView1.InsertItem.FindControl("EmailTextBox");
            TextBox us = (TextBox)ListView1.InsertItem.FindControl("userNameTextBox");
            TextBox pass = (TextBox)ListView1.InsertItem.FindControl("passWordTextBox");
            DropDownList quyen = (ListView1.InsertItem.FindControl("DropDownList2") as DropDownList);
            if (sv.AddKhachHang(tenkh.Text, int.Parse(gioitinh.SelectedValue), sdt.Text, ns, diachi.Text, email.Text, us.Text, pass.Text, int.Parse(quyen.SelectedValue)) == true)
            {
                Response.Write("<script>alert('Thêm thành công!');</script>");
                hienthi();
            }
            else
            {
                Response.Write("<script>alert('Username đã tồn tại, hoặc chưa nhập đúng dữ liệu!');</script>");
            }
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            
            string a = ListView1.DataKeys[e.ItemIndex].Values["id_KhachHang"].ToString();
            sv.DelKhachHang(int.Parse(a));
            hienthi();
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            int id = (int)ListView1.DataKeys[e.ItemIndex].Values["id_KhachHang"];
            TextBox tenkh = (TextBox)ListView1.EditItem.FindControl("TenKhachHangTextBox");
            DropDownList gioitinh = (ListView1.EditItem.FindControl("DropDownList3") as DropDownList);
            TextBox sdt = (TextBox)ListView1.EditItem.FindControl("SoDienThoaiTextBox");
            TextBox ngaysinh = (TextBox)ListView1.EditItem.FindControl("NgaySinhTextBox");
            DateTime ns = DateTime.Parse(ngaysinh.Text);
            TextBox diachi = (TextBox)ListView1.EditItem.FindControl("DiaChiTextBox");
            TextBox email = (TextBox)ListView1.EditItem.FindControl("EmailTextBox");
            TextBox us = (TextBox)ListView1.EditItem.FindControl("userNameTextBox");
            TextBox pass = (TextBox)ListView1.EditItem.FindControl("passWordTextBox");
            DropDownList quyen = (ListView1.EditItem.FindControl("DropDownList4") as DropDownList);
            if (sv.EditKhachHang(id, tenkh.Text, int.Parse(gioitinh.SelectedValue), sdt.Text, ns, diachi.Text, email.Text, us.Text, pass.Text, int.Parse(quyen.SelectedValue)) == true)
            {
                Response.Write("<script>alert('Sửa thành công!');</script>");
                hienthi();
            }
            else
            {
                Response.Write("<script>alert('Username đã tồn tại, hoặc chưa nhập đúng dữ liệu! Vui lòng thử lại');</script>");
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


        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var result = (from q in db.tbl_TypeAccounts
                          select q).ToList();
            //DropDownList drop = (e.Item.FindControl("DropDownList2") as DropDownList);
            DropDownList drop = ListView1.InsertItem.FindControl("DropDownList2") as DropDownList;
            drop.DataSource = result;
            drop.DataValueField = "id_TypeAccount";
            drop.DataTextField = "RoleName";
            drop.DataBind();

            DropDownList drop1 = (e.Item.FindControl("DropDownList4") as DropDownList);
            if (drop1 != null)
            {
                drop1.DataSource = result;
                drop1.DataValueField = "id_TypeAccount";
                drop1.DataTextField = "RoleName";
                drop1.DataBind();
            }

            Label gioitinh = e.Item.FindControl("GioiTinhLabel") as Label;
            if(gioitinh != null)
            {
                if (gioitinh.Text == "0")
                {
                    gioitinh.Text = "Nam";
                }else if(gioitinh.Text == "3") 
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
                if (quyen.Text == "0") {
                    quyen.Text = "Quyền quản trị";
                }else if (quyen.Text == "1")
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