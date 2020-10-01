<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.DangKy" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <br />
    
    <div class="container">
        <div class="col-md-8 order-md-1 khungdangnhapdangky">
            <h2 class="mb-3 text-center">Đăng ký thành viên</h2>
            <form class="needs-validation" novalidate runat="server">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">Họ của bạn</label>
                        <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Vui lòng nhập họ của bạn!
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Tên của bạn</label>
                        <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Vui lòng nhập tên của bạn
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="username">Username - Dùng để đăng nhập</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="text" class="form-control" id="username" placeholder="Username" required>
                        <div class="invalid-feedback" style="width: 100%;">
                            Vui lòng nhập tên người dùng.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email">Email <span class="text-muted"></span></label>
                    <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
                    <div class="invalid-feedback">
                        Xin hãy nhập đúng địa chỉ Email
                    </div>
                </div>
                <div class="mb-3">
                    <label for="tel">Số điện thoại <span class="text-muted"></span></label>
                    <input type="tel" class="form-control" id="email1" placeholder="0945XXXXXX" required/>
                    <div class="invalid-feedback">
                        Xin hãy nhập đúng số điện thoại
                    </div>
                </div>
                <div class="mb-3">
                    <label for="dateofbirth">Ngày sinh <span class="text-muted"></span></label>
                    <input type="date" class="form-control" id="Tel1" placeholder="00/00/0000" required/>
                    <div class="invalid-feedback">
                        Xin hãy chọn đúng ngày sinh
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlSelect1">Giới tính</label>
                    <select class="form-control" id="exampleFormControlSelect1">
                        <option>Chọn giới tính</option>
                        <option>Nam</option>
                        <option>Nữ</option>
                    </select>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">Mật khẩu</label>
                        <input type="password" class="form-control" id="Text1" placeholder="" value="" required/>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Xác nhận mật khẩu</label>
                        <input type="password" class="form-control" id="Text2" placeholder="" value="" required/>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="address">Địa chỉ</label>
                    <input type="text" class="form-control" id="address" placeholder="Nhập địa chỉ mà bạn đang ở" required>
                    <div class="invalid-feedback">
                        Nhập địa chỉ mà bạn đang ở
                    </div>
                </div>
                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Đăng ký</button>
            </form>
        </div>
    </div>

</asp:Content>

