<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyDanhSachPhim.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.QuanLyDanhSachPhim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br />
        <h1 class="text-center">QUẢN LÝ DANH SÁCH PHIM</h1>
        <hr />
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#btnthemphim">Thêm phim</button>
        <br />
        <br />

        <%
            int _tranghientai;
            int _rl;
            if (Request.QueryString["page"] != null && int.TryParse(Request.QueryString["page"].ToString(), out _rl) == true)
                _tranghientai = int.Parse(Request.QueryString["page"]);
            else
                _tranghientai = 1;

            int _soluongitem = 10;

            Dat_ve_xp_Website.ThuVien _tv = new Dat_ve_xp_Website.ThuVien();
            System.Data.DataTable _tb = new System.Data.DataTable();

            int _soluongrecord = int.Parse(_tv.Ham_ExecuteScalar("select count(*) from MOVIES"));
            int _soluongtrang = _soluongrecord / _soluongitem;
            if (_soluongrecord % _soluongitem > 0)
                _soluongtrang++;

            int _batdau = (_tranghientai - 1) * _soluongitem + 1;

            string sql_get_all_film = "SELECT Top "+_soluongitem.ToString()+" mo.RowNum, MOVIEID, TITLE FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY [MOVIEID]) AS RowNum FROM MOVIES) AS mo WHERE mo.RowNum >= " + _batdau.ToString();
            _tb = _tv.Dulieu(sql_get_all_film);
            %>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">Tên phim</th>
                    <th scope="col">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <% int dem = 1; foreach (System.Data.DataRow _dr in _tb.Rows)
                    { %>
                <tr class="<% if (dem % 2 == 0) Response.Write("table-active"); else Response.Write("table");%>">
                    <th scope="row"><% Response.Write(_dr[0]); %></th>
                    <td><% Response.Write(_dr[1]); %></td>
                    <td><% Response.Write(_dr[2]); %></td>
                    <td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#btnsuaphim" onclick=<% Response.Write("\"suaphim_quanlyphim('"+ _dr[1] + "')\""); %>>Sửa</button></td>
                </tr>
                <% dem++;
                    } %>

            </tbody>
        </table>
    

    <%--Begin phân trang--%>
    <nav aria-label="Page navigation example" class="text-center">
        <ul class="pagination">

            <li class="page-item">
                <a class="page-link" href="javascript:;" aria-label="Previous" onclick="chuyentrangquanlydanhsachphim('1')">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <% if(_tranghientai < _soluongtrang - 4)
                for (int i = _tranghientai; i < _tranghientai + 5; i++)
                { if(i <= _soluongtrang) %>
            <li class="page-item"><a class="page-link" href="javascript:;" onclick=<% Response.Write("chuyentrangquanlydanhsachphim('" + i + "')"); %>><% Response.Write(i); %></a></li>
            <% } %>

            <% if(_tranghientai >= _soluongtrang - 4)
                for (int i = _soluongtrang - 5; i <= _soluongtrang; i++)
                { if(i <= _soluongtrang) %>
            <li class="page-item"><a class="page-link" href="javascript:;" onclick=<% Response.Write("chuyentrangquanlydanhsachphim('" + i + "')"); %>><% Response.Write(i); %></a></li>
            <% } %>

            <li class="page-item">
                <a class="page-link" href="javascript:;" aria-label="Next" onclick=<% Response.Write("chuyentrangquanlydanhsachphim('" + _soluongtrang + "')"); %>>
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
    <%--End phân trang--%>
    </div>

    <%--Begin đây là mục popup--%>
    <!-- Thêm phim mới vào-->
    <div class="modal fade" id="btnthemphim" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm phim mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-label-group">
                        <label for="inputEmail">Tên phim</label>
                        <input type="email" id="txttenphimcanthem" name="txttenphimcanthem" class="form-control" placeholder="Nhập tên phim cần thêm" required autofocus />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng lại</button>
                    <button type="button" class="btn btn-primary" onclick="themphimmoi()">Thêm vào</button>
                </div>
            </div>
        </div>
    </div>
    <%--End thêm phim mới vào--%>

    <!-- Sửa thông tin phim -->
    <div class="modal fade" id="btnsuaphim" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H1">Sửa thông tin phim</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-label-group">
                        <label for="inputEmail">Tên phim có ID = <span id="idcuaphim"></span></label>
                        <input type="email" id="txt_ten_phim_can_sua" name="txt_ten_phim_can_sua" class="form-control" placeholder="Nhập tên phim cần thêm" required autofocus />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy thao tác này</button>
                    <button type="button" class="btn btn-primary" onclick="update_ten_phim()">Lưu chỉnh sửa</button>
                </div>
            </div>
        </div>
    </div>
    <%--End sửa thông tin phim--%>
    <%--End Đây là mục popup--%>

    <%--Begin đây là phần code javascript--%>
    <script>
        //Code nút xóa phim nào đó, nếu phim đó thêm vào mà chưa có ai đặt vé thì mới xóa được
        function xoaphim(idphim) {
            alert('Bạn có chắc chắn muốn xóa phim này? Có ID = ' + idphim);
        };
    </script>
    <%--End đây là phần code javascript--%>
</asp:Content>
