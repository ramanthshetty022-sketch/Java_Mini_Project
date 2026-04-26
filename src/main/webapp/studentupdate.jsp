<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hostel.model.Student" %>
<!DOCTYPE html>
<html>
<head>
  <title>Update Student</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Segoe UI', sans-serif; background: #F1F2F6; color: #2D3436; min-height: 100vh; }

    nav { background: #2D3436; padding: 16px 36px; display: flex; align-items: center; }
    nav .brand { color: #fff; font-size: 20px; font-weight: 700; }
    nav .brand span { color: #00B894; }
    nav .nav-links { margin-left: auto; display: flex; gap: 6px; }
    nav .nav-links a { color: #dfe6e9; text-decoration: none; font-size: 14px; padding: 7px 16px; border-radius: 4px; transition: background 0.2s; }
    nav .nav-links a:hover { background: #00B894; color: #fff; }

    .container { max-width: 620px; margin: 40px auto; background: #ffffff; padding: 36px 40px; border-radius: 12px; box-shadow: 0 2px 16px rgba(0,0,0,0.08); }
    h2 { color: #2D3436; margin-bottom: 6px; font-size: 22px; }
    .subtitle { color: #b2bec3; font-size: 13px; margin-bottom: 24px; }
    .section-line { border: none; border-top: 1px solid #f1f2f6; margin: 0 0 22px; }

    .form-group { margin-bottom: 18px; }
    label { display: block; font-weight: 600; margin-bottom: 6px; font-size: 13px; color: #636e72; text-transform: uppercase; letter-spacing: 0.4px; }
    input { width: 100%; padding: 10px 13px; border: 1.5px solid #dfe6e9; border-radius: 6px; font-size: 14px; color: #2D3436; background: #fff; transition: border-color 0.2s; }
    input:focus { border-color: #00B894; outline: none; box-shadow: 0 0 0 3px rgba(0,184,148,0.1); }
    input[readonly] { background: #f1f2f6; color: #b2bec3; cursor: not-allowed; }
    input::placeholder { color: #b2bec3; }

    .inline { display: flex; gap: 14px; }
    .inline .form-group { flex: 1; }

    .btn { background: #00B894; color: #fff; border: none; padding: 11px 30px; border-radius: 6px; cursor: pointer; font-size: 15px; font-weight: 600; transition: background 0.2s; box-shadow: 0 4px 12px rgba(0,184,148,0.3); }
    .btn:hover { background: #00a381; }
    .btn-search { background: #2D3436; box-shadow: none; }
    .btn-search:hover { background: #636e72; }

    .msg-success { background: #e8fdf8; color: #00a381; padding: 11px 16px; border-left: 4px solid #00B894; border-radius: 4px; margin-bottom: 20px; font-size: 14px; }
    .msg-error   { background: #fff5f5; color: #d63031; padding: 11px 16px; border-left: 4px solid #d63031; border-radius: 4px; margin-bottom: 20px; font-size: 14px; }

    .search-row { display: flex; gap: 10px; margin-bottom: 22px; }
    .search-row input { flex: 1; margin: 0; }

    .edit-label { background: #e8fdf8; color: #00a381; padding: 8px 14px; border-radius: 6px; font-size: 13px; font-weight: 600; margin-bottom: 18px; display: inline-block; }
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
  <h2>✏️ Update Student</h2>
  <p class="subtitle">Search by Student ID then edit the record</p>
  <hr class="section-line">

  <% String msg = (String) request.getAttribute("message");
     if (msg != null) { %>
    <div class="<%= msg.contains("success") ? "msg-success" : "msg-error" %>"><%= msg %></div>
  <% } %>

  <form action="StudentUpdate" method="get">
    <div class="search-row">
      <input type="number" name="studentID" placeholder="Enter Student ID to search" min="1">
      <button type="submit" class="btn btn-search">Search</button>
    </div>
  </form>

  <%
    Student s = (Student) request.getAttribute("student");
    if (s != null) {
  %>
  <div class="edit-label">📝 Editing — Student ID: <%= s.getStudentID() %></div>

  <form action="StudentUpdate" method="post" id="updForm" novalidate>
    <input type="hidden" name="studentID" value="<%= s.getStudentID() %>">

    <div class="form-group">
      <label>Student ID</label>
      <input type="text" value="<%= s.getStudentID() %>" readonly>
    </div>

    <div class="form-group">
      <label>Student Name</label>
      <input type="text" name="studentName" id="studentName" value="<%= s.getStudentName() %>" maxlength="100">
      <div class="err" id="errName">Name is required (letters and spaces only).</div>
    </div>

    <div class="inline">
      <div class="form-group">
        <label>Room Number</label>
        <input type="text" name="roomNumber" id="roomNumber" value="<%= s.getRoomNumber() %>" maxlength="10">
        <div class="err" id="errRoom">Room number is required.</div>
      </div>
      <div class="form-group">
        <label>Admission Date</label>
        <input type="date" name="admissionDate" id="admissionDate" value="<%= s.getAdmissionDate() %>">
        <div class="err" id="errDate">Date is required.</div>
      </div>
    </div>

    <div class="inline">
      <div class="form-group">
        <label>Fees Paid (₹)</label>
        <input type="number" name="feesPaid" id="feesPaid" value="<%= s.getFeesPaid() %>" min="0" step="0.01">
        <div class="err" id="errPaid">Enter a valid amount.</div>
      </div>
      <div class="form-group">
        <label>Pending Fees (₹)</label>
        <input type="number" name="pendingFees" id="pendingFees" value="<%= s.getPendingFees() %>" min="0" step="0.01">
        <div class="err" id="errPending">Enter a valid amount.</div>
      </div>
    </div>

    <button type="submit" class="btn">✔ Update Student</button>
  </form>

  <script>
  document.getElementById('updForm').addEventListener('submit', function(e) {
    let ok = true;
    const show = (id, cond) => { document.getElementById(id).style.display = cond ? 'block' : 'none'; if(cond) ok=false; };
    show('errName',    !document.getElementById('studentName').value.trim() || !/^[a-zA-Z\s]+$/.test(document.getElementById('studentName').value.trim()));
    show('errRoom',    !document.getElementById('roomNumber').value.trim());
    show('errDate',    !document.getElementById('admissionDate').value);
    show('errPaid',    document.getElementById('feesPaid').value === '' || parseFloat(document.getElementById('feesPaid').value) < 0);
    show('errPending', document.getElementById('pendingFees').value === '' || parseFloat(document.getElementById('pendingFees').value) < 0);
    if (!ok) e.preventDefault();
  });
  </script>
  <% } %>

</div>
</body>
</html>