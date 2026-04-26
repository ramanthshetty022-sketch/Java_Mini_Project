<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Hostel Management System</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'Segoe UI', sans-serif;
      background: #F1F2F6;
      color: #2D3436;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* ── NAV ── */
    nav {
      background: #2D3436;
      padding: 16px 36px;
      display: flex;
      align-items: center;
    }
    nav .brand { color: #ffffff; font-size: 20px; font-weight: 700; letter-spacing: 0.5px; }
    nav .brand span { color: #00B894; }
    nav .nav-links { margin-left: auto; display: flex; gap: 6px; }
    nav .nav-links a {
      color: #dfe6e9;
      text-decoration: none;
      font-size: 14px;
      padding: 7px 16px;
      border-radius: 4px;
      transition: background 0.2s, color 0.2s;
    }
    nav .nav-links a:hover { background: #00B894; color: #fff; }

    /* ── HERO ── */
    .hero {
      text-align: center;
      padding: 60px 20px 30px;
    }
    .hero .icon { font-size: 62px; margin-bottom: 16px; }
    .hero h1 { font-size: 36px; font-weight: 700; color: #2D3436; margin-bottom: 12px; }
    .hero h1 span { color: #00B894; }
    .hero p {
      color: #636e72;
      font-size: 16px;
      max-width: 500px;
      margin: 0 auto 30px;
      line-height: 1.6;
    }
    .divider {
      width: 60px;
      height: 3px;
      background: #00B894;
      margin: 0 auto 50px;
      border-radius: 2px;
    }

    /* ── CARDS ── */
    .cards-wrapper {
      max-width: 900px;
      margin: 0 auto;
      padding: 0 24px 60px;
      flex: 1;
    }
    .cards {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }
    .cards-row {
      display: flex;
      gap: 20px;
      justify-content: flex-start;
    }
    .cards-row-center {
      justify-content: center;
    }
    .card {
      background: #ffffff;
      border: 1px solid #dfe6e9;
      border-radius: 12px;
      padding: 32px 20px 28px;
      text-align: center;
      text-decoration: none;
      color: #2D3436;
      transition: transform 0.2s, box-shadow 0.2s, border-color 0.2s;
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 12px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.06);
      width: calc(33.33% - 14px);
    }
    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 24px rgba(0,184,148,0.15);
      border-color: #00B894;
    }
    .card .card-icon {
      font-size: 32px;
      background: #f1f2f6;
      width: 66px;
      height: 66px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      border: 2px solid #dfe6e9;
      transition: border-color 0.2s, background 0.2s;
    }
    .card:hover .card-icon {
      border-color: #00B894;
      background: #e8fdf8;
    }
    .card .card-title {
      font-size: 15px;
      font-weight: 700;
      color: #2D3436;
    }
    .card .card-desc {
      font-size: 12px;
      color: #b2bec3;
      line-height: 1.5;
    }

    /* ── FOOTER ── */
    footer {
      text-align: center;
      padding: 16px;
      background: #2D3436;
      color: #b2bec3;
      font-size: 13px;
    }
    footer span { color: #00B894; }
  </style>
</head>
<body>

<!-- NAV -->
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

<!-- HERO -->
<div class="hero">
  <div class="icon">🏨</div>
  <h1>Hostel <span>Management</span> System</h1>
  <p>Efficiently manage student admissions, room allocations, and fee payments all in one place.</p>
  <div class="divider"></div>
</div>

<!-- CARDS -->
<div class="cards-wrapper">
  <div class="cards">

    <!-- Row 1: 3 cards -->
    <div class="cards-row">
      <a class="card" href="studentadd.jsp">
        <div class="card-icon">➕</div>
        <div class="card-title">Add Student</div>
        <div class="card-desc">Register new students and assign rooms</div>
      </a>
      <a class="card" href="StudentUpdate">
        <div class="card-icon">✏️</div>
        <div class="card-title">Update Student</div>
        <div class="card-desc">Modify existing student records</div>
      </a>
      <a class="card" href="studentdelete.jsp">
        <div class="card-icon">🗑️</div>
        <div class="card-title">Delete Student</div>
        <div class="card-desc">Remove student entries from the system</div>
      </a>
    </div>

    <!-- Row 2: 2 cards centered -->
    <div class="cards-row cards-row-center">
      <a class="card" href="DisplayStudentsServlet">
        <div class="card-icon">📋</div>
        <div class="card-title">View Students</div>
        <div class="card-desc">Browse and search all student records</div>
      </a>
      <a class="card" href="reports.jsp">
        <div class="card-icon">📊</div>
        <div class="card-title">Reports</div>
        <div class="card-desc">Generate fee, room and admission reports</div>
      </a>
    </div>

  </div>
</div>

<!-- FOOTER -->
<footer>
  &copy; 2024 <span>Hostel Management System</span> — All rights reserved
</footer>

</body>
</html>