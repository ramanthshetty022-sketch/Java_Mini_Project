package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import com.hostel.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class UpdateStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Student s  = null;
        String msg = null;

        // Check for flash message from session
        HttpSession session = req.getSession(false);
        if (session != null) {
            msg = (String) session.getAttribute("flashMessage");
            if (msg != null) session.removeAttribute("flashMessage");
        }

        String idParam = req.getParameter("studentID");
        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                s = new HostelDAO().getStudentById(Integer.parseInt(idParam.trim()));
                if (s == null) msg = "No student found with ID: " + idParam;
            } catch (Exception e) {
                msg = "Error: " + e.getMessage();
            }
        }

        req.setAttribute("student", s);
        req.setAttribute("message", msg);
        req.getRequestDispatcher("studentupdate.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String msg;
        boolean success = false;
        try {
            int id         = Integer.parseInt(req.getParameter("studentID").trim());
            String name    = req.getParameter("studentName").trim();
            String room    = req.getParameter("roomNumber").trim();
            Date admDate   = Date.valueOf(req.getParameter("admissionDate"));
            double paid    = Double.parseDouble(req.getParameter("feesPaid").trim());
            double pending = Double.parseDouble(req.getParameter("pendingFees").trim());

            if (paid < 0 || pending < 0) {
                msg = "Error: Fee amounts cannot be negative!";
            } else {
                Student s  = new Student(id, name, room, admDate, paid, pending);
                boolean ok = new HostelDAO().updateStudent(s);
                if (ok) {
                    success = true;
                    msg = "Student updated successfully!";
                } else {
                    msg = "Update failed — ID not found.";
                }
            }
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }

        if (success) {
            // PRG pattern — redirect to GET
            HttpSession session = req.getSession();
            session.setAttribute("flashMessage", msg);
            res.sendRedirect("StudentUpdate");
        } else {
            req.setAttribute("message", msg);
            req.getRequestDispatcher("studentupdate.jsp").forward(req, res);
        }
    }
}