<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hostel.model.Student, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <title>Report Result</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Segoe UI', sans-serif; background: #F1F2F6; color: #2D3436; min-height: 100vh; }

    nav { background: #2D3436; padding: 16px 36px; display: flex; align-items: center; }
    nav .brand { color: #fff; font-size: 20px; font-weight: 700; }
    nav .brand span { color: #00B894; }
    nav .nav-links { margin-left: auto; display: flex; gap: 6px; }
    nav .nav-links a { color: #dfe6e9; text-decoration: none; font-size: 14px; padding: 7px 16px; border-radius: 4px; transition: background 0.2s; }
    nav .nav-links a:hover { background: #00B894; color: #fff; }

    .container { max-width: 1060px; margin: 40px auto; background: #ffffff; padding: 36px 40px; border-radius: 12px; box-shadow: 0 2px 16px rgba(0,0,0,0.08); }
    h2 { color: #2D3436; margin-bottom: 6px; font-size: 22px; }
    .subtitle { color: #b2bec3; font-size: 13px; margin-bottom: 24px; }
    .section-line { border: none; border-top: 1px solid #f1f2f6; margin: 0 0 22px; }

    .back { display: inline-flex; align-items: center; gap: 6px; margin-bottom: 20px; color: #00B894; text-decoration: none; font-size: 14px; font-weight: 600; }
    .back:hover { text-decoration: underline; }

    .msg-error { background: #fff5f5; color: #d63031; padding: 11px 16px; border-left: 4px solid #d63031; border-radius: 4px; margin-bottom: 20px; font-size: 14px; }
    .count { color: #636e72; font-size: 14px; margin-bottom: 14px; }
    .count strong { color: #00B894; }

    table { width: 100%; border-collapse: collapse; font-size: 14px; }
    thead tr { background: #2D3436; }
    th { color: #ffffff; padding: 12px 14px; text-align: left; font-weight: 600; font-size: 13px; text-transform: uppercase; letter-spacing: 0.4px; }
    th:first-child { border-radius: 8px 0 0 0; }
    th:last-child  { border-radius: 0 8px 0 0; }
    td { padding: 11px 14px; border-bottom: 1px solid #f1f2f6; }
    tbody tr:hover td { background: #f8f9fa; }

    .badge-pending { background: #fff5f5; color: #d63031; padding: 3px 10px; border-radius: 20px; font-size: 12px; font-weight: 600; border: 1px solid #fab0b0; }
    .badge-clear   { background: #e8fdf8; color: #00a381; padding: 3px 10px; border-radius: 20px; font-size: 12px; font-weight: 600; border: 1px solid #a0e8d8; }
    .empty { color: #b2bec3; font-size: 15px; text-align: center; padding: 40px 0; }
  </style>
</head>
<body>

<nav>
  <div class="brand">🏠 Hostel <span>Management System</span></div>
  <div class="nav-links">
    <a href="index.jsp">Home</a>
    <a href="studentadd.jsp">Add Student</a>
    <a href="StudentUpdate">Update Student</a>
    <a href="studentdelete.jsp">Delete Student</a>
    <a href="DisplayStudentsServlet">View Students</a>
    <a href="reports.jsp">Reports</a>
  </div>
</nav>

<div class="container">
  <a class="back" href="reports.jsp">← Back to Reports</a>
  <h2>📊 Report Results</h2>
  <p class="subtitle">Displaying results based on selected criteria</p>
  <hr class="section-line">

  <% String msg = (String) request.getAttribute("message");
     if (msg != null) { %>
    <div class="msg-error"><%= msg %></div>
  <% } %>

  <%
    List<Student> results = (List<Student>) request.getAttribute("results");
    if (results != null && !results.isEmpty()) {
  %>
    <p class="count"><strong><%= results.size() %></strong> record(s) found</p>
    <table>
      <thead>
        <tr>
          <th>ID</th><th>Name</th><th>Room</th><th>Admission Date</th>
          <th>Fees Paid (₹)</th><th>Pending Fees (₹)</th><th>Status</th>
        </tr>
      </thead>
      <tbody>
        <% for (Student s : results) { %>
        <tr>
          <td><%= s.getStudentID() %></td>
          <td><%= s.getStudentName() %></td>
          <td><%= s.getRoomNumber() %></td>
          <td><%= s.getAdmissionDate() %></td>
          <td><%= String.format("%.2f", s.getFeesPaid()) %></td>
          <td><%= String.format("%.2f", s.getPendingFees()) %></td>
          <td>
            <% if (s.getPendingFees() > 0) { %>
              <span class="badge-pending">Pending</span>
            <% } else { %>
              <span class="badge-clear">Cleared</span>
            <% } %>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table>
  <% } else if (msg == null) { %>
    <p class="empty">📭 No records found for this report.</p>
  <% } %>
</div>

</body>
</html>