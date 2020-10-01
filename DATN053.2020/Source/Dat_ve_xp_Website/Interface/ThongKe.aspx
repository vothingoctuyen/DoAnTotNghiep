<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.ThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br />
        <h1 class="text-center">Thống kê báo cáo theo phim</h1>
        <br />

        <% 
            string sql = "select DISTINCT(MOVIES.MovieID), TITLE from PROJECTION, TICKETINGLISTONLINE, MOVIES where PROJECTION.ProjectionID = TICKETINGLISTONLINE.ProjectionID and MOVIES.MOVIEID = PROJECTION.MovieID";
            System.Data.DataTable tb = new System.Data.DataTable();
            Dat_ve_xp_Website.ThuVien tv = new Dat_ve_xp_Website.ThuVien();

            tb = tv.Dulieu(sql);

                %>

        <div class="form-group" style="max-width: 33rem; border: 1px solid #c6c6c6; padding: 1rem; margin: auto; border-radius: 5px;background-color: #fff;">
            <label for="exampleFormControlSelect1">Chọn phim</label>
            <select class="form-control" id="chonphimcanxuatbaocao">
                <option>Chọn phim bạn cần truy xuất</option>
                <% foreach (System.Data.DataRow dr in tb.Rows)
            { %>
                <option><% Response.Write(dr[1].ToString()); %></option>
                <% } %>
            </select>
            <br />
            <div id="button-thongke">
            <button type="button" class="btn btn-danger" onclick="xuatthongke()">Xuất Thống Kê</button>
                </div>
            <br />
            <p id="textthongke"></p>

            

        </div>

        
    </div>

    <script>
        function xuatthongke() {
            (async () => {
                $('#textthongke').text("");
                if (document.getElementById('chonphimcanxuatbaocao').selectedIndex == 0)
                {
                    alert("Chưa chọn phim để xuất báo cáo!");
                    return;
                }
                var title = document.getElementById('chonphimcanxuatbaocao')[document.getElementById('chonphimcanxuatbaocao').selectedIndex].value;
                var sql = "select MOVIES.MOVIEID from MOVIES where TITLE = N'" + title + "'";
                var idphim = await get1odulieutudb(sql);

                sql = "select count(SEAT.SeatID) from MOVIES, PROJECTION, SEAT Where MOVIES.MOVIEID = PROJECTION.MovieID and PROJECTION.ProjectionID = SEAT.ProjectionID and MOVIES.MOVIEID = " + idphim;
                var ketqua = await get1odulieutudb(sql);

                document.getElementById('textthongke').innerHTML = "<table class=\"table\"><thead class=\"thead-dark\" ><tr><th scope=\"col\">Tên phim</th><th scope=\"col\">Số lượng vé</th></tr></thead ><tbody><tr><td>" + title + "</td><td>" + ketqua + "</td></tr></tbody></table >";
            })()
        }
    </script>


    <style>
        #button-thongke {
            margin: auto;
            width: max-content;
        }
    </style>

</asp:Content>
