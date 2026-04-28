<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Delete Student</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Segoe UI', sans-serif; background: #F1F2F6; color: #2D3436; min-height: 100vh; }

    nav { background: #2D3436; padding: 16px 36px; display: flex; align-items: center; }
    nav .brand { color: #fff; font-size: 20px; font-weight: 700; }
    nav .brand span { color: #00B894; }
    nav .nav-links { margin-left: auto; display: flex; gap: 6px; }
    nav .nav-links a { color: #dfe6e9; text-decoration: none; font-size: 14px; padding: 7px 16px; border-radius: 4px; transition: background 0.2s; }
    nav .nav-links a:hover { background: #00B894; color: #fff; }

    .container { max-width: 500px; margin: 40px auto; background: #ffffff; padding: 36px 40px; border-radius: 12px; box-shadow: 0 2px 16px rgba(0,0,0,0.08); }
    h2 { color: #2D3436; margin-bottom: 6px; font-size: 22px; }
    .subtitle { color: #b2bec3; font-size: 13px; margin-bottom: 24px; }
    .section-line { border: none; border-top: 1px solid #f1f2f6; margin: 0 0 22px; }

    .form-group { margin-bottom: 18px; }
    label { display: block; font-weight: 600; margin-bottom: 6px; font-size: 13px; color: #636e72; text-transform: uppercase; letter-spacing: 0.4px; }
    input { width: 100%; padding: 10px 13px; border: 1.5px solid #dfe6e9; border-radius: 6px; font-size: 14px; color: #2D3436; background: #fff; transition: border-color 0.2s; }
    input:focus { border-color: #d63031; outline: none; box-shadow: 0 0 0 3px rgba(214,48,49,0.1); }
    input::placeholder { color: #b2bec3; }

    .btn-danger { background: #d63031; color: #fff; border: none; padding: 11px 30px; border-radius: 6px; cursor: pointer; font-size: 15px; font-weight: 600; transition: background 0.2s; box-shadow: 0 4px 12px rgba(214,48,49,0.25); margin-top: 6px; }
    .btn-danger:hover { background: #c0392b; }
    .btn-danger:disabled { opacity: 0.6; cursor: not-allowed; }

    .msg-success { background: #e8fdf8; color: #00a381; padding: 11px 16px; border-left: 4px solid #00B894; border-radius: 4px; margin-bottom: 20px; font-size: 14px; font-weight: 600; }
    .msg-error   { background: #fff5f5; color: #d63031; padding: 11px 16px; border-left: 4px solid #d63031; border-radius: 4px; margin-bottom: 20px; font-size: 14px; }
    .warn { background: #fff9f0; color: #e17055; padding: 11px 16px; border-left: 4px solid #e17055; border-radius: 4px; margin-bottom: 22px; font-size: 14px; }
    .err { color: #d63031; font-size: 12px; margin-top: 4px; display: none; }
  </style>
</head>
<body>

<nav>
  <div class="brand">&#127968; Hostel <span>Management System</span></div>
  <div class="nav-links">
    <a href="index.jsp">Home</a>
    <a href="AddStudentServlet">Add Student</a>
    <a href="StudentUpdate">Update Student</a>
    <a href="studentdelete.jsp">Delete Student</a>
    <a href="DisplayStudentsServlet">View Students</a>
    <a href="reports.jsp">Reports</a>
  </div>
</nav>

<div class="container">
  <h2>&#128465; Delete Student</h2>
  <p class="subtitle">Permanently remove a student record</p>
  <hr class="section-line">

  <%-- Flash message from session --%>
  <%
    String flashMsg = (String) session.getAttribute("flashMessage");
    if (flashMsg != null) {
        session.removeAttribute("flashMessage");
  %>
    <div class="msg-success"><%= flashMsg %></div>
  <% } %>

  <%-- Error from request --%>
  <%
    String errMsg = (String) request.getAttribute("message");
    if (errMsg != null) {
  %>
    <div class="msg-error"><%= errMsg %></div>
  <% } %>

  <div class="warn">&#9888; This action is permanent and cannot be undone.</div>

  <form action="DeleteStudentServlet" method="post"
        id="delForm" novalidate onsubmit="return confirmDelete(event)">
    <div class="form-group">
      <label>Student ID *</label>
      <input type="number" name="studentID" id="studentID"
             min="1" placeholder="Enter Student ID to delete">
      <div class="err" id="errID">Please enter a valid Student ID.</div>
    </div>
    <button type="submit" class="btn-danger" id="delBtn">
      &#128465; Delete Student
    </button>
  </form>
</div>

<script>
function confirmDelete(e) {
  const id = document.getElementById('studentID').value.trim();
  const errEl = document.getElementById('errID');
  if (!id || isNaN(id) || parseInt(id) < 1) {
    errEl.style.display = 'block';
    e.preventDefault();
    return false;
  }
  errEl.style.display = 'none';
  if (!confirm('Are you sure you want to delete student with ID ' + id + '?')) {
    return false;
  }
  // Disable button to prevent double submit
  const btn = document.getElementById('delBtn');
  btn.disabled = true;
  btn.textContent = 'Deleting...';
  return true;
}
</script>
</body>
</html>