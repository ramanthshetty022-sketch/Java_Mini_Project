package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import com.hostel.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class AddStudentServlet extends HttpServlet {

    // GET — load page with next auto increment ID
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            int nextID = new HostelDAO().getNextAutoIncrementID();
            req.setAttribute("nextID", nextID);
        } catch (Exception e) {
            req.setAttribute("nextID", "Auto");
        }
        req.getRequestDispatcher("studentadd.jsp").forward(req, res);
    }

    // POST — save student
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String msg;
        try {
            String name    = req.getParameter("studentName").trim();
            String room    = req.getParameter("roomNumber").trim();
            Date admDate   = Date.valueOf(req.getParameter("admissionDate"));
            double paid    = Double.parseDouble(req.getParameter("feesPaid").trim());
            double pending = Double.parseDouble(req.getParameter("pendingFees").trim());

            // Negative value check on server side too
            if (paid < 0 || pending < 0) {
                msg = "Error: Fee amounts cannot be negative!";
            } else {
                Student s = new Student(0, name, room, admDate, paid, pending);
                boolean ok = new HostelDAO().addStudent(s);
                msg = ok ? "Student added successfully!" : "Failed to add student.";
            }
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }

        try {
            int nextID = new HostelDAO().getNextAutoIncrementID();
            req.setAttribute("nextID", nextID);
        } catch (Exception e) {
            req.setAttribute("nextID", "Auto");
        }

        req.setAttribute("message", msg);
        req.getRequestDispatcher("studentadd.jsp").forward(req, res);
    }
}