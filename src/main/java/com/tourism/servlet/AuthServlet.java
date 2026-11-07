package com.tourism.servlet;

import com.tourism.util.DBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if ("register".equals(action)) {
            register(req, resp);
        } else if ("login".equals(action)) {
            login(req, resp);
        }
    }
    
    private void register(HttpServletRequest req, HttpServletResponse resp) 
            throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.executeUpdate();
            resp.sendRedirect("login.jsp?msg=registered");
        } catch (SQLException e) {
        	e.printStackTrace();
        	resp.sendRedirect("register.jsp?error=db");
        }
    }
    
    private void login(HttpServletRequest req, HttpServletResponse resp) 
            throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                resp.sendRedirect("spots.jsp");
            } else {
                resp.sendRedirect("login.jsp?error=invalid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?error=db");
        }
    }
}