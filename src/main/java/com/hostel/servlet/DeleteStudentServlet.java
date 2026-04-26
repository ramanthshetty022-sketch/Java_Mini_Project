package com.hostel.servlet;

import com.hostel.dao.HostelDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String msg;
        try {
            int id     = Integer.parseInt(req.getParameter("studentID").trim());
            boolean ok = new HostelDAO().deleteStudent(id);
            msg = ok ? "Student deleted successfully!" : "No student found with that ID.";
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }

        req.setAttribute("message", msg);
        req.getRequestDispatcher("studentdelete.jsp").forward(req, res);
    }
}