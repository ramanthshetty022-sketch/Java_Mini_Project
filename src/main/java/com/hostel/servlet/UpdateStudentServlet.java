package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import com.hostel.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class UpdateStudentServlet extends HttpServlet {

    // GET: load existing data into the form
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String msg = null;
        Student s  = null;
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

    // POST: save updated data
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String msg;
        try {
            int id         = Integer.parseInt(req.getParameter("studentID").trim());
            String name    = req.getParameter("studentName").trim();
            String room    = req.getParameter("roomNumber").trim();
            Date admDate   = Date.valueOf(req.getParameter("admissionDate"));
            double paid    = Double.parseDouble(req.getParameter("feesPaid").trim());
            double pending = Double.parseDouble(req.getParameter("pendingFees").trim());

            Student s = new Student(id, name, room, admDate, paid, pending);
            boolean ok = new HostelDAO().updateStudent(s);
            msg = ok ? "Student updated successfully!" : "Update failed — ID not found.";
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }

        req.setAttribute("message", msg);
        req.getRequestDispatcher("studentupdate.jsp").forward(req, res);
    }
}