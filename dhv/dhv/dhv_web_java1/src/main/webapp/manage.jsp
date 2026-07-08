<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.dhv.Course" %>
<html>
<head>
    <title>Quản lý Môn học</title>
    <style>table, th, td { border: 1px solid black; border-collapse: collapse; padding: 8px; }</style>
</head>
<body>
    <h1>Quản lý Môn học</h1>
    
    <!-- Form Thêm Môn Học -->
    <form action="CourseServlet" method="POST">
        <input type="hidden" name="action" value="add">
        <input type="text" name="name" placeholder="Tên môn học" required>
        <input type="text" name="description" placeholder="Mô tả">
        <button type="submit">Thêm môn học</button>
    </form>

    <br>
    <!-- Bảng danh sách -->
    <table>
        <tr>
            <th>ID</th> <th>Tên Môn</th> <th>Mô tả</th> <th>Thao tác</th>
        </tr>
        <% 
            List<Course> courses = (List<Course>) request.getAttribute("courseList");
            if(courses != null) {
                for(Course c : courses) { 
        %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getDescription() %></td>
            <td>
                <!-- Form Xóa -->
                <form action="CourseServlet" method="POST" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= c.getId() %>">
                    <button type="submit" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</button>
                </form>
            </td>
        </tr>
        <% 
                } 
            } 
        %>
    </table>
</body>
</html>