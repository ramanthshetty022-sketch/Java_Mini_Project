package com.hostel.servlet;

import com.hostel.dao.HostelDAO;
import com.hostel.model.Student;

import javax.servlet.*;

import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

public class ReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String type = req.getParameter("reportType");
        List<Student> results = null;
        String msg = null;

        try {
            HostelDAO dao = new HostelDAO();
            switch (type) {
                case "pending":
                    results = dao.getStudentsWithPendingFees();
                    break;
                case "room":
                    String room = req.getParameter("roomNumber").trim();
                    results = dao.getStudentsByRoom(room);
                    break;
                case "daterange":
                    Date from = Date.valueOf(req.getParameter("fromDate"));
                    Date to   = Date.valueOf(req.getParameter("toDate"));
                    results   = dao.getStudentsByDateRange(from, to);
                    break;
                default:
                    msg = "Unknown report type.";
            }
            if (results != null && results.isEmpty()) msg = "No records found.";
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }

        req.setAttribute("results", results);
        req.setAttribute("message", msg);
        req.setAttribute("reportType", type);
        req.getRequestDispatcher("report_result.jsp").forward(req, res);
    }
}