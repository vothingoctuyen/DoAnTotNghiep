<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ThanhVien.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.ThanhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="modal-body" style="background-color: #fff;">

            <%--Begin đây là mục tab panel--%>
                    <style>
                        a[class="nav-link active"] {
                            color: #fff !important;
                            font-weight: bold !important;
                            background-color: #007bff !important;
                        }

                        ul.nav-tabs {
                            margin: 10px;
                        }
                    </style>
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#thanhvientab1">Thông tin thành viên</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#thanhvientab2">Lịch sử giao dịch</a>
                        </li>
                    </ul>
                    <%--End đây là mục tab panel--%>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        

                        <script>
                        </script>
                        <%--Begin tab1--%>
                        <div id="thanhvientab1" class="container tab-pane active" style="max-width: 550px;">
                            <div class="mb-3">
                                <label for="firstName">Họ và tên</label>
                                    <input type="text" class="form-control" id="tt_hovaten" placeholder="" value="" required>
                                    <div class="invalid-feedback">
                                        Vui lòng nhập họ của bạn!
                                    </div>
                                </div>
                            <div class="mb-3">
                                <label for="username">Username - Dùng để đăng nhập</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">@</span>
                                    </div>
                                    <input type="text" class="form-control" id="tt_username" placeholder="Username" disabled/>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="email">Email <span class="text-muted"></span></label>
                                <input type="email" class="form-control" id="tt_email" placeholder="Tuyen@example.com" required/>
                                <div class="invalid-feedback">
                                    Xin hãy nhập đúng địa chỉ Email
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="tel">Số điện thoại <span class="text-muted"></span></label>
                                <input type="tel" class="form-control" id="tt_sdt" placeholder="0945XXXXXX" required />
                                <div class="invalid-feedback">
                                    Xin hãy nhập đúng số điện thoại
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="dateofbirth">Ngày sinh <span class="text-muted"></span></label>
                                <input type="date" class="form-control" id="tt_ngaysinh" placeholder="00/00/0000" required />
                                <div class="invalid-feedback">
                                    Xin hãy chọn đúng ngày sinh
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Giới tính</label>
                                <select class="form-control" id="tt_gioitinh">
                                    <option>Chọn giới tính</option>
                                    <option>Nam</option>
                                    <option>Nữ</option>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="firstName">Mật khẩu</label>
                                    <input type="password" class="form-control" id="tt_matkhau1" placeholder="" value="" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Xác nhận mật khẩu</label>
                                    <input type="password" class="form-control" id="tt_matkhau2" placeholder="" value="" required />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="address">Địa chỉ</label>
                                <input type="text" class="form-control" id="tt_diachi" placeholder="Nhập địa chỉ mà bạn đang ở" required>
                                <div class="invalid-feedback">
                                    Nhập địa chỉ mà bạn đang ở
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button id="btn_luu" type="button" class="btn btn-primary"  style="font-weight:bold" onclick="update_thongtinthanhvien()">Lưu lại</button>
                            </div>
                        </div>
                        <%--End tab1--%>

                        <%--Begin tab2--%>
                        <div id="thanhvientab2" class="container tab-pane fade">
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tên phim</th>
                                        <th scope="col">Tên rạp chiếu</th>
                                        <th scope="col">Tên phòng</th>
                                        <th scope="col">Ngày chiếu</th>
                                        <th scope="col">Giờ chiếu</th>
                                        <th scope="col">Số ghế</th>
                                        <th scope="col">Giá vé</th>
                                        <th scope="col">Tình trạng vé</th>
                                        <th scope="col">Hủy vé</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        Dat_ve_xp_Website.ThuVien tv = new Dat_ve_xp_Website.ThuVien();
                                        System.Data.DataTable tb_list_datve = new System.Data.DataTable();
                                        string sql = "select DISTINCT(SEAT.SeatID), MOVIES.TITLE, MOVIETHEATER.MovieTheaterName, ROOM.RoomName, PROJECTION.Showday, PROJECTION.Hours, TICKETINGLISTONLINE.Price, Seat.Status, PROJECTION.ProjectionID, MEMBER.USERID from TICKETINGLISTONLINE, SEAT, MEMBER, PROJECTION, MOVIES, MOVIETHEATER, ROOM  where TICKETINGLISTONLINE.ProjectionID = Seat.ProjectionID and MEMBER.USERID = TICKETINGLISTONLINE.USERID and PROJECTION.ProjectionID = TICKETINGLISTONLINE.ProjectionID and MOVIES.MOVIEID = PROJECTION.MovieID  and MOVIETHEATER.MovieTheaterID = ROOM.MovieTheaterID and ROOM.RoomID = PROJECTION.RoomID  and MEMBER.MemberLoginName = '" +Request.Cookies["user"].Value + "'";
                                        
                                        tb_list_datve = tv.Dulieu(sql);
                                        int dem = 1;
                                        
                                        foreach (System.Data.DataRow rowve in tb_list_datve.Rows)
                                        { %>
                                    
                                    <%--Bắt đầu 1 dòng--%>
                                    <tr>
                                        <th scope="row"><% Response.Write(dem.ToString()); %></th>
                                        <td><% Response.Write(rowve[1].ToString()); %></td>
                                        <td><% Response.Write(rowve[2].ToString()); %></td>
                                        <td><% Response.Write(rowve[3].ToString()); %></td>
                                        <td><% Response.Write(System.Convert.ToDateTime(rowve[4].ToString()).ToString("dd/MM/yyyy")); %></td>
                                        <td><% Response.Write(rowve[5].ToString()); %></td>
                                        <td><% Response.Write(rowve[0].ToString()); %></td>
                                        <td><% Response.Write(rowve[6].ToString()); %></td>
                                        <td><% Response.Write(rowve[7].ToString()); %></td>
                                        <td><% if(rowve[7].ToString().Trim() == "Đã đặt") Response.Write("<button type=\"button\" class=\"btn btn-danger\" onclick=\"huyve('"+rowve[8].ToString().Trim()+"','"+rowve[0].ToString().Trim()+"','"+rowve[9].ToString().Trim()+"')\">Hủy vé</button>"); %></td>
                                    </tr>
                                    <%--Kết thúc 1 dòng--%>

                                    <% dem++;
                                        } %>
                                </tbody>
                            </table>
                        </div>
                        <%--End tab2--%>
                    </div>
                </div>
    </div>

    
</asp:Content>
