using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_HoaDonGuest : System.Web.UI.Page
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
            ListView1.DataSource = sv.htHoaDon1();
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

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            
        }

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pg = (DataPager)ListView1.FindControl("DataPager1");
            pg.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            hienthi();
        }

        protected void Button1_Click(object sender, EventArgs e)
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
                        sv.DuyetHoaDon(Id, idnv);
                    }
                }
            }
            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}