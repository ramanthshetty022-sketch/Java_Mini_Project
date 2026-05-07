<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hostel.model.Student" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Student</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#AAFFC7; font-family:'Segoe UI',sans-serif; color:#124170; }
    .navbar { background:#124170; color:#AAFFC7; padding:14px 24px; font-weight:700; }
    .navbar a { color:#AAFFC7; text-decoration:none; margin-right:10px; font-weight:500; }
    .wrap { max-width:650px; margin:30px auto; padding:0 16px; }
    .card { background:#fff; padding:24px; border-radius:12px; border-top:6px solid #215B63; box-shadow:0 6px 16px rgba(0,0,0,0.08); margin-bottom:18px; }
    .form-group { margin-bottom:14px; }
    label { display:block; margin-bottom:6px; color:#124170; font-weight:600; }
    input { width:100%; padding:10px; border:1.5px solid #67C090; border-radius:7px; }
    .btn { width:100%; padding:10px; background:#215B63; color:#AAFFC7; border:none; border-radius:7px; font-weight:700; }
  </style>
</head>
<body>
<div class="navbar"><a href="index.jsp">← Home</a> Hostel Management System</div>
<div class="wrap">
  <div class="card">
    <h2>Search Student by ID</h2>
    <form action="UpdateStudentServlet" method="get">
      <div class="form-group"><input type="number" name="studentID" placeholder="Enter Student ID" required></div>
      <button class="btn">Search</button>
    </form>
  </div>

  <% Student s = (Student) request.getAttribute("student"); %>
  <% if (s != null) { %>
  <div class="card">
    <h2>Update Student Details</h2>
    <form action="UpdateStudentServlet" method="post">
      <input type="hidden" name="studentID" value="<%= s.getStudentID() %>">
      <div class="form-group"><label>Name</label><input name="studentName" value="<%= s.getStudentName() %>" required></div>
      <div class="form-group"><label>Room Number</label><input name="roomNumber" value="<%= s.getRoomNumber() %>" required></div>
      <div class="form-group"><label>Admission Date</label><input type="date" name="admissionDate" value="<%= s.getAdmissionDate() %>" required></div>
      <div class="form-group"><label>Fees Paid</label><input type="number" min="0" step="0.01" name="feesPaid" value="<%= s.getFeesPaid() %>" required></div>
      <div class="form-group"><label>Pending Fees</label><input type="number" min="0" step="0.01" name="pendingFees" value="<%= s.getPendingFees() %>" required></div>
      <button class="btn">Update Student</button>
    </form>
  </div>
  <% } %>
</div>
</body>
</html>