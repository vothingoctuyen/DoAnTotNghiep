using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Dat_ve_xp_Website.Interface
{
    public partial class ajax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string lenh = Request.Form["lenh"];
            KiemTraLenh(lenh);
        }
        string hienthiramanhinh;

        public string Hienthiramanhinh
        {
            get { return hienthiramanhinh; }
            set { hienthiramanhinh = value; }
        }

        public void kiemtrausernamecotontaihaykhong() {
            ExecuteScalar();
            //HttpCookie a =  Request.Cookies["ketqua"];
            //if (a == null)
            //{
            //    Response.Cookies["ketqua"].Value = Hienthiramanhinh.Trim();
            //    Response.Cookies["ketqua"].Expires = DateTime.Now.AddDays(1);
            //}
            //else
            //{
            //    Response.Cookies["ketqua"].Expires = DateTime.Now.AddDays(-1);
            //    Response.Cookies["ketqua"].Value = Hienthiramanhinh.Trim();
            //    Response.Cookies["ketqua"].Expires = DateTime.Now.AddDays(1);
            //    //Response.Cookies["ketqua"].Value = Hienthiramanhinh.Trim();
            //}
        }
        public void KiemTraLenh(string lenh)
        {
            if (lenh == "dangnhap")
                DangNhap();
            else if (lenh == "Execute")
                Execute();
            else if (lenh == "kiemtrausernamecotontaihaykhong")
                kiemtrausernamecotontaihaykhong();
            else if (lenh == "luucookie")
                luucookie(Request.Form["namecookie"].ToString(), Request.Form["valuecookie"].ToString());
            //else if (lenh == "laycookie")
            //    laycookie(Request.Form["namecookie"].ToString());
            else if (lenh == "get1odulieu")
                ExecuteScalar();
            else if (lenh == "xoacookie")
                xoacookie(Request.Form["cookiename"].ToString());
            else if (lenh == "getlistdata")
                getlistdata(Request.Form["sql"].ToString());
        }

        //Hàm xử lý đăng nhập
        public void DangNhap()
        {
            ThuVien tv = new ThuVien();
            string sql = Request.Form["sql"].ToString();
            if (tv.Ham_ExecuteNonQuery(sql) == true)
                Hienthiramanhinh = "Đã thêm vào thành công " + sql;
            else
                Hienthiramanhinh = "Thêm vào không thành công " + sql;
        }
        //Hàm dùng Execute
        public void Execute()
        {
            ThuVien tv = new ThuVien();
            if (tv.Ham_ExecuteNonQuery(Request.Form["sql"]) == true)
                Hienthiramanhinh = "true";
            else
                Hienthiramanhinh = "false";
        }

        //Hàm dùng Execute
        public void ExecuteScalar()
        {
            ThuVien tv = new ThuVien();
            Hienthiramanhinh = tv.Ham_ExecuteScalar(Request.Form["sql"]).Trim();
        }
        //Hàm lưu tên người dùng vào Cookie khi đăng ký, đăng nhập thành công
        public void luucookie(string namecookie, string valuecookie)
        {
            HttpCookie a = Request.Cookies[namecookie];
            if (a == null)
            {
                Response.Cookies[namecookie].Value = valuecookie;
                Response.Cookies[namecookie].Expires = DateTime.Now.AddDays(1);
            }
            else
            {
                Response.Cookies[namecookie].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies[namecookie].Value = valuecookie;
                Response.Cookies[namecookie].Expires = DateTime.Now.AddDays(1);
            }
            Hienthiramanhinh = "true";
        }
        //public void laycookie(string namecookie)
        //{
        //    HttpCookie a = Request.Cookies[namecookie];
        //    Hienthiramanhinh = a.Value;
        //}
        public void xoacookie(string namecookie)
        {
            Response.Cookies[namecookie].Expires = DateTime.Now.AddDays(-1);
            Hienthiramanhinh = "true";
        }

        //Hàm lấy nhiều ô dữ liệu cách nhau bởi dấu phẩy
        public void getlistdata(string sql)
        {
            ThuVien tv = new ThuVien();
            DataTable tb;
            tb = tv.Dulieu(sql);
            string ketqua = "";
            int i = 0;
            foreach (DataRow item in tb.Rows)
            {
                ketqua += "," + item[0].ToString();
                i++;
            }
            try
            {
                ketqua = ketqua.Remove(0, 1);
            }
            catch(Exception e) { }
            Hienthiramanhinh = ketqua;
        }
    }
}