<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Tài Khoản</title>
    <style>
        /* Đặt lại font chữ và căn giữa toàn màn hình */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #9face6 100%); /* Màu nền giống trang đăng nhập */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Khung chứa Form */
        .register-card {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 380px;
            text-align: center;
            box-sizing: border-box;
        }

        .register-card h1 {
            margin-top: 0;
            color: #333333;
            font-size: 26px;
            margin-bottom: 25px;
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
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            border-color: #2ecc71; /* Viền màu xanh lá khi focus cho trang đăng ký */
            outline: none;
            box-shadow: 0 0 5px rgba(46, 204, 113, 0.3);
        }

        /* Nút Đăng Ký (Nút chính) */
        .btn-submit {
            width: 100%;
            padding: 14px;
            background-color: #2ecc71; /* Nút chính màu xanh lá để khác biệt nhẹ với đăng nhập */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background-color: #27ae60;
        }

        /* Đường kẻ ngang chia cách */
        .divider {
            margin: 25px 0;
            border: none;
            border-top: 1px solid #eeeeee;
        }

        /* Phần chuyển hướng sang Đăng nhập */
        .login-section p {
            color: #666666;
            font-size: 14px;
            margin-bottom: 12px;
        }

        /* Nút Đăng nhập (Nút phụ) */
        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: transparent;
            color: #3498db;
            border: 2px solid #3498db;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-login:hover {
            background-color: #3498db;
            color: white;
        }
    </style>
</head>
<body>
    <div class="register-card">
        <form action="RegisterServlet" method="POST">
            <h1>Đăng Ký Tài Khoản</h1>
            
            <!-- Các trường nhập liệu -->
            <div class="input-group">
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
            </div>
            
            <div class="input-group">
                <input type="email" name="email" placeholder="Email liên hệ" required>
            </div>
            
            <div class="input-group">
                <input type="password" name="password" placeholder="Mật khẩu" required>
            </div>
            
            <!-- Nút Đăng ký -->
            <button type="submit" class="btn-submit">Đăng Ký</button>
            
            <hr class="divider">
            
            <!-- Phần liên kết về trang Đăng nhập -->
            <div class="login-section">
                <p>Đã có tài khoản?</p>
                <!-- Bạn có thể sửa 'login.jsp' thành tên file trang đăng nhập của bạn -->
                <button type="button" class="btn-login" onclick="window.location.href='login.jsp'">Đăng nhập ngay</button>
            </div>
        </form>
    </div>
</body>
</html>