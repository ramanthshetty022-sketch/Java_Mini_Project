<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Reports</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#AAFFC7; font-family:'Segoe UI',sans-serif; color:#124170; }
    .navbar { background:#124170; color:#AAFFC7; padding:14px 24px; font-weight:700; }
    .navbar a { color:#AAFFC7; text-decoration:none; margin-right:10px; font-weight:500; }
    .wrap { max-width:560px; margin:30px auto; padding:0 16px; }
    .card { background:#fff; padding:24px; border-radius:12px; border-top:6px solid #215B63; box-shadow:0 6px 16px rgba(0,0,0,0.08); }
    label { display:block; margin-bottom:6px; font-weight:600; }
    input, select { width:100%; padding:10px; border:1.5px solid #67C090; border-radius:7px; margin-bottom:12px; }
    .btn { width:100%; padding:10px; background:#215B63; color:#AAFFC7; border:none; border-radius:7px; font-weight:700; }
    .section { display:none; }
  </style>
  <script>
    function showSection() {
      var v = document.getElementById('reportType').value;
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