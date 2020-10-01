function $_GET(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}

async function check_username_exist(username) { // Hàm kiểm tra Username có tồn tại trong CSDL hay không, nếu tồn tại thì trả về true, ngược lại false
    var a = await $.ajax({
        url: "ajax.aspx",
        type: 'POST',
        data: {
            lenh: "kiemtrausernamecotontaihaykhong",
            sql: "select MEMBER.MemberLoginName from MEMBER where MEMBER.MemberLoginName = '" + username + "'"
        }
    }).then(r => { return r });
    return a;
}

async function checkuservapasstologin(username, password) { // Hàm kiểm tra username và password đó có trùng với CSDL hay không, nếu trùng thì cho đăng nhập
    var a = await $.ajax({
        url: "ajax.aspx",
        type: 'POST',
        data: {
            lenh: "kiemtrausernamecotontaihaykhong",
            sql: "select MEMBER.MemberLoginName from MEMBER where MEMBER.MemberLoginName = '" + username + "' and Password = '" + password + "'"
        }
    }).then(r => { return r.trim() });
    return a;
}

async function get1odulieutudb(sql) { // Hàm lấy 1 ô dữ liệu từ db
    var a = await $.ajax({
        url: "ajax.aspx",
        type: 'POST',
        data: {
            lenh: "get1odulieu",
            sql: sql
        }
    }).then(r => { return r.trim() });
    return a;
}

async function getlistdata(sql) {//Lấy danh sách các ô dữ liệu cách nhau bởi dấu phẩy
    var a = await $.ajax({
        url: "ajax.aspx",
        type: 'POST',
        data: {
            lenh: "getlistdata",
            sql: sql
        }
    }).then(r => { return r.trim() });
    return a;
}

async function insertdatabase(sql) { // Hàm thêm dữ liệu vào CSDL với input là SQL, dùng cho mọi lúc
    var a = await $.ajax({
        url: "ajax.aspx",
        type: 'POST',
        data: {
            lenh: "Execute",
            sql: sql
        }
    }).then(r => { return r });
    return a;
}

async function luucookie(namecookie, valuecookie) { // Hàm lưu cookie cho namecookie & valuecookie
    var a = await $.ajax({
        url: "ajax.aspx",
        type: 'POST',
        data: {
            lenh: "luucookie",
            namecookie: namecookie,
            valuecookie: valuecookie
        }
    }).then(r => { return r });
    return "true";
}
//Hàm kiểm tra đăng nhập hợp lệ
function kiemtradangnhaphople() {
    if (document.getElementById("usernameemaildangnhap").value.length < 1)
        return "Vui lòng nhập đúng Username hoặc Email";
    else if (document.getElementById("matkhaudangnhap").value.length < 1)
        return "Bổ xung mật khẩu";
    else {
        return true;
        //Trong này giải quyết kiểm tra coi đúng ko, nếu đúng thì cho đăng nhập
    }

}
//async function laycookie(namecookie) { // Hàm lấy giá trị của Cookie tương ứng
//    var a = await $.ajax({
//        url: "ajax.aspx",
//        type: 'POST',
//        data: {
//            lenh: "laycookie",
//            namecookie: namecookie
//        }
//    }).then(r => { return r });
//    return a;
//}
//Hàm kiểm tra dữ liệu nhập vào khung đăng ký đã chuẩn chưa
function hamkiemtradulieudangky() {
    if (document.getElementById("hocuaban").value.trim().length < 1)
        return "Vui lòng nhập HỌ của bạn!";
    else if (document.getElementById("tencuaban").value.trim().length < 1)
        return "Vui lòng nhập TÊN của bạn!";
    else if (document.getElementById("username").value.trim().length < 1)
        return "Bổ sung User Name!";
    else if (document.getElementById("diachiemail").value.trim().length < 1 || !hamkiemtraemail(document.getElementById("diachiemail").value.trim()))
        return "Nhập địa chỉ Email hợp lệ khác!";
    else if (document.getElementById("sodienthoai").value.trim().length < 10 || document.getElementById("sodienthoai").value.trim().length > 11 || document.getElementById("sodienthoai").value.trim() % 1 != 0)
        return "Vui lòng nhập đúng số điện thoại";
    else if (document.getElementById("ngaysinh").value.length < 1)
        return "Chọn ngày sinh!";
    else if (document.getElementById("gioitinh").selectedIndex < 1)
        return "Chưa chọn giới tính!";
    else if (document.getElementById("matkhau").value.length < 1 || document.getElementById("nhaplaimatkhau").value.length < 1 || document.getElementById("matkhau").value != document.getElementById("nhaplaimatkhau").value)
        return "Trường mật khẩu trống hoặc không trùng nhau!";
    else if (document.getElementById("diachi").value.length < 5)
        return "Nhập địa chỉ đầy đủ!";
    else
        return true;
}

//Hàm kiểm tra tính hợp lệ của Email
function hamkiemtraemail(email) {

    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email))
        return false;
    return true;
}

//Hàm lấy giá trị của cookie
function getCookie(name) {
    var nameEQ = name + "=";
    //alert(document.cookie);
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ')
            c = c.substring(1);
        if (c.indexOf(nameEQ) != -1)
            return c.substring(nameEQ.length, c.length);
    }
    return null;
}

async function xoacookie(cookiename) {
    var a = await $.ajax({
        url: "ajax.aspx",
        type: 'POST',
        data: {
            lenh: "xoacookie",
            cookiename: cookiename
        }
    }).then(r => { return r });
}

async function kiemtratrunguser(username) {
    var a = await $.ajax({
        url: "ajax.aspx",
        type: 'POST',
        data: {
            lenh: "ExecuteScalar",
            sql: "select MEMBER.MemberLoginName from MEMBER where MEMBER.MemberLoginName = '" + username + "'"
        }
    })
    a.then(r => { alert(r) });
}
//Hàm ajax xem username có tồn tại hay không
async function getusername(username) {
    $.ajax({
        url: "ajax.aspx",
        type: 'POST',
        data: {
            lenh: "ExecuteScalar",
            sql: "select MEMBER.MemberLoginName from MEMBER where MEMBER.MemberLoginName = '" + "LinhLinh" + "'"
        }
    }).then((ketqua) => {return ketqua; });
    
}
function insertthanhvienmoi() {
        $.ajax({
            url: "ajax.aspx",
            type: 'POST',
            data: {
                lenh: "Execute",
                sql: "insert into MEMBER values('LeThanhGiang',N'Lê Thanh Giảng','1997-05-05',N'HCM', '0945879884',N'Nam',N'zdxfngzd')"
            }
        }).done(function (ketqua) {
            if (ketqua.trim() == "true")
                document.getElementById("bientam").innerHTML = "true";
            else
                document.getElementById("bientam").innerHTML = "false";
        });

        if (document.getElementById("bientam").innerText.trim() == "true")
            return true;
        else return false;
}

function getDaysOfMonth(year, month) {
    return new Date(year, month + 1, 0).getDate();
}