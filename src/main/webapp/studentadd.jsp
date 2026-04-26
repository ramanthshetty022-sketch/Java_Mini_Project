<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Student</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Segoe UI', sans-serif; background: #F1F2F6; color: #2D3436; min-height: 100vh; }

    nav { background: #2D3436; padding: 16px 36px; display: flex; align-items: center; }
    nav .brand { color: #fff; font-size: 20px; font-weight: 700; }
    nav .brand span { color: #00B894; }
    nav .nav-links { margin-left: auto; display: flex; gap: 6px; }
    nav .nav-links a { color: #dfe6e9; text-decoration: none; font-size: 14px; padding: 7px 16px; border-radius: 4px; transition: background 0.2s; }
    nav .nav-links a:hover { background: #00B894; color: #fff; }

    .container {
      max-width: 600px;
      margin: 40px auto;
      background: #ffffff;
      padding: 36px 40px;
      border-radius: 12px;
      box-shadow: 0 2px 16px rgba(0,0,0,0.08);
    }
    h2 { color: #2D3436; margin-bottom: 6px; font-size: 22px; }
    .subtitle { color: #b2bec3; font-size: 13px; margin-bottom: 24px; }
    .section-line { border: none; border-top: 1px solid #f1f2f6; margin: 0 0 24px; }

    .form-group { margin-bottom: 18px; }
    label { display: block; font-weight: 600; margin-bottom: 6px; font-size: 13px; color: #636e72; text-transform: uppercase; letter-spacing: 0.4px; }
    input { width: 100%; padding: 10px 13px; border: 1.5px solid #dfe6e9; border-radius: 6px; font-size: 14px; background: #fff; color: #2D3436; transition: border-color 0.2s; }
    input:focus { border-color: #00B894; outline: none; box-shadow: 0 0 0 3px rgba(0,184,148,0.1); }
    input::placeholder { color: #b2bec3; }

    .inline { display: flex; gap: 14px; }
    .inline .form-group { flex: 1; }

    .btn {
      background: #00B894;
      color: #fff;
      border: none;
      padding: 11px 32px;
      border-radius: 6px;
      cursor: pointer;
      font-size: 15px;
      font-weight: 600;
      margin-top: 6px;
      transition: background 0.2s, box-shadow 0.2s;
      box-shadow: 0 4px 12px rgba(0,184,148,0.3);
    }
    .btn:hover { background: #00a381; box-shadow: 0 6px 16px rgba(0,184,148,0.4); }

    .msg-success { background: #e8fdf8; color: #00a381; padding: 11px 16px; border-left: 4px solid #00B894; border-radius: 4px; margin-bottom: 20px; font-size: 14px; }
    .msg-error   { background: #fff5f5; color: #d63031; padding: 11px 16px; border-left: 4px solid #d63031; border-radius: 4px; margin-bottom: 20px; font-size: 14px; }
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

<div class="container">
  <h2>➕ Add New Student</h2>
  <p class="subtitle">Fill in the details below to register a new student</p>
  <hr class="section-line">

  <% String msg = (String) request.getAttribute("message");
     if (msg != null) { %>
    <div class="<%= msg.contains("success") ? "msg-success" : "msg-error" %>"><%= msg %></div>
  <% } %>

  <form action="AddStudentServlet" method="post" id="addForm" novalidate>

    <div class="inline">
      <div class="form-group">
        <label>Student ID</label>
        <input type="number" name="studentID" id="studentID" min="1" placeholder="e.g. 101">
        <div class="err" id="errID">Enter a valid positive ID.</div>
      </div>
      <div class="form-group">
        <label>Room Number</label>
        <input type="text" name="roomNumber" id="roomNumber" maxlength="10" placeholder="e.g. A-12">
        <div class="err" id="errRoom">Room number is required.</div>
      </div>
    </div>

    <div class="form-group">
      <label>Student Name</label>
      <input type="text" name="studentName" id="studentName" maxlength="100" placeholder="Full name">
      <div class="err" id="errName">Name is required (letters and spaces only).</div>
    </div>

    <div class="form-group">
      <label>Admission Date</label>
      <input type="date" name="admissionDate" id="admissionDate">
      <div class="err" id="errDate">Admission date is required.</div>
    </div>

    <div class="inline">
      <div class="form-group">
        <label>Fees Paid (₹)</label>
        <input type="number" name="feesPaid" id="feesPaid" min="0" step="0.01" placeholder="0.00">
        <div class="err" id="errPaid">Enter a valid non-negative amount.</div>
      </div>
      <div class="form-group">
        <label>Pending Fees (₹)</label>
        <input type="number" name="pendingFees" id="pendingFees" min="0" step="0.01" placeholder="0.00">
        <div class="err" id="errPending">Enter a valid non-negative amount.</div>
      </div>
    </div>

    <button type="submit" class="btn">✔ Add Student</button>
  </form>
</div>

<script>
document.getElementById('addForm').addEventListener('submit', function(e) {
  let ok = true;
  const show = (id, cond) => {
    document.getElementById(id).style.display = cond ? 'block' : 'none';
    if (cond) ok = false;
  };
  const id   = document.getElementById('studentID').value.trim();
  const name = document.getElementById('studentName').value.trim();
  const room = document.getElementById('roomNumber').value.trim();
  const date = document.getElementById('admissionDate').value;
  const paid = document.getElementById('feesPaid').value.trim();
  const pend = document.getElementById('pendingFees').value.trim();

  show('errID',      !id || isNaN(id) || parseInt(id) < 1);
  show('errName',    !name || !/^[a-zA-Z\s]+$/.test(name));
  show('errRoom',    !room);
  show('errDate',    !date);
  show('errPaid',    paid === '' || isNaN(paid) || parseFloat(paid) < 0);
  show('errPending', pend === '' || isNaN(pend) || parseFloat(pend) < 0);
  if (!ok) e.preventDefault();
});
</script>
</body>
</html>