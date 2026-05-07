<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.hostel.model.Student" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Report Result</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#F4FBF8; font-family:'Segoe UI',sans-serif; }
    .navbar { background:#2C6E49; color:#F4FBF8; padding:14px 24px; font-weight:700; }
    .navbar a { color:#CDEFE2; text-decoration:none; margin-right:10px; font-weight:500; }
    .wrap { max-width:1100px; margin:30px auto; padding:0 16px; }
    .card { background:#fff; padding:24px; border-radius:12px; border-top:6px solid #2C6E49; box-shadow:0 6px 16px rgba(0,0,0,0.08); }
    table { width:100%; border-collapse:collapse; font-size:0.9rem; }
    thead { background:#2C6E49; color:#F4FBF8; }
    th, td { padding:10px 12px; text-align:left; border-bottom:1px solid #E3F3ED; }
    .alert { padding:10px 14px; border-radius:7px; margin:12px 0; font-weight:600; }
    .alert-info { background:#CDEFE2; color:#2C6E49; border-left:4px solid #2C6E49; }
  </style>
</head>
<body>
<div class="navbar"><a href="index.jsp">← Home</a> Hostel Management System</div>
<div class="wrap">
  <div class="card">
    <h2>Report Result</h2>
    <p><%= request.getAttribute("reportTitle") %></p>
    <%
      List<Student> students = (List<Student>) request.getAttribute("students");
      if (students == null || students.isEmpty()) {
    %>
      <div class="alert alert-info">No records found.</div>
    <% } else { %>
    <table>
      <thead>
        <tr>
          <th>ID</th><th>Name</th><th>Room</th><th>Admission</th><th>Fees Paid</th><th>Pending Fees</th>
        </tr>
      </thead>
      <tbody>
      <% for (Student s : students) { %>
        <tr>
          <td><%= s.getStudentID() %></td>
          <td><%= s.getStudentName() %></td>
          <td><%= s.getRoomNumber() %></td>
          <td><%= s.getAdmissionDate() %></td>
          <td><%= s.getFeesPaid() %></td>
          <td><%= s.getPendingFees() %></td>
        </tr>
      <% } %>
      </tbody>
    </table>
    <% } %>
  </div>
</div>
</body>
</html>