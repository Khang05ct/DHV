<%@ page contentType="text/html;charset=UTF-8" %>
<form action="RegisterServlet" method="POST">
    <h1>Đăng Ký Tài Khoản</h1>
    <input type="text" name="username" placeholder="Tên đăng nhập" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Mật khẩu" required>
    <button type="submit">Đăng Ký</button>
</form>