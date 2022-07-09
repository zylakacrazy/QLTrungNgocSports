using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;

namespace QLTrungNgocSports.Pages.Share
{
    public partial class _Layout : System.Web.UI.MasterPage
    {
        QLTrungNgocSportsService sv = new QLTrungNgocSportsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string result = "default.aspx?srch=" + TextBox1.Text;
            Response.Redirect(result);
        }
    }
}