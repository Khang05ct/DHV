<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập Hệ Thống</title>
    <style>
        /* Đặt lại font chữ và căn giữa toàn màn hình */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #9face6 100%); /* Màu nền gradient cực đẹp */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Khung chứa Form (Thẻ Card) */
        .login-card {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px; /* Bo góc */
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15); /* Đổ bóng 3D nhẹ */
            width: 100%;
            max-width: 380px;
            text-align: center;
            box-sizing: border-box;
        }

        .login-card h1 {
            margin-top: 0;
            color: #333333;
            font-size: 26px;
            margin-bottom: 20px;
        }

        /* Chữ hiển thị lỗi */
        .error-msg {
            color: #e74c3c;
            font-size: 14px;
            margin-bottom: 15px;
            min-height: 20px; /* Giữ khoảng trống ngay cả khi không có lỗi */
            font-style: italic;
        }

        /* Ô nhập liệu */
        .input-group {
            margin-bottom: 15px;
        }
        
        .input-group input {
            width: 100%;
            padding: 14px;
            border: 1px solid #cccccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 15px;
            transition: border-color 0.3s; /* Hiệu ứng mượt khi bấm vào */
        }

        /* Viền sáng lên khi bấm vào ô nhập liệu */
        .input-group input:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
        }

        /* Nút Đăng Nhập (Nút chính) */
        .btn-submit {
            width: 100%;
            padding: 14px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-submit:hover {
            background-color: #1d1bac;
        }

        /* Đường kẻ ngang chia cách */
        .divider {
            margin: 25px 0;
            border: none;
            border-top: 1px solid #eeeeee;
        }

        /* Phần Đăng Ký */
        .register-section p {
            color: #666666;
            font-size: 14px;
            margin-bottom: 12px;
        }

        /* Nút Đăng Ký (Nút phụ - Nền trong suốt) */
        .btn-register {
            width: 100%;
            padding: 12px;
            background-color: transparent;
            color: #3498db;
            border: 2px solid #4a82dc;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
        }

        /* Đảo ngược màu khi rê chuột vào nút Đăng ký */
        .btn-register:hover {
            background-color: #3498db;
            color: rgb(248, 246, 246);
        }
    </style>
</head>
<body>
    <div class="login-card">
        <form action="LoginServlet" method="POST">
            <h1>Đăng Nhập</h1>
            
            <!-- Hiển thị lỗi nếu đăng nhập sai -->
            <div class="error-msg">
                <%= request.getAttribute("loiDangNhap") != null ? request.getAttribute("loiDangNhap") : "" %>
            </div>
            
            <!-- Các trường nhập liệu -->
            <div class="input-group">
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
            </div>
            <div class="input-group">
                <input type="password" name="password" placeholder="Mật khẩu" required>
            </div>
            
            <!-- Nút Đăng nhập -->
            <button type="submit" class="btn-submit">Đăng Nhập</button>
            
            <hr class="divider">
            
            <!-- Phần liên kết sang trang Đăng ký -->
            <div class="register-section">
                <p>Bạn chưa có tài khoản?</p>
                <button type="button" class="btn-register" onclick="window.location.href='dangky.jsp'">Tạo tài khoản ngay</button>
            </div>
        </form>
    </div>
</body>
</html>