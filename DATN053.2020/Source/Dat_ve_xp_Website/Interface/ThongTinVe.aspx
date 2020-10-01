<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ThongTinVe.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.ThongTinVe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br/>

        <% string sql = " select MovieTheaterName, MOVIETHEATER.Address, Surname, PhoneNumber from TICKETINGLISTONLINE, PROJECTION, ROOM, MOVIETHEATER, MEMBER where [VerificationID] = (select count(*) from TICKETINGLISTONLINE) and PROJECTION.ProjectionID = TICKETINGLISTONLINE.ProjectionID and ROOM.RoomID = PROJECTION.RoomID and MOVIETHEATER.MovieTheaterID = ROOM.MovieTheaterID and MEMBER.USERID = TICKETINGLISTONLINE.USERID";
            System.Data.DataTable tb = new System.Data.DataTable();
            Dat_ve_xp_Website.ThuVien tv = new Dat_ve_xp_Website.ThuVien();
            tb = tv.Dulieu(sql);

            foreach (System.Data.DataRow dr in tb.Rows)
            {

            %>

        <h1 class="text-center">Thông tin vé</h1>
            <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative m-auto" style="max-width: 565px;">
                <div class="col p-4 d-flex flex-column position-static" style="background-color: #fff;">
                    <p class="card-text mb-auto"></p>
                    <div class="row">
                        <div class="col"><strong>Phòng chiếu:</strong> <% Response.Write(Request.QueryString["phongchieu"]); %></div>
                        <div class="col"><strong>Số vé:</strong> <% Response.Write(Request.QueryString["sove"]); %></div>
                        <div class="col"><strong>Số ghế:</strong> <% Response.Write(Request.QueryString["soghe"]); %></div>
                    </div>
                   
                    <div class="row">
                        <div class="col"><strong class="text-muted">Suất chiếu<br/><font style="color:red"><% Response.Write(Request.QueryString["ngaychieu"] + "&nbsp;&nbsp;&nbsp;&nbsp;" + Request.QueryString["giochieu"]); %></font></strong></div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col"><strong class="text-muted">Vị trí rạp</strong><br/><font style="font-weight:bold"><% Response.Write(dr[0].ToString()); %></font><br/>TT<% Response.Write(dr[1].ToString()); %></div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col"><strong class="text-muted">Người đặt</strong><br/><font style="font-weight:bold"><% Response.Write(dr[2].ToString()); %></font></div>
                        <div class="col"><strong class="text-muted">Số điện thoại</strong><br/><font style="font-weight:bold"><% Response.Write(dr[3].ToString()); %></font></div>
                    </div>
                    <br />
                    <div class="row">
                        <hr />
                        <div class="col">
                                <strong>Chọn phương thức thanh toán</strong><br/><br/>  
                            <div class="input-group-text">
                                <input type="radio" name="chonphuongthucthanhtoan" aria-label="Radio button for following text input" checked="true">&nbsp;&nbsp; Chuyển khoản
                            </div>
                            <br />
                            <div class="input-group-text">
                                <input type="radio" name="chonphuongthucthanhtoan" aria-label="Radio button for following text input">&nbsp;&nbsp; Tiền mặt
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row m-auto" >
                        <img src="qr-code.jpg"  style="max-width: 169px;" />
                    </div>
                </div>
    </div><% } %>

        <%--<div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H1">Thông tin vé</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="popupluuthongtinthanhvien">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    
                        <div class="mb-3">
                            <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Tên Phim</span>
                            </div>
                            <input type="text" class="form-control" id="txttenphim" placeholder="" value="" required disabled />
                        </div>
                        </div>
                   

                    <div class="mb-3">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Rạp chiếu</span>
                            </div>
                            <input type="text" class="form-control" id="txtrapchieu" placeholder="" value="" required disabled />
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Ngày chiếu</span>
                            </div>
                            <input type="text" class="form-control" id="txtgaychieu" placeholder="" value="" required disabled />
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Phòng chiếu</span>
                            </div>
                            <input type="text" class="form-control" id="txtphongchieu" placeholder="" value="" required disabled />
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Giờ chiếu</span>
                            </div>
                            <input type="text" class="form-control" id="txtgiochieu" placeholder="" value="" required disabled />
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Số lượng vé</span>
                            </div>
                            <input type="text" class="form-control" id="txtsoluongve" placeholder="" value="" required disabled />
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Số ghế</span>
                            </div>
                            <input type="text" class="form-control" id="txtsoghe" placeholder="" value="" required disabled />
                        </div>
                    </div>
            </div>
        </div>--%>
    </div>
</asp:Content>
