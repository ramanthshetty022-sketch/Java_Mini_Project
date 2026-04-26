<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Reports</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Segoe UI', sans-serif; background: #F1F2F6; color: #2D3436; min-height: 100vh; }

    nav { background: #2D3436; padding: 16px 36px; display: flex; align-items: center; }
    nav .brand { color: #fff; font-size: 20px; font-weight: 700; }
    nav .brand span { color: #00B894; }
    nav .nav-links { margin-left: auto; display: flex; gap: 6px; }
    nav .nav-links a { color: #dfe6e9; text-decoration: none; font-size: 14px; padding: 7px 16px; border-radius: 4px; transition: background 0.2s; }
    nav .nav-links a:hover { background: #00B894; color: #fff; }

    .page-header { max-width: 740px; margin: 40px auto 0; padding: 0 20px; }
    .page-header h2 { color: #2D3436; font-size: 22px; margin-bottom: 4px; }
    .page-header p  { color: #b2bec3; font-size: 13px; margin-bottom: 28px; }

    .container { max-width: 740px; margin: 0 auto; padding: 0 20px 60px; }

    .card { background: #ffffff; border: 1px solid #dfe6e9; border-radius: 12px; padding: 26px 30px; margin-bottom: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); transition: box-shadow 0.2s; }
    .card:hover { box-shadow: 0 4px 16px rgba(0,184,148,0.1); border-color: #00B894; }
    .card h3 { color: #2D3436; margin-bottom: 16px; font-size: 16px; display: flex; align-items: center; gap: 10px; }
    .card h3 .badge { background: #e8fdf8; color: #00a381; padding: 3px 10px; border-radius: 20px; font-size: 12px; font-weight: 700; }

    label { display: block; font-weight: 600; margin-bottom: 6px; font-size: 13px; color: #636e72; text-transform: uppercase; letter-spacing: 0.4px; }
    input { padding: 10px 13px; border: 1.5px solid #dfe6e9; border-radius: 6px; font-size: 14px; background: #fff; color: #2D3436; width: 100%; transition: border-color 0.2s; }
    input:focus { border-color: #00B894; outline: none; box-shadow: 0 0 0 3px rgba(0,184,148,0.1); }
    input::placeholder { color: #b2bec3; }

    .btn { background: #00B894; color: #fff; border: none; padding: 10px 26px; border-radius: 6px; cursor: pointer; font-size: 14px; font-weight: 600; margin-top: 12px; transition: background 0.2s; box-shadow: 0 4px 10px rgba(0,184,148,0.25); }
    .btn:hover { background: #00a381; }

    .inline { display: flex; gap: 14px; }
    .inline > div { flex: 1; }
    .err { color: #d63031; font-size: 12px; margin-top: 4px; display: none; }
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

<div class="page-header">
  <h2>📊 Reports</h2>
  <p>Generate reports based on fees, room, or admission date</p>
</div>

<div class="container">

  <div class="card">
    <h3>💰 Students with Pending Fees <span class="badge">Report 1</span></h3>
    <form action="ReportServlet" method="post">
      <input type="hidden" name="reportType" value="pending">
      <button type="submit" class="btn">Generate Report</button>
    </form>
  </div>

  <div class="card">
    <h3>🚪 Students in a Particular Room <span class="badge">Report 2</span></h3>
    <form action="ReportServlet" method="post" id="roomForm" novalidate>
      <input type="hidden" name="reportType" value="room">
      <div style="margin-bottom:4px;">
        <label>Room Number</label>
        <input type="text" name="roomNumber" id="roomNo" maxlength="10" placeholder="e.g. A-01">
        <div class="err" id="errRoom">Please enter a room number.</div>
      </div>
      <button type="submit" class="btn">Generate Report</button>
    </form>
  </div>

  <div class="card">
    <h3>📅 Students Admitted in a Date Range <span class="badge">Report 3</span></h3>
    <form action="ReportServlet" method="post" id="dateForm" novalidate>
      <input type="hidden" name="reportType" value="daterange">
      <div class="inline">
        <div>
          <label>From Date</label>
          <input type="date" name="fromDate" id="fromDate">
          <div class="err" id="errFrom">Required.</div>
        </div>
        <div>
          <label>To Date</label>
          <input type="date" name="toDate" id="toDate">
          <div class="err" id="errTo">Required.</div>
        </div>
      </div>
      <button type="submit" class="btn">Generate Report</button>
    </form>
  </div>

</div>

<script>
document.getElementById('roomForm').addEventListener('submit', function(e) {
  const v = document.getElementById('roomNo').value.trim();
  const el = document.getElementById('errRoom');
  if (!v) { el.style.display='block'; e.preventDefault(); } else el.style.display='none';
});
document.getElementById('dateForm').addEventListener('submit', function(e) {
  let ok=true;
  const from=document.getElementById('fromDate').value;
  const to=document.getElementById('toDate').value;
  const ef=document.getElementById('errFrom');
  const et=document.getElementById('errTo');
  if(!from){ef.style.display='block';ok=false;}else ef.style.display='none';
  if(!to){et.style.display='block';ok=false;}else et.style.display='none';
  if(ok && from>to){ef.textContent='From must be before To.';ef.style.display='block';ok=false;}
  if(!ok) e.preventDefault();
});
</script>
</body>
</html>