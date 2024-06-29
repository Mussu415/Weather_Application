package in.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoginServelt")
public class LoginServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/weather_application";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "123456";
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // Load the JDBC driver
            Class.forName(JDBC_DRIVER);
            
            // Establish the connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            
            // Create SQL query
            String sql = "SELECT * FROM user WHERE (username = ? AND password = ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            // Execute query
            rs = stmt.executeQuery();
           
            // Check if the user exists
            if (rs.next()) {
                // User exists
               RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
               rd.forward(request, response);   
            } else {
                // User does not exist
                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                out.println("<h1><font color=red>Invalid username or password</h1><br>");
                out.println("<a href='Login.jsp'>Try Again</a>");
                out.println("</body></html>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}