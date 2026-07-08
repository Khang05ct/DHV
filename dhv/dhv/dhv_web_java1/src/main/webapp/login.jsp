<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Đăng Nhập Hệ Thống</title>
</head>
<body>
    <form action="LoginServlet" method="POST">
        <h1>Đăng Nhập Hệ Thống</h1>
        
        <!-- Hiển thị lỗi nếu đăng nhập sai -->
        <p style="color:red;">
            <%= request.getAttribute("loiDangNhap") != null ? request.getAttribute("loiDangNhap") : "" %>
        </p>
        
        <!-- Các trường nhập liệu -->
        <div>
            <input type="text" name="username" placeholder="Tên đăng nhập" required>
        </div>
        <br>
        <div>
            <input type="password" name="password" placeholder="Mật khẩu" required>
        </div>
        <br>
        
        <!-- Nút Đăng nhập -->
        <button type="submit">Đăng Nhập</button>
        
        <hr style="margin: 20px 0;">
        
        <!-- Phần liên kết sang trang Đăng ký -->
        <p>Bạn chưa có tài khoản?</p>
        <button type="button" onclick="window.location.href='dangky.jsp'">Đăng ký ngay</button>
        
        <!-- Hoặc nếu bạn thích dùng link chữ màu xanh bôi chân truyền thống thì dùng dòng dưới: -->
        <!-- <a href="dangky.jsp">Đăng ký tài khoản mới</a> -->
    </form>
</body>
</html>