<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hostel Management System</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#F4FBF8; font-family:'Segoe UI',sans-serif; color:#2D3A3A; }
    .topbar {
      background:#2C6E49;
      color:#F4FBF8;
      padding:18px 28px;
      font-size:1.4rem;
      font-weight:700;
    }
    .layout { display:grid; grid-template-columns:240px 1fr; min-height:calc(100vh - 64px); }
    .sidebar { background:#CDEFE2; padding:22px; }
    .sidebar a {
      display:block; background:#A7D9C5; color:#2D3A3A; text-decoration:none;
      padding:12px 14px; border-radius:8px; margin-bottom:10px; font-weight:600;
    }
    .sidebar a:hover { background:#2C6E49; color:#F4FBF8; }
    .content { padding:36px 32px; }
    .hero { background:#E9FFF4; padding:24px; border-radius:14px; box-shadow:0 6px 16px rgba(0,0,0,0.08); }
    .cards { display:grid; grid-template-columns:repeat(auto-fit,minmax(220px,1fr)); gap:18px; margin-top:20px; }
    .card { background:#ffffff; border-left:6px solid #2C6E49; padding:18px; border-radius:12px; }
    .card a { display:inline-block; margin-top:10px; background:#2C6E49; color:#F4FBF8; padding:6px 14px; border-radius:6px; text-decoration:none; }
    footer { text-align:center; padding:16px; background:#2C6E49; color:#F4FBF8; font-size:0.85rem; }
  </style>
</head>
<body>
<div class="topbar">Hostel Management System</div>
<div class="layout">
  <div class="sidebar">
    <a href="AddStudentServlet">➕ Add Student</a>
    <a href="studentupdate.jsp">✏️ Update Student</a>
    <a href="studentdelete.jsp">🗑️ Delete Student</a>
    <a href="DisplayStudentsServlet">📋 View Students</a>
    <a href="report_form.jsp">📊 Reports</a>
  </div>
  <div class="content">
    <div class="hero">
      <h2>Welcome to Hostel Management</h2>
      <p>Manage admissions, room allocations and fee status easily.</p>
    </div>
    <div class="cards">
      <div class="card"><h4>Add Student</h4><p>Register a new student.</p><a href="AddStudentServlet">Open</a></div>
      <div class="card"><h4>Update Student</h4><p>Edit existing details.</p><a href="studentupdate.jsp">Open</a></div>
      <div class="card"><h4>Delete Student</h4><p>Remove a student record.</p><a href="studentdelete.jsp">Open</a></div>
      <div class="card"><h4>View Students</h4><p>See all students.</p><a href="DisplayStudentsServlet">Open</a></div>
      <div class="card"><h4>Reports</h4><p>Generate reports.</p><a href="report_form.jsp">Open</a></div>
    </div>
  </div>
</div>
<footer>Hostel Management System © 2026</footer>
</body>
