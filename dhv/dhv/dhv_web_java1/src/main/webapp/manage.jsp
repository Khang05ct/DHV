<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.dhv.Course" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Môn học</title>
    <style>
        /* Tổng thể trang web */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #004e92 0%, #e52d27 100%);
            min-height: 100vh;
            margin: 0;
            padding: 40px 20px;
            box-sizing: border-box;
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Cho thẻ nằm trên cùng dội xuống */
        }

        /* Khung chứa nội dung chính */
        .container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 900px; /* Độ rộng bảng */
        }

        /* Tiêu đề */
        h1 {
            color: #004e92;
            text-align: center;
            text-transform: uppercase;
            margin-top: 0;
            margin-bottom: 30px;
            font-weight: 800;
        }

        /* Form Thêm Môn Học (Thiết kế nằm ngang) */
        .add-form {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #eeeeee;
        }

        .add-form input {
            padding: 12px;
            border: 1px solid #cccccc;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s;
        }

        .add-form input[name="name"] {
            flex: 1; /* Ô tên môn học chiếm 1 phần */
        }

        .add-form input[name="description"] {
            flex: 2; /* Ô mô tả chiếm 2 phần cho rộng */
        }

        .add-form input:focus {
            border-color: #004e92;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 78, 146, 0.3);
        }

        /* Nút Thêm màu Xanh */
        .btn-add {
            background-color: #004e92;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
            white-space: nowrap;
        }

        .btn-add:hover {
            background-color: #003666;
        }

        /* Thiết kế Bảng dữ liệu */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            border-radius: 8px;
            overflow: hidden; /* Để bo góc được phần thead */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eeeeee;
        }

        th {
            background-color: #004e92; /* Tiêu đề bảng màu Xanh */
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 0.5px;
        }

        /* Hiệu ứng sọc dưa cho các hàng và hover */
        tr:nth-child(even) { background-color: #fcfcfc; }
        tr:hover { background-color: #f1f5f9; }

        /* Nút Xóa màu Đỏ */
        .btn-delete {
            background-color: #e52d27;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.1s;
        }

        .btn-delete:hover {
            background-color: #b3241f;
        }
        
        .btn-delete:active {
            transform: scale(0.95);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Quản lý Môn học</h1>
        
        <form action="CourseServlet" method="POST" class="add-form">
            <input type="hidden" name="action" value="add">
            <input type="text" name="name" placeholder="Tên môn học" required>
            <input type="text" name="description" placeholder="Mô tả chi tiết">
            <button type="submit" class="btn-add">Thêm môn học</button>
        </form>

        <table>
            <thead>
                <tr>
                    <th style="width: 50px;">ID</th> 
                    <th style="width: 250px;">Tên Môn</th> 
                    <th>Mô tả</th> 
                    <th style="width: 100px; text-align: center;">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Course> courses = (List<Course>) request.getAttribute("courseList");
                    if(courses != null && !courses.isEmpty()) {
                        for(Course c : courses) { 
                %>
                <tr>
                    <td><b><%= c.getId() %></b></td>
                    <td><%= c.getName() %></td>
                    <td><%= c.getDescription() %></td>
                    <td style="text-align: center;">
                        <form action="CourseServlet" method="POST" style="margin: 0;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= c.getId() %>">
                            <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa môn học này không?')">Xóa</button>
                        </form>
                    </td>
                </tr>
                <% 
                        } 
                    } else {
                %>
                <tr>
                    <td colspan="4" style="text-align: center; padding: 30px; color: #888;">
                        Hiện tại chưa có môn học nào trong hệ thống.
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>