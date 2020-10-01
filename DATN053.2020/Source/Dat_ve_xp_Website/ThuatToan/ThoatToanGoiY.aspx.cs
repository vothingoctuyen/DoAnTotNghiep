using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Dat_ve_xp_Website.ThuatToan
{
    public partial class ThoatToanGoiY : System.Web.UI.Page
    {
        ThuVienKetNoiThuatToan kn = new ThuVienKetNoiThuatToan();
        DataTable tb;
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public string URL_IMDB(int i)
        {
            string id = kn.Ham_ExecuteScalar("select IMDBID from LINK where MOVIEID = " + i).Trim();
            int dem = id.Length;
            for (; dem < 8; dem++)
            {
                id = "0" + id;
            }
            return "https://www.imdb.com/title/tt" + id;
        }
        public string Load_The_Loai_Phim(int i)
        {
            string tag = kn.Ham_ExecuteScalar("select GENERES from MOVIES where MOVIEID = " + i).Trim();
            return tag;
        }
        public int[] ThuatToan(int id_user, int i_soluongnguoidung, int soluongitem)
        {
            if (Int32.Parse(kn.Ham_ExecuteScalar("select count(*) from RATINGS where USERID = " + id_user.ToString()).ToString().Trim()) == 0)
                return null;
            //Tạo mảng 1 chiều chứa i_soluongnguoidung ngoại trừ id_user
            string sql_USER = "select TOP " + i_soluongnguoidung.ToString() + " (USERID) from RATINGS where USERID <> " + id_user.ToString() + "ORDER BY NEWID()";
            tb = kn.Dulieu(sql_USER);
            tb.Rows.Add(id_user);
            int[] mang_u = kn.Table_To_Array_1(tb);
            mang_u = kn.Xoatrung(mang_u);

            //Tạo mảng 1 chiều chứa các phần tử sản phẩm được đánh giá bởi các người dùng
            string sql_item = "select TOP " + soluongitem + " MOVIEID from RATINGS where USERID = " + mang_u[0].ToString();
            foreach (int i in mang_u)
                sql_item += " or USERID = " + i.ToString();
            int[] mang_i = kn.Table_To_Array_1(kn.Dulieu(sql_item));
            mang_i = kn.Xoatrung(mang_i);

            //Trả về mảng 2 chiều từ 2 mảng 1 chiều
            float[,] mang_ui = kn.Return_2Chieu(mang_u, mang_i);

            //Bắt đầu vô thuật toán
            //Tạo mảng 2 chiều chứa số cột = số dòng = số lượng user
            //Mảng ma trận chứa các phần tử ĐỘ TƯƠNG ĐỒNG GIỮA CÁC USER
            double[,] Array_Pearsion = new double[mang_ui.GetLength(0), mang_ui.GetLength(0)];

            //Vòng lặp tính độ tương đồng của 2 người dùng đưa vào mảng;
            for (int u = 0; u < Array_Pearsion.GetLength(0); u++)
            {
                for (int v = 0; v < Array_Pearsion.GetLength(1); v++)
                {
                    Array_Pearsion[u, v] = kn.Tinh_Pearsion(u, v, mang_ui);
                }
            }

            //Tìm 2 người dùng tương đồng với người dùng id_user nhất
            int max1 = 0;
            int max2 = 0;
            int index_user_id = mang_u.Length - 1;
            kn.Return_2_Nguoi_Dung_Gan_Nhat(index_user_id, ref max1, ref max2, Array_Pearsion);

            double avg_ofuser = (double)(kn.Tinh_AVG_Of_Item(mang_ui, index_user_id));

            //Tạo bảng tính giá trị trung bình xếp hạng cho từng sản phẩm
            float[,] Array_AVG_Ratings_Item = new float[mang_ui.GetLength(0), mang_ui.GetLength(1)];

            Array_AVG_Ratings_Item = kn.Tinh_AVG_Ratings_Item(mang_ui);

            //Tính giá trị trung bình của các số 0 cho người dùng input, xong rồi mới lấy list đó ra order by desc để gợi ý
            double[] mang_result_AVG_u = new double[Array_AVG_Ratings_Item.GetLength(1)];

            mang_result_AVG_u = kn.Goi_Y_Gia_Tri_Trung_Binh_Cho_User_Input(Array_AVG_Ratings_Item, Array_Pearsion, max1, max2, index_user_id, avg_ofuser);

            double[] Mang_Item_And_Result = kn.SapXepMang(ref mang_i, mang_result_AVG_u);

            return mang_i;

        }
        public bool cayco = false;
        protected void submit_Click(object sender, EventArgs e)
        {
            cayco = true;
        }
    }
}