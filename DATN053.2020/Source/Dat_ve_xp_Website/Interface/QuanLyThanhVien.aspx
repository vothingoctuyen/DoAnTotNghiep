<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyThanhVien.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.QuanLyThanhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">
        <br />
        <h1 class="text-center">QUẢN LÝ THÀNH VIÊN</h1>
        <hr />
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Họ và tên</th>
                    <th scope="col">Ngày sinh</th>
                    <th scope="col">Địa chỉ</th> 
                    <th scope="col">Số điện thoại</th>
                    <th scope="col">Giới tính</th>
                    <th scope="col">Email</th>
                    <th scope="col">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <% string sql = "select MemberLoginName, Surname, DateOfBirth, Address, PhoneNumber, Gender, Email from MEMBER";
                    Dat_ve_xp_Website.ThuVien tv = new Dat_ve_xp_Website.ThuVien();
                    System.Data.DataTable tb = new System.Data.DataTable();
                    tb = tv.Dulieu(sql);
                    int dem = 1;
                    foreach (System.Data.DataRow dr in tb.Rows)
                    {
                    %>
                <%--Begin 1 dòng người dùng--%> 
                <tr <% if (dem % 2 == 0) Response.Write("class=\"table-active\""); %>>
                    <th scope="row"><% Response.Write(dem.ToString()); %></th>
                    <td id='<% Response.Write("tendaydu" + dem.ToString() + ""); %>'><% Response.Write(dr[1].ToString().Trim()); %></td>
                    
                    <td id='<% Response.Write("ngaysinh" + dem.ToString() + ""); %>'><% Response.Write(System.Convert.ToDateTime(dr[2].ToString().Trim()).ToString("dd/MM/yyyy")); %></td>
                    
                    <td id='<% Response.Write("diachi" + dem.ToString() + ""); %>'><% Response.Write(dr[3].ToString().Trim()); %></td>
                    
                    <td id='<% Response.Write("sdt" + dem.ToString() + ""); %>'><% Response.Write(dr[4].ToString().Trim()); %></td>
                    
                    <td id='<% Response.Write("gioitinh" + dem.ToString() + ""); %>'><% Response.Write(dr[5].ToString().Trim()); %></td>
                    
                    <td id='<% Response.Write("email" + dem.ToString() + ""); %>'><% Response.Write(dr[6].ToString().Trim()); %></td>
                    
                    <td><button type="button" class="btn btn-dark" onclick=<% Response.Write("xoathanhvien('" + dr[0].ToString().Trim() + "','"+dem.ToString()+"')"); %>>Xóa</button> <button type="button" class="btn btn-info" data-toggle="modal" data-target="#btnxuathanhvien" onclick=<% Response.Write("suathanhvien('" + dr[0].ToString().Trim() + "','"+dem.ToString()+"')"); %>>Sửa</button></td>
                </tr>
                <%--End 1 dòng người dùng--%>
                <% dem++; } %>
            </tbody>
        </table>
    </div>

    <%--Begin đây là mục popup--%>

    <!-- Sửa thông tin phim -->
    <div class="modal fade" id="btnxuathanhvien" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H1">Sửa thông tin thành viên</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="popupluuthongtinthanhvien">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    
                        <div class="mb-3">
                            <label for="firstName">Họ và tên</label>
                            <input type="text" class="form-control" id="hovatenthongtinthanhvien" placeholder="" value="" required />
                        </div>
                   

                    <div class="mb-3">
                        <label for="username">Username - Dùng để đăng nhập</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">@</span>
                            </div>
                            <input type="text" class="form-control" id="usernamethongtinthanhvien" placeholder="" value="" required disabled />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email">Email <span class="text-muted"></span></label>
                        <input type="email" class="form-control" id="diachiemailthongtinthanhvien" placeholder="Tuyen@example.com" required />
                        <div class="invalid-feedback">
                            Xin hãy nhập đúng địa chỉ Email
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="tel">Số điện thoại <span class="text-muted"></span></label>
                        <input type="tel" class="form-control" id="sodienthoaithongtinthanhvien" placeholder="0945XXXXXX" required />
                        <div class="invalid-feedback">
                            Xin hãy nhập đúng số điện thoại
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="dateofbirth">Ngày sinh <span class="text-muted"></span></label>
                        <input type="date" class="form-control" id="ngaysinhthongtinthanhvien" placeholder="00/00/0000" required />
                        <div class="invalid-feedback">
                            Xin hãy chọn đúng ngày sinh
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Giới tính</label>
                        <select class="form-control" id="gioitinhthongtinthanhvien">
                            <option>Chọn giới tính</option>
                            <option>Nam</option>
                            <option>Nữ</option>
                        </select>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">Mật khẩu</label>
                            <input type="password" class="form-control" id="matkhauthongtinthanhvien" placeholder="" value="" required />
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Xác nhận mật khẩu</label>
                            <input type="password" class="form-control" id="nhaplaimatkhauthongtinthanhvien" placeholder="" value="" required />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address">Địa chỉ</label>
                        <input type="text" class="form-control" id="diachithongtinthanhvien" placeholder="Nhập địa chỉ mà bạn đang ở" required>
                        <div class="invalid-feedback">
                            Nhập địa chỉ mà bạn đang ở
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy thao tác này</button>
                    <button type="button" class="btn btn-primary" onclick="luuthongtinthanhvien()">Lưu chỉnh sửa</button>
                </div>
            </div>
        </div>
    </div>
    
    <%--End sửa thông tin phim--%>
    <%--End Đây là mục popup--%>

    <%--Begin đây là phần code javascript--%>
    <script>
        //Code nút xóa thành viên nào đó, nếu xóa được thì xóa chứ ko phải ai cũng xóa được
        function xoathanhvien(idthanhvien, sttthanhvien) {
            (async () => {
            var sql = "delete MEMBER where MemberLoginName = '" + idthanhvien + "'";
            var ketqua;
            await insertdatabase(sql).then((r) => { ketqua = r; });
            if (ketqua == "true") {
                alert("Đã xóa thành viên thành công!");
                window.location.reload();
            }
            else
                alert("Xóa thành viên không thành công!");
            })()
        };
        function suathanhvien(idthanhvien, sttthanhvien) {
            (async () => {
                var ten = "tendaydu" + sttthanhvien;
                var ngaysinh = "ngaysinh" + sttthanhvien;
                var diachi = "diachi" + sttthanhvien;
                var sdt = "sdt" + sttthanhvien;
                var gioitinh = "gioitinh" + sttthanhvien;
                var email ="email" + sttthanhvien;
                $('#usernamethongtinthanhvien').val(idthanhvien);
                //alert(document.getElementById(ten).innerHTML);
                $('#hovatenthongtinthanhvien').val(document.getElementById(ten).innerHTML);
                $('#diachiemailthongtinthanhvien').val(document.getElementById(email).innerHTML);
                $('#sodienthoaithongtinthanhvien').val(document.getElementById(sdt).innerHTML);
                $('#gioitinhthongtinthanhvien').val(document.getElementById(gioitinh).innerHTML);
                $('#diachithongtinthanhvien').val(document.getElementById(diachi).innerHTML);
                $('#ngaysinhthongtinthanhvien').val(document.getElementById(ngaysinh).innerHTML);
                ngaysinh = document.getElementById(ngaysinh).innerHTML.split("/");
                document.getElementById('ngaysinhthongtinthanhvien').value = new Date(ngaysinh[2], new Number(ngaysinh[1]) - 1, new Number(ngaysinh[0]) + 1).toISOString().substring(0, 10);//new Date(ngaysinh[2], ngaysinh[1], ngaysinh[0] + 1);
            })()
            
        }

        function luuthongtinthanhvien() {
            (async () => {
                var matkhau = document.getElementById('matkhauthongtinthanhvien').value;
                var laplaimatkhau = document.getElementById('nhaplaimatkhauthongtinthanhvien').value;
                if (matkhau != "" || laplaimatkhau != "") {
                    if (matkhau != laplaimatkhau)
                        alert("Mật khẩu không khớp");
                }
                if ((matkhau != "" && matkhau == laplaimatkhau) || (matkhau == "" && laplaimatkhau == "")) {

                    var hovaten = $('#hovatenthongtinthanhvien').val();
                    var diachiemail = $('#diachiemailthongtinthanhvien').val();
                    var sodienthoai = $('#sodienthoaithongtinthanhvien').val();
                    var ngaysinh = $('#ngaysinhthongtinthanhvien').val();
                    var gioitinh = document.getElementById("gioitinhthongtinthanhvien").selectedIndex;
                    if (gioitinh == 1)
                        gioitinh = "Nam";
                    else
                        gioitinh = "Nữ";
                    var diachi = $('#diachithongtinthanhvien').val();
                    var user = $('#usernamethongtinthanhvien').val();
                    var sql;
                    if (matkhau != "")
                        sql = "update MEMBER set Surname = N'" + hovaten + "', DateOfBirth = '" + ngaysinh + "', Address = N'" + diachi + "', PhoneNumber = '" + sodienthoai + "', Gender = N'" + gioitinh + "', Password = '" + matkhau + "', Email = '" + diachiemail + "' where MemberLoginName = '" + user + "'";
                    else
                        sql = "update MEMBER set Surname = N'" + hovaten + "', DateOfBirth = '" + ngaysinh + "', Address = N'" + diachi + "', PhoneNumber = '" + sodienthoai + "', Gender = N'" + gioitinh + "', Email = '" + diachiemail + "' where MemberLoginName = '" + user + "'";
                    //alert(sql);
                    var ketqua;
                    await insertdatabase(sql).then((r) => { ketqua = r; });
                    if (ketqua = "true") {
                        alert("Đã chỉnh sửa thành viên THÀNH CÔNG!");
                        document.getElementById('popupluuthongtinthanhvien').click();
                    }
                    else
                        alert("Lưu không thành công!");
                }
            })()
            
        }
    </script>

    <%--End đây là phần code javascript--%>
</asp:Content>
