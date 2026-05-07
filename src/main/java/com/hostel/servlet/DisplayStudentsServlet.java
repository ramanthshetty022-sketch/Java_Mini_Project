package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import com.hostel.model.Student;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DisplayStudentsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Student> students = new HostelDAO().getAllStudents();
        request.setAttribute("students", students);
        request.getRequestDispatcher("studentdisplay.jsp").forward(request, response);
    }
}