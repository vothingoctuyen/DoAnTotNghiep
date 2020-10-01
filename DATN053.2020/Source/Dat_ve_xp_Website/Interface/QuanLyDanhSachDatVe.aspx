<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyDanhSachDatVe.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.QuanLyDanhSachDatVe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">
        <br />
          <h1 class="text-center">Quản Lý Danh Sách Đặt Vé</h1>
        <br />
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
                        <div style="width: max-content; margin: auto;">
                            <button type="button" class="btn btn-primary" onclick="loadtrang()">Danh sách vé đã đặt</button>
                            <button type="button" class="btn btn-secondary" onclick="loadtrangvedahuy()">Danh sách vé đã hủy</button>

                            <script>
                                function loadtrang() {
                                    $(location).attr('href', '../Interface/QuanLyDanhSachDatVe.aspx');
                                }
                                function loadtrangvedahuy() {
                                    $(location).attr('href', '../Interface/QuanLyDanhSachDatVe.aspx?action=vedahuy');
                                }
                            </script>
                        </div><br/>
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
                                        <%--<th scope="col">Tình trạng vé</th>--%>
                                        <th scope="col">Người đặt vé</th>
                                        <% if (Request.QueryString["action"] != "vedahuy")
                                            { %>
                                        <th scope="col">Hủy vé</th>
                                        <% } %>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        Dat_ve_xp_Website.ThuVien tv = new Dat_ve_xp_Website.ThuVien();
                                        System.Data.DataTable tb_list_datve = new System.Data.DataTable();
                                        string lenh = "";
                                        string sql = "select DISTINCT(SEAT.SeatID), MOVIES.TITLE, MOVIETHEATER.MovieTheaterName, ROOM.RoomName, PROJECTION.Showday, PROJECTION.Hours, TICKETINGLISTONLINE.Price, Seat.Status, PROJECTION.ProjectionID, MEMBER.Surname, MEMBER.USERID from TICKETINGLISTONLINE, SEAT, MEMBER, PROJECTION, MOVIES, MOVIETHEATER, ROOM  where TICKETINGLISTONLINE.ProjectionID = Seat.ProjectionID and MEMBER.USERID = TICKETINGLISTONLINE.USERID and PROJECTION.ProjectionID = TICKETINGLISTONLINE.ProjectionID and MOVIES.MOVIEID = PROJECTION.MovieID  and MOVIETHEATER.MovieTheaterID = ROOM.MovieTheaterID and ROOM.RoomID = PROJECTION.RoomID order by Surname";
                                        if (Request.QueryString["action"] == "vedahuy")
                                        {
                                            lenh = Request.QueryString["action"];
                                            sql = "select  MOVIES.TITLE, MOVIETHEATER.MovieTheaterName, ROOM.RoomName, PROJECTION.Showday, PROJECTION.Hours, TICKETINGLISTONLINE.Price, [SEAT CANCEL].Status, PROJECTION.ProjectionID, MEMBER.Surname, MEMBER.USERID from TICKETINGLISTONLINE, [SEAT CANCEL], MEMBER, PROJECTION, MOVIES, MOVIETHEATER, ROOM  where TICKETINGLISTONLINE.ProjectionID = [SEAT CANCEL].ProjectionID and MEMBER.USERID = TICKETINGLISTONLINE.USERID and PROJECTION.ProjectionID = TICKETINGLISTONLINE.ProjectionID and MOVIES.MOVIEID = PROJECTION.MovieID  and MOVIETHEATER.MovieTheaterID = ROOM.MovieTheaterID and ROOM.RoomID = PROJECTION.RoomID order by Surname";
                                        }

                                        

                                        tb_list_datve = tv.Dulieu(sql);
                                        int dem = 1;

                                        if(lenh != "vedahuy")
                                        foreach (System.Data.DataRow rowve in tb_list_datve.Rows)
                                        { %>
                                    
                                    <%--Bắt đầu 1 dòng--%>
                                    <tr class="<% if (dem % 2 == 0) Response.Write("table-active"); else Response.Write("table"); %>"">
                                        <th scope="row"><% Response.Write(dem.ToString()); %></th>
                                        <td><% Response.Write(rowve[1].ToString()); %></td>
                                        <td><% Response.Write(rowve[2].ToString()); %></td>
                                        <td><% Response.Write(rowve[3].ToString()); %></td>
                                        <td><% Response.Write(System.Convert.ToDateTime(rowve[4].ToString()).ToString("dd/MM/yyyy")); %></td>
                                        <td><% Response.Write(rowve[5].ToString()); %></td>
                                        <td><% Response.Write(rowve[0].ToString()); %></td>
                                        <td><% Response.Write(rowve[6].ToString()); %></td>
                                        <%--<td><% //Response.Write(rowve[7].ToString()); %></td>--%>
                                        <td><% Response.Write(rowve[9].ToString()); %></td>
                                        <td><% if(rowve[7].ToString().Trim() == "Đã đặt") Response.Write("<button type=\"button\" class=\"btn btn-danger\" onclick=\"huyve('"+rowve[8].ToString().Trim()+"','"+rowve[0].ToString().Trim()+"','"+rowve[10].ToString().Trim()+"')\">Hủy vé</button>"); %></td>
                                    </tr>
                                    <%--Kết thúc 1 dòng--%>

                                    <% dem++;
                                        } %>

                                    <%
                                        else
                                    foreach (System.Data.DataRow rowve in tb_list_datve.Rows)
                                        { %>
                                    
                                    <%--Bắt đầu 1 dòng--%>
                                    <tr>
                                        <th scope="row"><% Response.Write(dem.ToString()); %></th>
                                        <td><% Response.Write(rowve[0].ToString()); %></td>
                                        <td><% Response.Write(rowve[1].ToString()); %></td>
                                        <td><% Response.Write(rowve[2]); %></td>
                                        <td><% Response.Write(System.Convert.ToDateTime(rowve[3].ToString()).ToString("dd/MM/yyyy")); %></td>
                                        <td><% Response.Write(rowve[4].ToString()); %></td>
                                        <td><% Response.Write(rowve[6].ToString().Split(',')[0]); %></td>
                                        <td><% Response.Write(rowve[5].ToString()); %></td>
                                        <%--<td><% //Response.Write(rowve[7].ToString()); %></td>--%>
                                        <td><% Response.Write(rowve[8].ToString()); %></td>
                                    </tr>
                                    <%--Kết thúc 1 dòng--%>

                                    <% dem++;
                                        } %>
                                </tbody>
                            </table>
                        </div>
                        <%--End tab2--%>
             
                
</asp:Content>
