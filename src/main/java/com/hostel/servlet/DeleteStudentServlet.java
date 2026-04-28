package com.hostel.servlet;

import com.hostel.dao.HostelDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String msg;
        boolean success = false;
        try {
            int id     = Integer.parseInt(req.getParameter("studentID").trim());
            boolean ok = new HostelDAO().deleteStudent(id);
            if (ok) {
                success = true;
                msg = "Student with ID " + id + " deleted successfully!";
            } else {
                msg = "No student found with ID: " + id;
            }
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }

        if (success) {
            // PRG pattern
            HttpSession session = req.getSession();
            session.setAttribute("flashMessage", msg);
            res.sendRedirect("studentdelete.jsp");
        } else {
            req.setAttribute("message", msg);
            req.getRequestDispatcher("studentdelete.jsp").forward(req, res);
        }
    }
}