<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.hostel.model.Student" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>All Students</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#AAFFC7; font-family:'Segoe UI',sans-serif; color:#124170; }
    .navbar { background:#124170; color:#AAFFC7; padding:14px 24px; font-weight:700; }
    .navbar a { color:#AAFFC7; text-decoration:none; margin-right:10px; font-weight:500; }
    .wrap { max-width:1100px; margin:30px auto; padding:0 16px; }
    .card { background:#fff; padding:24px; border-radius:12px; border-top:6px solid #215B63; box-shadow:0 6px 16px rgba(0,0,0,0.08); }
    table { width:100%; border-collapse:collapse; font-size:0.9rem; }
    thead { background:#215B63; color:#AAFFC7; }
    th, td { padding:10px 12px; text-align:left; border-bottom:1px solid #E3F3ED; }
    tr:hover { background:#E8FFF1; }
  </style>
</head>
<body>
<div class="navbar"><a href="index.jsp">← Home</a> Hostel Management System</div>
<div class="wrap">
  <div class="card">
    <h2>All Student Records</h2>
    <%
      List<Student> students = (List<Student>) request.getAttribute("students");
      if (students == null || students.isEmpty()) {
    %>
      <p>No student records found.</p>
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