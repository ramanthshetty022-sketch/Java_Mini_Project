<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Reports</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#F4FBF8; font-family:'Segoe UI',sans-serif; }
    .navbar { background:#2C6E49; color:#F4FBF8; padding:14px 24px; font-weight:700; }
    .navbar a { color:#CDEFE2; text-decoration:none; margin-right:10px; font-weight:500; }
    .wrap { max-width:560px; margin:30px auto; padding:0 16px; }
    .card { background:#fff; padding:24px; border-radius:12px; border-top:6px solid #2C6E49; box-shadow:0 6px 16px rgba(0,0,0,0.08); }
    label { display:block; margin-bottom:6px; font-weight:600; }
    input, select { width:100%; padding:10px; border:1.5px solid #A7D9C5; border-radius:7px; margin-bottom:12px; }
    .btn { width:100%; padding:10px; background:#2C6E49; color:#F4FBF8; border:none; border-radius:7px; font-weight:700; }
    .section { display:none; }
    .alert { padding:10px 14px; border-radius:7px; margin:12px 0; font-weight:600; }
    .alert-error { background:#f8d7da; color:#721c24; border-left:4px solid #dc3545; }
  </style>
  <script>
    function showSection() {
      var v = document.getElementById('reportType').value;
      document.getElementById('pendingSection').style.display = (v==='pendingFees') ? 'block' : 'none';
      document.getElementById('roomSection').style.display = (v==='room') ? 'block' : 'none';
      document.getElementById('dateSection').style.display = (v==='dateRange') ? 'block' : 'none';
    }
  </script>
</head>
<body>
<div class="navbar"><a href="index.jsp">← Home</a> Hostel Management System</div>
<div class="wrap">
  <div class="card">
    <h2>Generate Report</h2>

    <% String msg = (String) request.getAttribute("message");
       String typ = (String) request.getAttribute("msgType");
       if (msg != null) { %>
      <div class="alert alert-<%= typ %>"><%= msg %></div>
    <% } %>

    <form action="ReportServlet" method="post">
      <label>Report Type</label>
      <select id="reportType" name="reportType" onchange="showSection()" required>
        <option value="">-- Select --</option>
        <option value="pendingFees">Students with Pending Fees</option>
        <option value="room">Students in a Room</option>
        <option value="dateRange">Students in Date Range</option>
      </select>

      <div id="roomSection" class="section">
        <label>Room Number</label>
        <input type="text" name="roomNumber">
      </div>

      <div id="dateSection" class="section">
        <label>From Date</label>
        <input type="date" name="fromDate">
        <label>To Date</label>
        <input type="date" name="toDate">
      </div>

      <button class="btn">Generate Report</button>
    </form>
  </div>
</div>
</body>
</html>