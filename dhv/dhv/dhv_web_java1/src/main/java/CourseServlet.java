package vn.edu.dhv;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {

    // Hàm lấy dữ liệu hiển thị ra bảng
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Course> courses = new ArrayList<>();
        try {
            Connection conn = DBUtil.getConnection();
            ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM courses");
            while (rs.next()) {
                courses.add(new Course(rs.getInt("id"), rs.getString("name"), rs.getString("description")));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("courseList", courses);
        request.getRequestDispatcher("manage.jsp").forward(request, response);
    }

    // Hàm xử lý Thêm, Sửa, Xóa và nhận request từ LoginServlet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        
        try {
            // Nếu có action (tức là đang bấm nút Thêm/Xóa), thì thực thi SQL
            if (action != null) {
                Connection conn = DBUtil.getConnection();
                if ("add".equals(action)) {
                    PreparedStatement ps = conn.prepareStatement("INSERT INTO courses (name, description) VALUES (?, ?)");
                    ps.setString(1, request.getParameter("name"));
                    ps.setString(2, request.getParameter("description"));
                    ps.executeUpdate();
                } else if ("delete".equals(action)) {
                    PreparedStatement ps = conn.prepareStatement("DELETE FROM courses WHERE id = ?");
                    ps.setInt(1, Integer.parseInt(request.getParameter("id")));
                    ps.executeUpdate();
                } else if ("edit".equals(action)) {
                    PreparedStatement ps = conn.prepareStatement("UPDATE courses SET name = ?, description = ? WHERE id = ?");
                    ps.setString(1, request.getParameter("name"));
                    ps.setString(2, request.getParameter("description"));
                    ps.setInt(3, Integer.parseInt(request.getParameter("id")));
                    ps.executeUpdate();
                }
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Cuối cùng, luôn gọi doGet để load lại danh sách môn học mới nhất
        doGet(request, response); 
    }
}