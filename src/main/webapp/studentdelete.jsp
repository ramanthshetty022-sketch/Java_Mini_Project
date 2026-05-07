<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Delete Student</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#F4FBF8; font-family:'Segoe UI',sans-serif; }
    .navbar { background:#2C6E49; color:#F4FBF8; padding:14px 24px; font-weight:700; }
    .navbar a { color:#CDEFE2; text-decoration:none; margin-right:10px; font-weight:500; }
    .wrap { max-width:460px; margin:60px auto; padding:0 16px; }
    .card { background:#fff; padding:24px; border-radius:12px; border-top:6px solid #2C6E49; box-shadow:0 6px 16px rgba(0,0,0,0.08); }
    .form-group { margin-bottom:14px; }
    label { display:block; margin-bottom:6px; color:#2D3A3A; font-weight:600; }
    input { width:100%; padding:10px; border:1.5px solid #A7D9C5; border-radius:7px; }
    .btn { width:100%; padding:10px; background:#2C6E49; color:#F4FBF8; border:none; border-radius:7px; font-weight:700; }
    .alert { padding:10px 14px; border-radius:7px; margin:12px 0; font-weight:600; }
    .alert-success { background:#CDEFE2; color:#2C6E49; border-left:4px solid #2C6E49; }
    .alert-error { background:#f8d7da; color:#721c24; border-left:4px solid #dc3545; }
  </style>
</head>
<body>
<div class="navbar"><a href="index.jsp">← Home</a> Hostel Management System</div>
<div class="wrap">
  <div class="card">
    <h2>Delete Student</h2>

    <% String msg = (String) request.getAttribute("message");
       String typ = (String) request.getAttribute("msgType");
       if (msg != null) { %>
      <div class="alert alert-<%= typ %>"><%= msg %></div>
    <% } %>

    <form action="DeleteStudentServlet" method="post">
      <div class="form-group"><label>Student ID</label><input type="number" name="studentID" required></div>
      <button class="btn">Delete Student</button>
    </form>
  </div>
</div>
</body>
</html>