package vn.edu.dhv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String user = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String pass = request.getParameter("password").trim();
        
        // Băm mật khẩu
        String hashedPass = HashUtil.hashPassword(pass);
        
        try {
            // Gọi công cụ kết nối SQLite
            Connection conn = DBUtil.getConnection();
            String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, email);
            ps.setString(3, hashedPass);
            
            // Thực thi lưu vào database
            ps.executeUpdate();
            conn.close();
            
            // Nếu lưu thành công, chuyển hướng về trang Đăng nhập
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        } catch (Exception e) {
            // In lỗi ra Terminal để Dev xem
            e.printStackTrace();
            
            // In thông báo lỗi thẳng lên màn hình Web cho người dùng xem
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<div style='text-align:center; margin-top: 50px;'>");
            response.getWriter().println("<h2 style='color:red;'>Đăng ký thất bại!</h2>");
            response.getWriter().println("<p>Lỗi: Tên đăng nhập này có thể đã tồn tại, hoặc hệ thống chưa nhận diện được Database.</p>");
            response.getWriter().println("<p>Chi tiết lỗi hệ thống: " + e.getMessage() + "</p>");
            response.getWriter().println("<br><button onclick=\"window.location.href='dangky.jsp'\">Quay lại trang Đăng ký</button>");
            response.getWriter().println("</div>");
        }
    }
}