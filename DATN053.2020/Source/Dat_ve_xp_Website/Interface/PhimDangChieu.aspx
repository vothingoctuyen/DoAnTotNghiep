<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PhimDangChieu.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.PhimDangChieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin: auto; max-width: 1030px;">
        <% Response.Write("<hr><h1>Phim có lịch chiếu trong tháng: " +DateTime.Now.Month + "-" + DateTime.Now.Year + "</h1>"); %>
        <div class="row" >
            
                
                <% 
                    int namhientai = DateTime.Now.Year;
                    int thanghientai = DateTime.Now.Month;
                    
                    Dat_ve_xp_Website.Interface.PhimDangChieu pdc = new Dat_ve_xp_Website.Interface.PhimDangChieu();
                    int ngaycuoicung = pdc.GetLastDayOfMonth(thanghientai);

                    string _ngaydauthang = namhientai.ToString() + "-" + thanghientai.ToString() + "-01";
                    string _ngaycuoithang = namhientai.ToString() + "-" + thanghientai.ToString() + "-" + ngaycuoicung.ToString();

                    //Response.Write(_ngaycuoithang + " " + _ngaydauthang);
                    string sql_s = "select DISTINCT(MOVIES.MOVIEID), MOVIES.TITLE from PROJECTION, MOVIES where PROJECTION.MovieID = MOVIES.MOVIEID and Showday >= '"+_ngaydauthang+"' and Showday <= '"+_ngaycuoithang+"'";
                    //Response.Write(sql_s);

                    System.Data.DataTable tb_s = new System.Data.DataTable();
                    Dat_ve_xp_Website.ThuVien _tv = new Dat_ve_xp_Website.ThuVien();
                    tb_s = _tv.Dulieu(sql_s);
                    int dem = 0;
                    foreach(System.Data.DataRow _r in tb_s.Rows)
                    {%>
            <%--Begin kết quả--%>
            <div id="post-666" class=".col-1 .col-sm-2 .col-md-2 .col-lg-2 .col-xl-2">
                <div class="card" style="width: min-content;">
                    <a href="ThongTinPhim.aspx?lenh=thongtinphim&id=<% Response.Write(_r[0].ToString()); %>" style="color: #003791;">
                        <img width="183" height="268" src="../ThuatToan/image/1 (<%  Response.Write(dem + 1); %>).jpg" />
                        <div class="card-body">
                            <h5 class="card-title"><% Response.Write(_r[1].ToString());%></h5>
                        </div>
                    </a>
                </div>
            </div>
            <%--End kết quả--%>
                 <% ++dem;
                     }
                    %>
                </div>
		</div>

    <%--Kết thúc kết quả--%>
</asp:Content>
