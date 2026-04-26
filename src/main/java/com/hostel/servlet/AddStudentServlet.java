package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import com.hostel.model.Student;

import javax.servlet.*;

import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String msg;
        try {
            int id          = Integer.parseInt(req.getParameter("studentID").trim());
            String name     = req.getParameter("studentName").trim();
            String room     = req.getParameter("roomNumber").trim();
            Date admDate    = Date.valueOf(req.getParameter("admissionDate"));
            double paid     = Double.parseDouble(req.getParameter("feesPaid").trim());
            double pending  = Double.parseDouble(req.getParameter("pendingFees").trim());

            Student s = new Student(id, name, room, admDate, paid, pending);
            boolean ok = new HostelDAO().addStudent(s);
            msg = ok ? "Student added successfully!" : "Failed to add student.";
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }

        req.setAttribute("message", msg);
        req.getRequestDispatcher("studentadd.jsp").forward(req, res);
    }
}