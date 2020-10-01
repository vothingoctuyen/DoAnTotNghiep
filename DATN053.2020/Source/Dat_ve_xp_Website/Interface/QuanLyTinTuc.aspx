<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyTinTuc.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.QuanLyTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <br />
        <h1 class="text-center">QUẢN LÝ TIN TỨC</h1>
        <hr />
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#btnthemtintuc">THÊM TIN TỨC MỚI</button>
        <br />
        <br />
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tên bài viết</th>
                    <th scope="col">Tác giả</th>
                    <th scope="col">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <% string sql = "select NewID, MEMBER.Surname, NEWS.Title, NEWS.ContentNew from NEWS, MEMBER where NEWS.USERID = MEMBER.USERID";
                    Dat_ve_xp_Website.ThuVien tv = new Dat_ve_xp_Website.ThuVien();
                    System.Data.DataTable tb = new System.Data.DataTable();
                    tb = tv.Dulieu(sql);
                    int dem = 1;
                    foreach (System.Data.DataRow dr in tb.Rows)
                    {
                        if (dr[2].ToString().Trim().Length != 0)
                        {                     %>
                <%--Begin tin tức--%>
                <tr class="<% if (dem % 2 == 0) Response.Write("table-active"); else Response.Write("table"); %>"">
                    <th scope="row"><% Response.Write(dem.ToString()); %></th>
                    <td><% Response.Write(HttpUtility.UrlDecode(dr[2].ToString())); %></td>
                    <td><% Response.Write(dr[1].ToString()); %></td>
                    <td><button type="button" class="btn btn-dark" onclick=<% Response.Write("xoatintuc('" + dr[0].ToString().Trim() + "')"); %>>Xóa</button> <button type="button" class="btn btn-info" data-toggle="modal" data-target="#btnsuabaiviet" onclick=<% Response.Write("suatintuc('" + dr[0].ToString().Trim() + "')"); %>>Sửa</button></td>
                </tr>
                <%--End Tin tức--%>
                <% dem++;
        }
    } %>
            </tbody>
        </table>
    </div>


    <%--Begin đây là mục popup--%>
    <!-- Thêm phim mới vào-->
    <div class="modal fade" id="btnthemtintuc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm tin tức mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="">
                        <label>Tên bài viết</label>
                        <input type="text" class="form-control" id="tenbaiviet" placeholder="" value="" required>
                    </div>
                    <br />
                    <label>Nội dung bài viết</label>
                    <textarea name="noidungbaiviet" id="noidungbaiviet"></textarea>
                    <script>CKEDITOR.replace('noidungbaiviet');</script>
                    <br />
                    <label>Hiển thị nội dung bài xem trước</label>
                    <p id="reviewtitle"></p>
                    <p id="reviewcontent"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" onclick="reviewbaiviet()">Xem trước</button>
                    <button type="button" class="btn btn-primary" onclick="btnthemvao()">Lưu</button>
                </div>
            </div>
        </div>
    </div>
    <%--End thêm phim mới vào--%>

    <!-- Sửa thông tin phim -->
    <div class="modal fade" id="btnsuabaiviet" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H1">Sửa thông tin tin tức</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="">
                        <label>ID bài viết <span id="idbaiviet"></span></label><br />
                        <label>Tên bài viết</label>
                        <input type="text" class="form-control" id="tenbaivietchinhsua" placeholder="" value="" required>
                    </div>
                    <br />
                    <label>Nội dung bài viết</label>
                    <textarea name="noidungbaivietchinhsua" id="noidungbaivietchinhsua"></textarea>
                    <script>CKEDITOR.replace('noidungbaivietchinhsua');</script>
                    <br />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-primary" onclick="luuchinhsua()">Lưu</button>
                </div>
            </div>
        </div>
    </div>
    <%--End sửa thông tin phim--%>
    <%--End Đây là mục popup--%>

    <%--Begin đây là phần code javascript--%>
    <script>
        function reviewbaiviet() {
            (async () => {
                var content = CKEDITOR.instances.noidungbaiviet.getData();
                document.getElementById("reviewcontent").innerHTML = content;
                var title = $('#tenbaiviet').val();
                document.getElementById('reviewtitle').innerHTML = title;
                //var userid = await getCookie('userid');
                //alert(userid);

                //var sql = "insert into NEW values ((select count(*)+1 from NEW), '" + userid + "', N'" + title + "', N'" + content + "')";
                //alert(sql);
            })()
            
        }
        function xoatintuc(idtintuc) {
            (async () => {
                var sql = "update NEWS set Title = N'' where NEWS.NewID = " + idtintuc;
                var ketqua;
                await insertdatabase(sql).then((r) => { ketqua = r; });
                if (ketqua == "true") {
                    alert("Xóa bài viết thành công!");
                    window.location.reload();
                }
                else
                    alert("Xóa không thành công.");
            

            })()
        }
        function btnthemvao() {
            (async () => {
                await reviewbaiviet();
                var content = document.getElementById("reviewcontent").innerHTML;//CKEDITOR.instances.noidungbaiviet.getData();
                var title = $('#tenbaiviet').val();
                var userid = await getCookie('userid');
                if (title.length < 10 || decodeURIComponent(title).length > 199 || content.length < 20 || decodeURIComponent(content).length > 3999) {
                    alert("Bài viết quá ngắn, hoặc giá dài cần Điều chỉnh mới lưu được!");
                } else {
                    var sql = "insert into NEWS values ((select count(*)+1 from NEWS), '" + userid.trim() + "', N'" + encodeURIComponent(title.trim()) + "', N'" + encodeURIComponent(content.trim()) + "')";
                    //var sql = "insert into NEW values ((select count(*)+1 from NEW), 'U99', N'Tiêu đề bài viết', N'Nội dung bài viết')";
                    //alert(sql);
                    var ketqua;
                    await insertdatabase(sql).then((r) => { ketqua = r; });
                    if (ketqua == "true") {
                        alert("Đã thêm bài viết mới thành công!");
                        window.location.reload();
                    }
                    else
                        alert("Thêm bài viết không thành công!, có thể do bài viết của bạn quá dài.");
                }
                
            })()
            
        }
        function submitaftersetdata() {
            this.updateElement();
        }
        function suatintuc(idtintuc) {
            (async () => {
                var sql = "select ContentNew from NEWS where NewID = " + idtintuc;
                var list_baivet = await getlistdata(sql);
                var list_baiviet_final = list_baivet.split(",");
                CKEDITOR.instances.noidungbaivietchinhsua.setData(decodeURIComponent(list_baiviet_final[0]));

                var sql = "select Title from NEWS where NewID = " + idtintuc;
                var list_baivet = await getlistdata(sql);
                var list_baiviet_final = list_baivet.split(",");
                $('#tenbaivietchinhsua').val(decodeURIComponent(list_baiviet_final[0]));

                $('#idbaiviet').val(idtintuc);
                document.getElementById('idbaiviet').innerHTML = idtintuc;
            })()
            
        }

        function luuchinhsua() {
            (async () => {
                var content = CKEDITOR.instances.noidungbaivietchinhsua.getData();
                var title = $('#tenbaivietchinhsua').val();
                var idbaiviet = document.getElementById('idbaiviet').innerText;
                    var sql = "update NEWS set Title = N'" + encodeURIComponent(title) + "', ContentNew = N'" + encodeURIComponent(content) + "' where NEWS.NewID = " + idbaiviet;
                    var ketqua;
                    await insertdatabase(sql).then((r) => { ketqua = r; });
                    if (ketqua == "true") {
                        alert("Đã chỉnh sửa bài viết mới thành công!");
                    }
                    else
                        alert("Chỉnh sửa bài viết không thành công!, có thể do bài viết của bạn quá dài.");
                

            })()
        }
    </script>
    <%--End đây là phần code javascript--%>
</asp:Content>
