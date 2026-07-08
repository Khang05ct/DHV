package vn.edu.dhv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String inputUser = request.getParameter("username").trim();
        String inputPass = request.getParameter("password").trim();
        
        String hashedPass = HashUtil.hashPassword(inputPass);
        boolean isSuccess = false;
        
        try {
            Connection conn = DBUtil.getConnection();
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, inputUser);
            ps.setString(2, hashedPass);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                isSuccess = true;
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        if (isSuccess) {
            // SỬA Ở ĐÂY: Dùng Forward chuyển thẳng luồng sang CourseServlet để load dữ liệu
            request.getRequestDispatcher("CourseServlet").forward(request, response);
        } else {
            request.setAttribute("loiDangNhap", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}