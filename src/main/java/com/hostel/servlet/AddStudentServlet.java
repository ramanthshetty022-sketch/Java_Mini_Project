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
            req.setAttribute("nextID", 1);
        }
        req.setAttribute("message", null);
        req.getRequestDispatcher("studentadd.jsp").forward(req, res);
    }

    // POST — save student then REDIRECT to GET (prevents double submit)
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String msg;
        boolean success = false;
        try {
            String name    = req.getParameter("studentName").trim();
            String room    = req.getParameter("roomNumber").trim();
            String dateStr = req.getParameter("admissionDate");
            String paidStr = req.getParameter("feesPaid").trim();
            String pendStr = req.getParameter("pendingFees").trim();

            // Server side validation
            if (name.isEmpty() || room.isEmpty() || dateStr.isEmpty()
                    || paidStr.isEmpty() || pendStr.isEmpty()) {
                msg = "Error: All fields are required.";
            } else {
                double paid    = Double.parseDouble(paidStr);
                double pending = Double.parseDouble(pendStr);

                if (paid < 0 || pending < 0) {
                    msg = "Error: Fee amounts cannot be negative!";
                } else {
                    Date admDate = Date.valueOf(dateStr);
                    Student s = new Student(0, name, room, admDate, paid, pending);
                    boolean ok = new HostelDAO().addStudent(s);
                    if (ok) {
                        success = true;
                        msg = "Student added successfully!";
                    } else {
                        msg = "Failed to add student. Please try again.";
                    }
                }
            }
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }

        // POST-REDIRECT-GET: redirect after success to prevent double submit on refresh
        if (success) {
            HttpSession session = req.getSession();
            session.setAttribute("flashMessage", msg);
            res.sendRedirect("AddStudentServlet");
        } else {
            // On error: stay on form and show error
            try {
                req.setAttribute("nextID", new HostelDAO().getNextAutoIncrementID());
            } catch (Exception e) {
                req.setAttribute("nextID", 1);
            }
            req.setAttribute("message", msg);
            req.getRequestDispatcher("studentadd.jsp").forward(req, res);
        }
    }
}