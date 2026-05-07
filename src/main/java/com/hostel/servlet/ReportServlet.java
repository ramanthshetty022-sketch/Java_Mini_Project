package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import com.hostel.model.Student;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

public class ReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("reportType");
        HostelDAO dao = new HostelDAO();
        List<Student> students = null;
        String title = "";

        try {
            if ("pendingFees".equals(type)) {
                students = dao.getStudentsWithPendingFees();
                title = "Students with Pending Fees";
            } else if ("room".equals(type)) {
                String room = request.getParameter("roomNumber");
                students = dao.getStudentsByRoom(room);
                title = "Students in Room: " + room;
            } else if ("dateRange".equals(type)) {
                Date from = Date.valueOf(request.getParameter("fromDate"));
                Date to = Date.valueOf(request.getParameter("toDate"));
                students = dao.getStudentsByDateRange(from, to);
                title = "Students Admitted from " + from + " to " + to;
            }
        } catch (Exception e) {
            request.setAttribute("message", "Invalid input: " + e.getMessage());
            request.setAttribute("msgType", "error");
        }

        request.setAttribute("students", students);
        request.setAttribute("reportTitle", title);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}