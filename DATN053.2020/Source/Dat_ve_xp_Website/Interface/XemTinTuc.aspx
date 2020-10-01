<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="XemTinTuc.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.XemTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <br />
        <% 
            string idbaiviet = Request.QueryString["id"];
            string sql = "select Title, ContentNew from NEWS Where NewID = " + idbaiviet;
            System.Data.DataTable tb = new System.Data.DataTable();

            Dat_ve_xp_Website.ThuVien tv = new Dat_ve_xp_Website.ThuVien();

            tb = tv.Dulieu(sql);
            foreach (System.Data.DataRow dr in tb.Rows)
            {
            %>
        <h3 class="text-left"><% Response.Write(HttpUtility.UrlDecode(dr[0].ToString())); %></h3>
        <hr />
        
        <%--Begin mục tin tức--%>
        <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col p-4 d-flex flex-column position-static">
                <p class="card-text mb-auto"><% Response.Write(HttpUtility.UrlDecode(dr[1].ToString())); %></p>
            </div>
        </div>
        <%--End mục tin tức--%>
        <%  } %>
        

    </div>
</asp:Content>
