<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TimKiem.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.TimKiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div class="container" style="margin: auto; max-width: 1030px;">
        <% Response.Write("<hr><h1 style='text-align:center'>Tìm kiếm: "+Request.QueryString["s"]+"</h1><hr>"); %>
        <div class="row" >
               
                
                <% 
                    string tukhoa = Request.QueryString["s"];
                    string sql_s = "select top 40 MOVIES.MOVIEID, MOVIES.TITLE from MOVIES where TITLE like '%" + tukhoa + "%'";
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
