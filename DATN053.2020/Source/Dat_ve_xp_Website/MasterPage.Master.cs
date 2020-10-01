using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Dat_ve_xp_Website
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void LuuCookieNguoiDung(string tennguoidung)
        {
            HttpCookie ck = new HttpCookie("ketqua");
            ck.Value = "true";
            ck.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(ck);
            

            //HttpCookie ck = Request.Cookies("TenDangNhap");

            //string s = ck.Value;
        }
        public String LayTenNguoiDung()
        {
            if (Request.Cookies["ThongTinNguoiDung"] != null)
                return Request.Cookies["ThongTinNguoiDung"].Value;
            else
                return "Không có lưu gì trong cookie hết á";
        }
        private string tennguoidung;
        public string Tennguoidung
        {
            get { return LayTenNguoiDung(); }
            set { tennguoidung = value; }
        }
        
    }
}