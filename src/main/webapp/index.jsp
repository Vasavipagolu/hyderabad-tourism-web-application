<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hyderabad Tourism</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .container { background: white; padding: 40px; border-radius: 10px; box-shadow: 0 10px 40px rgba(0,0,0,0.2); text-align: center; max-width: 500px; }
        h1 { color: #333; margin-bottom: 20px; }
        p { color: #666; margin-bottom: 30px; line-height: 1.6; }
        .btn { display: inline-block; padding: 12px 30px; margin: 10px; background: #667eea; color: white; text-decoration: none; border-radius: 5px; transition: 0.3s; }
        .btn:hover { background: #5568d3; transform: translateY(-2px); }
        .btn-secondary { background: #764ba2; }
        .btn-secondary:hover { background: #633d8a; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🕌 Hyderabad Tourism</h1>
        <p>Discover the beautiful tourist spots in the City of Pearls! Browse existing spots or login to add your own recommendations.</p>
        <a href="spots.jsp" class="btn">View Tourist Spots</a><br>
        <a href="login.jsp" class="btn btn-secondary">Login</a>
        <a href="register.jsp" class="btn btn-secondary">Register</a>
    </div>
</body>
</html>