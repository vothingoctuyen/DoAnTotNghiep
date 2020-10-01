<%
    'Nhận diện lệnh cần chạy
    dim lenh
    lenh = Request.Form("lenh")
    if lenh = "dangnhap" then
        call dangnhap()
    end if
    'Kết thúc đoạn nhận diện lệnh cần chạy

    'Chạy lệnh đăng nhập
    public sub dangnhap()
        if 1 > 2 then
            dim fname
            'fname=Request.Form("name")
            'Response.Write("Tên phim mà bạn mới vừa bấm vào là: " & fname & ". ")
        else
            call Tong
            Response.Write("Đây là khi sao rồi! ")
        end if
    end sub
    public sub Tong
        Response.Write("Đã chạy phương thức tính tổng")
    End sub
%>
