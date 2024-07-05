package in.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddCity")
public class AddCityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	String city = request.getParameter("city");
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null && city != null && !city.trim().isEmpty()) {
            try {
                // Establish database connection
            	
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/weather_application", "root",
                        "123456");

                // Check if the city already exists for the user
                if (!isCityAlreadySaved(userId, city, conn)) {
                    // Insert the city into database
                    insertCity(userId, city, conn);
                } else {
                    System.out.println("City already exists for this user.");
                }

                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("Home.jsp");
    }

    // Method to check if the city is already saved for the user
    private boolean isCityAlreadySaved(Integer userId, String city, Connection conn) throws SQLException {
        String sql = "SELECT * FROM userCity WHERE userId = ? AND savedCity = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, userId);
        statement.setString(2, city);
        ResultSet result = statement.executeQuery();
        boolean cityExists = result.next();
        statement.close();
        return cityExists;
    }

    // Method to insert a new city for the user into the database
    private void insertCity(Integer userId, String city, Connection conn) throws SQLException {
        String sql = "INSERT INTO userCity (userId, savedCity) VALUES (?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, userId);
        statement.setString(2, city);

        int rowsInserted = statement.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("A new city was inserted successfully: " + city);
        }

        statement.close();
    }
}
