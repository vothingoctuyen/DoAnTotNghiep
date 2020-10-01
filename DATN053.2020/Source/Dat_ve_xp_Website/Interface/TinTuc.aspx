<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TinTuc.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.TinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <br />
        <h1 class="text-center">Tin tức</h1>
        <hr />
        <% string sql = "select * from NEWS";
            System.Data.DataTable tb = new System.Data.DataTable();
            Dat_ve_xp_Website.ThuVien tv = new Dat_ve_xp_Website.ThuVien();
            tb = tv.Dulieu(sql);
            int dem = 1;
            foreach (System.Data.DataRow dr in tb.Rows)
            {
            %>
        <%--Begin mục tin tức--%>
        <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative" style="background-color: #fff;">
            <div class="col p-4 d-flex flex-column position-static">
                <h4 class="mb-0"><a href='<% Response.Write("../Interface/XemTinTuc.aspx?id=" + dr[0].ToString().Trim()); %>'><% Response.Write(HttpUtility.UrlDecode(dr[2].ToString())); %></a></h4>
                <%--<div class="mb-1 text-muted">Nov 12</div>--%>
                <p class="card-text mb-auto"><% Response.Write((HttpUtility.UrlDecode(dr[3].ToString())).Substring(0,180) + "..."); %></p>
            </div>
            <div class="col-auto d-none d-lg-block m-auto">
                <img class="imgofpost" src="../lib_phim_img/imagephim (<% Response.Write(dem); %>).jpg")" alt="Alternate Text" />
            </div>
        </div>
        <%--End mục tin tức--%>
        <% dem++; } %>
        

       
    </div>

    <style>
        .imgofpost {
            width: 250px;
        }
    </style>
</asp:Content>
