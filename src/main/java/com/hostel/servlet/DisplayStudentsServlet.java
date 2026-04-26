package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import com.hostel.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


public class DisplayStudentsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            String idParam = req.getParameter("studentID");
            if (idParam != null && !idParam.trim().isEmpty()) {
                Student s = new HostelDAO().getStudentById(Integer.parseInt(idParam.trim()));
                if (s != null) {
                    req.setAttribute("students", List.of(s));
                } else {
                    req.setAttribute("message", "No student found with ID: " + idParam);
                }
            } else {
                List<Student> list = new HostelDAO().getAllStudents();
                req.setAttribute("students", list);
            }
        } catch (Exception e) {
            req.setAttribute("message", "Error: " + e.getMessage());
        }
        req.getRequestDispatcher("studentdisplay.jsp").forward(req, res);
    }
}