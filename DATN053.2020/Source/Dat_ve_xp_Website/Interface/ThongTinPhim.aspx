<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ThongTinPhim.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.ThongTinPhim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container detail-film">
        <div class="row no-gutters position-relative" style="border: solid 1px #FFF; border-radius: 6px;max-width: fit-content;margin:auto">
            <div class="col-md-6 mb-md-0 p-md-4" style="
    /*width: 0px;*/
">
                <img src="../ThuatToan/image/1 (<% Random r = new Random(); Response.Write(r.Next(1, 80).ToString()); %>).jpg" style="max-width: min-content;margin-left: 82px;" />
            </div>
            <div class="col-md-6 position-static p-4 pl-md-0">
                <p ></p>
                <h1 id="tenphim"></h1>
                <p></p>
                
                <div>
                    <a href="javascript:;" class="btn btn-primary btn-lg btn-block" tabindex="-1" role="button" aria-disabled="false" style="text-decoration-line: none;" data-toggle="modal" data-target="#datvexemphim">ĐẶT VÉ PHIM</a>
                </div>
            </div>
        </div>
    </div>

    <hr class="container"/>
    <div class="container">
        <div class="row">
            <h2>Đánh giá & Bình luận phim</h2>&nbsp;&nbsp;  
            <%--Begin tham gia bình luận phim--%>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reviewthisfilm" style="margin-bottom: 10px;">
                Viết bài đánh giá phim
            </button>
            <%--End tham gia bình luận phim--%>
            <br />
            <% 
                string sql = "select count(*) from RATINGS where MOVIEID = '" + Request.QueryString["id"] + "'";
                Dat_ve_xp_Website.ThuVien tv = new Dat_ve_xp_Website.ThuVien();
                //string so_luong_rating = tv.Ham_ExecuteScalar(sql);
                //int soluongrating;
                //if (so_luong_rating != "")
                //    soluongrating = int.Parse(so_luong_rating);
                //else
                //    soluongrating = 0;
                //if (soluongrating > 0)
                {
                    System.Data.DataTable tb_rating_comment = new System.Data.DataTable();
                    sql = "select USERID, MOVIEID, CMTContent from COMMENT where MOVIEID = '" + Request.QueryString["id"] + "'";
                    tb_rating_comment = tv.Dulieu(sql);

                    string _tennguoidung = "";
                    string _rating = "0";

                    foreach(System.Data.DataRow rowcomment in tb_rating_comment.Rows)
                    {
                        _rating = tv.Ham_ExecuteScalar("select RATING from ratings where USERID = '"+rowcomment[0]+"' and MOVIEID = '"+ rowcomment[1] + "'");
                        _tennguoidung = tv.Ham_ExecuteScalar("select Surname from MEMBER where USERID = '"+rowcomment[0]+"'");
            %>
            <%--item bình luận--%>
            <div class="media border p-3 item-review">
                <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width: 60px;">
                <div class="media-body">
                    <h4><% Response.Write(_tennguoidung); %></h4>
                    <p><% Response.Write(rowcomment[2].ToString()); %></p>
                    <small><i><% Response.Write(_rating); %> sao</i></small>
                </div>
            </div>
            <%--ENd Item bình luận--%>

            <% }
                } %>
        </div>
    </div>

    <!-- Đánh giá và bình luận phim -->
    <div class="modal fade" id="reviewthisfilm">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Đánh giá & bình luận phim</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Xếp hạng cho phim này</label>
                        <select class="form-control" id="rating">
                            <option>1 sao</option>
                            <option>2 sao</option>
                            <option>3 sao</option>
                            <option>4 sao</option>
                            <option>5 sao</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Viết bài đánh giá</label>
                        <textarea class="form-control" id="cmtcontent" rows="8"></textarea>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng lại</button>
                    <button type="button" class="btn btn-success" onclick="insertbinhluan()">Gửi bình luận</button>
                </div>

            </div>
        </div>
    </div>
    <%--Kết thúc phần đánh giá và bình luận phim--%>


    <%--Popup Đặt vé xem phim--%>
    <div class="modal fade" id="datvexemphim">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Đặt vé xem phim</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <%--Begin chọn rạp--%>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Chọn rạp</label>
                        <select class="form-control" id="rapchieuphim" onchange="loadngaychieu()">
                            <%--<option>Tân Phú</option>
                            <option>Tân Bình</option>
                            <option>Hóc Môn</option>
                            <option>Vũng Tàu</option>--%>
                        </select>
                    </div>
                    <%--End chọn rạp--%>

                    <%--Begin chọn ngày--%>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Chọn ngày chiếu</label>
                        <select class="form-control" id="ngaychieuphim" onchange="loadphongchieu()" >
                            <option>15/5/2020</option>
                            <option>16/5/2020</option>
                            <option>17/5/2020</option>
                            <option>18/5/2020</option>
                        </select>
                    </div>
                    <%--End chọn ngày--%>

                    <%--Begin chọn ngày--%>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Chọn phòng chiếu phim</label>
                        <select class="form-control" id="phongchieuphim" onchange="loadgiochieu()" >
                        </select>
                    </div>
                    <%--End chọn ngày--%>

                    <%--Begin chọn giờ chiếu--%>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Chọn giờ chiếu</label>
                        <select class="form-control" id="giochieuphim" onchange="loadghengoi()" >
                            <option>08:30</option>
                            <option>10:20</option>
                            <option>12:40</option>
                            <option>15:25</option>
                        </select>
                    </div>
                    <%--End chọn giờ chiều--%>


                    <%--Begin chọn ghế--%>

                    <style>
                        .chonchongoi > ul > li > ul > li {
                            display: inline-block;
                        }

                        .chonchongoi > ul > li {
                            list-style-type: none;
                            display: -webkit-box;
                            margin-bottom: 10px;
                        }

                        .chongheso {
                            background-color: red;
                            border: red;
                            color: #fff;
                        }

                            .chonchongoi > ul {
                                width: max-content;
                                margin-left: -4rem;
                            }
                    </style>
                    <script>
                        function chonghe(soghe) {
                            document.getElementById(soghe).classList.toggle("chongheso");
                            document.getElementById("ghedachon").innerHTML += soghe + ",";

                            //desabled cho nút đã chọn
                            document.getElementById(soghe).disabled = true;
                            //document.getElementById(soghe).classList = "btn btn-outline-danger chongheso";
                            hambattatdatve();
                            //alert(document.getElementById('buttondatve').innerHTML);

                        }
                    </script>
                    <div class="form-group" id="group-ghengoi">
                        <label for="exampleFormControlSelect1">Chọn ghế ngồi</label>
                    <div class="chonchongoi container">
                        <ul>

                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>A
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('A"+i.ToString()+"')"); %> id=<% Response.Write("A" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     A
                                </ul>
                            </li>
                            <%--End hàng ghế--%>

                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>B
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('B"+i.ToString()+"')"); %> id=<% Response.Write("B" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     B
                                </ul>
                            </li>
                            <%--End hàng ghế--%>

                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>C
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('C"+i.ToString()+"')"); %> id=<% Response.Write("C" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     C
                                </ul>
                            </li>
                            <%--End hàng ghế--%>

                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>D
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('D"+i.ToString()+"')"); %> id=<% Response.Write("D" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     D
                                </ul>
                            </li>
                            <%--End hàng ghế--%>    

                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>E
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('E"+i.ToString()+"')"); %> id=<% Response.Write("E" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     E
                                </ul>
                            </li>
                            <%--End hàng ghế--%>
                           
                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>F
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('F"+i.ToString()+"')"); %> id=<% Response.Write("F" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     F
                                </ul>
                            </li>
                            <%--End hàng ghế--%>

                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>G
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('G"+i.ToString()+"')"); %> id=<% Response.Write("G" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     G
                                </ul>
                            </li>
                            <%--End hàng ghế--%>

                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>H
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('H"+i.ToString()+"')"); %> id=<% Response.Write("H" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     H
                                </ul>
                            </li>
                            <%--End hàng ghế--%>

                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>I
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('I"+i.ToString()+"')"); %> id=<% Response.Write("I" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     I
                                </ul>
                            </li>
                            <%--End hàng ghế--%>

                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>J
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('J"+i.ToString()+"')"); %> id=<% Response.Write("J" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     J
                                </ul>
                            </li>
                            <%--End hàng ghế--%>

                            <%--Begin hàng ghế--%>
                            <li>
                                <ul>K
                                    <% for (int i = 1; i <= 9; i++)
                                        { %>
                                        <li><button type="button" class="btn btn-outline-primary" onclick=<% Response.Write("chonghe('K"+i.ToString()+"')"); %> id=<% Response.Write("K" + i.ToString()); %>><% Response.Write(i.ToString()); %></button></li>
                                    <% } %>
                                     K
                                </ul>
                            </li>
                            <%--End hàng ghế--%>
                        </ul>
                    </div>
                        </div>
                    <p>Mời bạn chọn ghế: <span id="ghedachon"></span> <button type="button" class="btn btn-success" onclick="clickchonlainghe()">Chọn lại ghế</button></p>
                    <%--End chọn ghế--%>
                   
                    <button type="button" class="btn btn-outline-primary">1</button> Ghế trống
                    <button type="button" class="btn btn-outline-danger chongheso" disabled>2</button> Ghế đã đặt
                    <button type="button" class="btn btn-outline-primary chongheso" disabled>3</button> Ghế đang chọn
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="closedatve">Đóng lại</button>
                    <button type="button" class="btn btn-success" onclick="clickdangnhap()" id="buttondatve" disabled>Đặt vé</button>
                </div>
            </div>
        </div>
    </div>
    <%--Kết thúc phần popup đặt vé xem phim--%>
    <style>
        .detail-film img, .item-review {
            width: -webkit-fill-available;
        }

        .item-review {
            margin-bottom: 10px;
        }
    </style>

    <script>
        //function clickdangnhap() {
        //    (async () => {
        //        //alert(await getCookie('user').trim());
        //        //if (await getCookie('user') == "") {
        //            document.getElementById("btndangnhap").click();
        //            document.getElementById("closedatve").click();
        //        //}
        //        //else 
        //        ////Tiến hành cho đặt vé
        //        //datveonline();
        //    })()
            
        //}

        
    </script>
    
</asp:Content>
