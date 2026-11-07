<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, com.tourism.util.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tourist Spots - Hyderabad</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; }
        .header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 20px; text-align: center; }
        .header h1 { margin-bottom: 10px; }
        .user-info { text-align: right; padding: 10px 20px; background: rgba(255,255,255,0.1); }
        .container { max-width: 1200px; margin: 30px auto; padding: 0 20px; }
        .spots-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; margin-bottom: 40px; }
        .spot-card { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .spot-card h3 { color: #667eea; margin-bottom: 10px; }
        .spot-card p { color: #666; line-height: 1.6; margin-bottom: 8px; }
        .spot-card .location { color: #999; font-size: 14px; }
        .add-section { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .add-section h2 { color: #333; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; color: #555; font-weight: bold; }
        input, textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-family: Arial; }
        textarea { resize: vertical; min-height: 80px; }
        button { padding: 12px 30px; background: #667eea; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; }
        button:hover { background: #5568d3; }
        .message { padding: 15px; margin-bottom: 20px; border-radius: 5px; text-align: center; }
        .success { background: #d4edda; color: #155724; }
        .error { background: #f8d7da; color: #721c24; }
        .logout-btn { background: white; color: #667eea; padding: 8px 20px; border: none; border-radius: 5px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="header">
        <h1>🕌 Hyderabad Tourist Spots</h1>
        <% String username = (String) session.getAttribute("username");
           if (username != null) { %>
            <div class="user-info">
                Welcome, <%= username %>! | 
                <a href="logout.jsp" style="color: white;">Logout</a>
            </div>
        <% } %>
    </div>

    <div class="container">
        <% if ("added".equals(request.getParameter("msg"))) { %>
            <div class="message success">Tourist spot added successfully!</div>
        <% } %>

        <h2 style="margin-bottom: 20px; color: #333;">Discover Hyderabad</h2>
        <div class="spots-grid">
            <% 
            try (Connection conn = DBUtil.getConnection()) {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM tourist_spots ORDER BY created_at DESC");
                while (rs.next()) {
            %>
                <div class="spot-card">
                    <h3><%= rs.getString("name") %></h3>
                    <p><%= rs.getString("description") %></p>
                    <p class="location">📍 <%= rs.getString("location") %></p>
                    <p style="font-size: 12px; color: #999; margin-top: 10px;">
                        Added by: <%= rs.getString("added_by") %>
                    </p>
                </div>
            <% 
                }
            } catch (SQLException e) {
                out.println("<p>Error loading spots: " + e.getMessage() + "</p>");
            }
            %>
        </div>

        <% if (username != null) { %>
        <div class="add-section">
            <h2>Add New Tourist Spot</h2>
            <form action="addspot" method="post">
                <div class="form-group">
                    <label>Spot Name</label>
                    <input type="text" name="name" required>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" required></textarea>
                </div>
                <div class="form-group">
                    <label>Location</label>
                    <input type="text" name="location" required>
                </div>
                <button type="submit">Add Tourist Spot</button>
            </form>
        </div>
        <% } else { %>
        <div class="add-section" style="text-align: center;">
            <p>Please <a href="login.jsp" style="color: #667eea;">login</a> to add new tourist spots!</p>
        </div>
        <% } %>
    </div>
</body>
</html>