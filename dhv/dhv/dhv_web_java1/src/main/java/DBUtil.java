package vn.edu.dhv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBUtil {
    // Tên file database sẽ được tạo ngay trong thư mục dự án
    private static final String URL = "jdbc:sqlite:dhv_database.db";

    public static Connection getConnection() throws Exception {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection(URL);
        
        // Tự động tạo bảng nếu file chưa có
        try (Statement stmt = conn.createStatement()) {
            // Bảng users
            stmt.execute("CREATE TABLE IF NOT EXISTS users (" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "username TEXT NOT NULL UNIQUE, " +
                    "email TEXT NOT NULL, " +
                    "password TEXT NOT NULL)");
                    
            // Bảng courses
            stmt.execute("CREATE TABLE IF NOT EXISTS courses (" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "name TEXT NOT NULL, " +
                    "description TEXT)");
        }
        return conn;
    }
}