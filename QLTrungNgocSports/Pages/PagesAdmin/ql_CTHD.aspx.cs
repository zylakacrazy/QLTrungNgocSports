using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTrungNgocSports.Pages.PagesAdmin
{
    public partial class ql_CTHD : System.Web.UI.Page
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
            string query = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(query))
            {
                Repeater1.DataSource = sv.htCTHD(int.Parse(query));
                Repeater1.DataBind();
            }
            
        }
    }
}