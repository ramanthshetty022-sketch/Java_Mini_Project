package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import com.hostel.model.Student;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class UpdateStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("studentID");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                Student s = new HostelDAO().getStudentById(Integer.parseInt(idStr));
                if (s != null) {
                    request.setAttribute("student", s);
                } else {
                    request.setAttribute("message", "Student ID not found.");
                    request.setAttribute("msgType", "error");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid Student ID.");
                request.setAttribute("msgType", "error");
            }
        }
        request.getRequestDispatcher("studentupdate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("studentID"));
            String name = request.getParameter("studentName");
            String room = request.getParameter("roomNumber");
            Date date = Date.valueOf(request.getParameter("admissionDate"));
            double paid = Double.parseDouble(request.getParameter("feesPaid"));
            double pending = Double.parseDouble(request.getParameter("pendingFees"));

            if (paid < 0 || pending < 0) throw new IllegalArgumentException("Fees cannot be negative.");

            boolean ok = new HostelDAO().updateStudent(
                    new Student(id, name, room, date, paid, pending));

            request.setAttribute("message", ok ? "Student updated successfully!" : "Error updating student.");
            request.setAttribute("msgType", ok ? "success" : "error");
        } catch (Exception e) {
            request.setAttribute("message", "Invalid input: " + e.getMessage());
            request.setAttribute("msgType", "error");
        }
        request.getRequestDispatcher("studentupdate.jsp").forward(request, response);
    }
}