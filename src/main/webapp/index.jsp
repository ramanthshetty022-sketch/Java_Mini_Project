<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hostel Management System</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#AAFFC7; font-family:'Segoe UI',sans-serif; color:#124170; min-height:100vh; display:flex; flex-direction:column; }
    .topbar { background:#124170; color:#AAFFC7; padding:18px 28px; font-size:1.4rem; font-weight:700; }
    .wrap { max-width:1100px; margin:36px auto; padding:0 18px; width:100%; text-align:center; flex:1; }
    .hero { background:#E8FFF1; padding:24px; border-radius:14px; box-shadow:0 6px 16px rgba(0,0,0,0.08); margin-bottom:22px; }
    .cards { display:grid; grid-template-columns:repeat(auto-fit,minmax(220px,1fr)); gap:18px; justify-items:center; }
    .card { background:#FFFFFF; border-left:6px solid #215B63; padding:18px; border-radius:12px; width:100%; max-width:260px; text-align:left; box-shadow:0 4px 12px rgba(0,0,0,0.07); }
    .card a { display:inline-block; margin-top:10px; background:#215B63; color:#AAFFC7; padding:6px 14px; border-radius:6px; text-decoration:none; font-weight:600; }
    footer { text-align:center; padding:14px; background:#124170; color:#AAFFC7; font-size:0.85rem; margin-top:auto; }
  </style>
</head>
<body>
<div class="topbar">Hostel Management System</div>
<div class="wrap">
  <div class="hero">
    <h2>Welcome to Hostel Management System</h2>
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
<footer>Hostel Management System © 2026</footer>
</body>
</html>