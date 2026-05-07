<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Delete Student</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#AAFFC7; font-family:'Segoe UI',sans-serif; color:#124170; }
    .navbar { background:#124170; color:#AAFFC7; padding:14px 24px; font-weight:700; }
    .navbar a { color:#AAFFC7; text-decoration:none; margin-right:10px; font-weight:500; }
    .wrap { max-width:460px; margin:60px auto; padding:0 16px; }
    .card { background:#fff; padding:24px; border-radius:12px; border-top:6px solid #215B63; box-shadow:0 6px 16px rgba(0,0,0,0.08); }
    .form-group { margin-bottom:14px; }
    label { display:block; margin-bottom:6px; color:#124170; font-weight:600; }
    input { width:100%; padding:10px; border:1.5px solid #67C090; border-radius:7px; }
    .btn { width:100%; padding:10px; background:#215B63; color:#AAFFC7; border:none; border-radius:7px; font-weight:700; }
  </style>
  <script>
    function confirmDelete() {
      var id = document.getElementById('studentID').value.trim();
      if (!id || isNaN(id)) { alert('Enter valid Student ID.'); return false; }
      return confirm('Are you sure you want to delete Student ID: ' + id + '?');
    }
  </script>
</head>
<body>
<div class="navbar"><a href="index.jsp">← Home</a> Hostel Management System</div>
<div class="wrap">
  <div class="card">
    <h2>Delete Student</h2>
    <form action="DeleteStudentServlet" method="post" onsubmit="return confirmDelete()">
      <div class="form-group"><label>Student ID</label><input type="number" id="studentID" name="studentID" required></div>
      <button class="btn">Delete Student</button>
    </form>
  </div>
</div>
</body>
</html>