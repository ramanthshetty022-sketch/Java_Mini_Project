package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import com.hostel.model.Student;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class AddStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HostelDAO dao = new HostelDAO();
        request.setAttribute("nextID", dao.getNextAutoIncrement());
        request.getRequestDispatcher("studentadd.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HostelDAO dao = new HostelDAO();
        try {
            String name = request.getParameter("studentName");
            String room = request.getParameter("roomNumber");
            Date date = Date.valueOf(request.getParameter("admissionDate"));
            double paid = Double.parseDouble(request.getParameter("feesPaid"));
            double pending = Double.parseDouble(request.getParameter("pendingFees"));

            if (paid < 0 || pending < 0) throw new IllegalArgumentException("Fees cannot be negative.");

            Student s = new Student(0, name, room, date, paid, pending);
            boolean ok = dao.addStudent(s);

            request.setAttribute("message", ok ? "Student added successfully!" : "Error: Could not add student.");
            request.setAttribute("msgType", ok ? "success" : "error");
        } catch (Exception e) {
            request.setAttribute("message", "Invalid input: " + e.getMessage());
            request.setAttribute("msgType", "error");
        }
        request.setAttribute("nextID", dao.getNextAutoIncrement());
        request.getRequestDispatcher("studentadd.jsp").forward(request, response);
    }
}