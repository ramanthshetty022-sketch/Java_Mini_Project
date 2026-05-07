<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add Student</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#AAFFC7; font-family:'Segoe UI',sans-serif; color:#124170; }
    .navbar { background:#124170; color:#AAFFC7; padding:14px 24px; font-weight:700; }
    .navbar a { color:#AAFFC7; text-decoration:none; margin-right:10px; font-weight:500; }
    .wrap { max-width:600px; margin:30px auto; padding:0 16px; }
    .card { background:#fff; padding:28px; border-radius:12px; border-top:6px solid #215B63; box-shadow:0 6px 16px rgba(0,0,0,0.08); }
    .form-group { margin-bottom:16px; }
    label { display:block; margin-bottom:6px; color:#124170; font-weight:600; }
    input { width:100%; padding:10px; border:1.5px solid #67C090; border-radius:7px; }
    input[readonly] { background:#E8FFF1; font-weight:700; }
    .row { display:grid; grid-template-columns:1fr 1fr; gap:12px; }
    .btn { width:100%; padding:10px; background:#215B63; color:#AAFFC7; border:none; border-radius:7px; font-weight:700; }
  </style>
</head>
<body>
<div class="navbar"><a href="index.jsp">← Home</a> Hostel Management System</div>
<div class="wrap">
  <div class="card">
    <h2>Add New Student</h2>
    <form action="AddStudentServlet" method="post">
      <div class="form-group">
        <label>Student ID (Auto-Generated)</label>
        <input type="text" value="<%= request.getAttribute("nextID") != null ? request.getAttribute("nextID") : "" %>" readonly>
      </div>
      <div class="form-group"><label>Student Name</label><input name="studentName" required></div>
      <div class="form-group"><label>Room Number</label><input name="roomNumber" required></div>
      <div class="row">
        <div class="form-group"><label>Admission Date</label><input type="date" name="admissionDate" required></div>
        <div class="form-group"><label>Fees Paid</label><input type="number" name="feesPaid" min="0" step="0.01" required></div>
      </div>
      <div class="form-group"><label>Pending Fees</label><input type="number" name="pendingFees" min="0" step="0.01" required></div>
      <button class="btn" type="submit">Add Student</button>
    </form>
  </div>
</div>
</body>
</html>