package com.tourism.servlet;

import com.tourism.util.DBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/addspot")
public class SpotServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        
        if (session == null || session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String location = req.getParameter("location");
        String username = (String) session.getAttribute("username");
        
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO tourist_spots (name, description, location, added_by) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setString(3, location);
            stmt.setString(4, username);
            stmt.executeUpdate();
            resp.sendRedirect("spots.jsp?msg=added");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("spots.jsp?error=failed");
        }
    }
}