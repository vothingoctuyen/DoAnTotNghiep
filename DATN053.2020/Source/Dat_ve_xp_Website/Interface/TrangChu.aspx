<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="Dat_ve_xp_Website.Interface.TrangChu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../ThuatToan/css/style.css" class="css"/>
   <!--List kết quả -->
	<div class="container" style="margin: auto; max-width: 1030px;">
        <div class="row" >
               
                <%--Danh sách kết quả--%>
                <% Dat_ve_xp_Website.ThuatToan.ThuVienKetNoiThuatToan tv = new Dat_ve_xp_Website.ThuatToan.ThuVienKetNoiThuatToan(); %>
                <% //if (this.cayco == true && TextBox1.Text.ToString() != "")
                    try
                    {
                        //int ID = Int32.Parse(TextBox1.Text.Trim());
                        int ID;
                        HttpCookie b = Request.Cookies["userid"];
                        if (b!=null && b.Value.Substring(0, 1) == "U")
                            ID = 37;
                        else if (b != null)
                            ID = int.Parse(b.Value);
                        else
                            ID = 37;
                        int[] thoattoan = new int[50];
                        string namecookie = "ArrayMovie" + ID.ToString();
                        HttpCookie a = Request.Cookies[namecookie];
                        if (a == null)
                        {
                            string mang = MangThanhChuoi(this.ThuatToan(ID, 10, 101));
                            Response.Cookies[namecookie].Value = mang;
                            Response.Cookies[namecookie].Expires = DateTime.Now.AddDays(1);
                            thoattoan = MangChuoiThanhMangSo(Request.Cookies[namecookie].Value.Split(new char[] {','}));
                        }
                        else
                        {
                            thoattoan = MangChuoiThanhMangSo(Request.Cookies[namecookie].Value.Split(new char[] {','}));
                        }

                        //Begin lấy list title tương ứng lên
                        string sql_listmoview = "select ";
                        foreach (int it in thoattoan)
                        {
                            sql_listmoview += "(select TITLE from MOVIES where MOVIEID = " + it.ToString() +"),";
                        }
                        sql_listmoview = sql_listmoview.Substring(0,sql_listmoview.Length - 1);
                        System.Data.DataTable list_title = new System.Data.DataTable();
                        Dat_ve_xp_Website.ThuVien tvkn = new Dat_ve_xp_Website.ThuVien();
                        list_title = tvkn.Dulieu(sql_listmoview);
                        //End lấy list title

                        if (thoattoan != null)
                        {
                            //string[] listtitlemoview = this.getarraytitle(thoattoan);
                            for (int i = 0; i < 40; i++)
                            {
                                //Random _r = new Random();%>
            <%--Begin kết quả--%>
            <div id="post-666" class=".col-1 .col-sm-2 .col-md-2 .col-lg-2 .col-xl-2">
                <div class="card" style="width: min-content;">
                    <a href="ThongTinPhim.aspx?lenh=thongtinphim&id=<% Response.Write(thoattoan[i].ToString());  %>" style="color: #003791;">
                        <img width="183" height="268" src="../ThuatToan/image/1 (<%  Response.Write(i + 1);//Response.Write(_r.Next(1, 89).ToString()); %>).jpg" />
                        <div class="card-body">
                            <h5 class="card-title"><% Response.Write(list_title.Rows[0][i].ToString());%></h5>
                        </div>
                    </a>
                    <%--<p class="card-text"><small class="text-muted">Kết quả thứ <% Response.Write((i + 1).ToString()); %></small></p>--%>
                </div>
            </div>
            <%--End kết quả--%>
            <%}
                    }
                }
                catch (Exception e) { }
            %>
        </div>
    </div>

    <%--Kết thúc kết quả--%>
</asp:Content>

