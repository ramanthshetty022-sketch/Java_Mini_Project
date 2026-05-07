package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("studentID"));
            boolean ok = new HostelDAO().deleteStudent(id);
            request.setAttribute("message", ok ? "Student deleted successfully!" : "Student ID not found.");
            request.setAttribute("msgType", ok ? "success" : "error");
        } catch (Exception e) {
            request.setAttribute("message", "Invalid Student ID.");
            request.setAttribute("msgType", "error");
        }
        request.getRequestDispatcher("studentdelete.jsp").forward(request, response);
    }
}