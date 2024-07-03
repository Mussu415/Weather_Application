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
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServelt")
public class LoginServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establishing the connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/weather_application", "root",  "123456");
            
            String sql = "SELECT * FROM user WHERE (username = ? AND password = ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            rs = stmt.executeQuery();
           
            // Check if the user exists
            
            if (rs.next()) { 
            	HttpSession session = request.getSession();
            	session.setAttribute("name", username);
            	response.sendRedirect("Home.jsp");
            	
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