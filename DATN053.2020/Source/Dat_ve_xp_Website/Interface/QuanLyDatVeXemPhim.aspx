<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyDatVeXemPhim.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.QuanLyDatVeXemPhim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">
        <br />
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Chọn phim</h4>
                    </div>
                    
                    <%--Danh sách bên dưới--%>
                    <ul class="list-group">
                        <%--Begin Item--%>
                        <li class="movie-item"><a class="movie-link" href="javascript:;" onclick="hienthirapphim('Lê Võ Tuyền')">
                            <div class="movie-body">
                                <img src="https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg"/>
                                <div class="title-movie">
                                    <p class="text-uppercase">Love Scenes That Went Too Far</p>
                                </div>
                            </div>
                        </a></li>
                        <%--End Item--%>

                        <%--Begin Item--%>
                        <li class="movie-item"><a class="movie-link" href="javascript:;" onclick="hienthirapphim('Trần Huyền Trang')">
                            <div class="movie-body">
                                <img src="https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg"/>
                                <div class="title-movie">
                                    <p class="text-uppercase">Love Scenes That Went Too Far</p>
                                </div>
                            </div>
                        </a></li>
                        <%--End Item--%>

                        <%--Begin Item--%>
                        <li class="movie-item"><a class="movie-link" href="javascript:;" onclick="hienthirapphim('Lưu Bị')">
                            <div class="movie-body">
                                <img src="https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg"/>
                                <div class="title-movie">
                                    <p class="text-uppercase">Love Scenes That Went Too Far</p>
                                </div>
                            </div>
                        </a></li>
                        <%--End Item--%>
                    </ul>
                    <%--End Danh sách bên dưới--%>

                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Chọn rạp chiếu</h4>
                    </div>
                    
                    <%--Danh sách bên dưới--%>
                    <ul class="list-group" id="showrapphim">
                        <%--Begin Item--%>
                        <li class="movie-item"><a class="movie-link" href="javascript:;" onclick="hienthilichchieu(1)">
                            <div class="movie-body">
                                <div class="title-movie text-uppercase">
                                    Lê Gia Bảo Hân
                                </div>
                            </div>
                        </a></li>
                        <%--End Item--%>

                        <%--Begin Item--%>
                        <li class="movie-item"><a class="movie-link" href="javascript:;" onclick="hienthilichchieu(1)">
                            <div class="movie-body">
                                <div class="title-movie text-uppercase">
                                    Lê Gia Bảo Hân
                                </div>
                            </div>
                        </a></li>
                        <%--End Item--%>

                        <%--Begin Item--%>
                        <li class="movie-item"><a class="movie-link" href="javascript:;" onclick="hienthilichchieu(1)">
                            <div class="movie-body">
                                <div class="title-movie text-uppercase">
                                    Lê Gia Bảo Hân
                                </div>
                            </div>
                        </a></li>
                        <%--End Item--%>
                        
                    </ul>
                    <%--End Danh sách bên dưới--%>

                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Giờ chiếu</h4>
                    </div>
                    
                    <%--Danh sách bên dưới--%>
                    <ul class="list-group" id="showlichchieu">
                        <%--Begin Item--%>
                        <li class="movie-item">Chủ nhật, 21/06/2020<br/><br/>
                            <a class="giochieu" href="#">08:30</a>
                            <a class="giochieu" href="#">09:50</a>
                            <a class="giochieu" href="#">17:30</a>
                        </li>
                        <%--End Item--%>

                        <%--Begin Item--%>
                        <li class="movie-item">Thứ hai, 22/06/2020<br/><br/>
                            <a class="giochieu" href="#">08:30</a>
                            <a class="giochieu" href="#">09:50</a>
                            <a class="giochieu" href="#">17:30</a>
                        </li>
                        <%--End Item--%>

                        <%--Begin Item--%>
                        <li class="movie-item">Thứ ba, 23/06/2020<br/><br/>
                            <a class="giochieu" href="#">08:30</a>
                            <a class="giochieu" href="#">09:50</a>
                            <a class="giochieu" href="#">17:30</a>
                        </li>
                        <%--End Item--%>
                        
                    </ul>
                    <%--End Danh sách bên dưới--%>

                </div>
            </div>
        </div>
    </div>
    <script>
        function hienthirapphim(idphim) {
            
            document.getElementById("showrapphim").innerHTML = "<li class=\"movie-item\"><a class=\"movie-link\" href=\"#\" href=\"javascript:;\" onclick=\"hienthilichchieu(1)\"><div class=\"movie-body\"><div class=\"title-movie text-uppercase\">" + idphim + "</div></div></a></li>";
            document.getElementById("showrapphim").innerHTML += "<li class=\"movie-item\"><a class=\"movie-link\" href=\"#\" href=\"javascript:;\" onclick=\"hienthilichchieu(1)\"><div class=\"movie-body\"><div class=\"title-movie text-uppercase\">" + idphim + "</div></div></a></li>";
            document.getElementById("showlichchieu").innerHTML = "";
        };
        function hienthilichchieu(idphim) {

            document.getElementById("showlichchieu").innerHTML = "<li class=\"movie-item\">Chủ nhật, 21/06/2020<br/><br/><a class=\"giochieu\" href=\"javascript:;\" onclick=\"chonxuatchieuvadatve(1)\">08:30</a> <a class=\"giochieu\" href=\"javascript:;\" onclick=\"chonxuatchieuvadatve(1)\">09:50</a> <a class=\"giochieu\" href=\"javascript:;\" onclick=\"chonxuatchieuvadatve(1)\">17:30</a></li>";
            document.getElementById("showlichchieu").innerHTML += "<li class=\"movie-item\">Chủ nhật, 21/06/2020<br/><br/><a class=\"giochieu\" href=\"javascript:;\" onclick=\"chonxuatchieuvadatve(1)\">08:30</a> <a class=\"giochieu\" href=\"javascript:;\" onclick=\"chonxuatchieuvadatve(1)\">09:50</a> <a class=\"giochieu\" href=\"javascript:;\" onclick=\"chonxuatchieuvadatve(1)\">17:30</a></li>";

        };
        function chonxuatchieuvadatve(id) {
            document.getElementById("btndangnhap").click();
        }
    </script>

    <style>
        .panel-heading {
            border-radius: 0;
            color: #ffffff;
            background-color: #f26b38;
            border-color: #f26b38;
            height: 40px;
            line-height: 20px;
            text-align: center;
        }

        .panel {
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid transparent;
            border-radius: 4px;
            -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }
        .movie-item {
            list-style-type: none;
        }
        .movie-body > img {
            width: 100px;
            float: left;
            margin-right: 10px;
        }
        .movie-item {
            border: 1px solid #c6c6c6;
            border-top: none;
            padding: 17px;
        }
        .giochieu {
            border: 1px solid #c6c6c6;
            padding: 4px;
            text-decoration: none !important;
        }
        .movie-link {
            text-decoration: none !important;
        }
    </style>
</asp:Content>
