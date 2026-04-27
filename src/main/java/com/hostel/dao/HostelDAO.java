package com.hostel.dao;

import com.hostel.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HostelDAO {

    private static final String URL      = "jdbc:mysql://localhost:3306/hosteldb";
    private static final String USER     = "root";
    private static final String PASSWORD = "root";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // ── ADD — no StudentID, AUTO_INCREMENT handles it ────────────────────────
    public boolean addStudent(Student s) throws Exception {
        String sql = "INSERT INTO HostelStudents (StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setDate(3, s.getAdmissionDate());
            ps.setDouble(4, s.getFeesPaid());
            ps.setDouble(5, s.getPendingFees());
            return ps.executeUpdate() > 0;
        }
    }

    // ── GET NEXT AUTO INCREMENT ID — to show in readonly field ───────────────
    public int getNextAutoIncrementID() throws Exception {
        String sql = "SELECT AUTO_INCREMENT FROM information_schema.TABLES " +
                     "WHERE TABLE_SCHEMA = 'hosteldb' AND TABLE_NAME = 'HostelStudents'";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt("AUTO_INCREMENT");
        }
        return 1;
    }

    // ── UPDATE ───────────────────────────────────────────────────────────────
    public boolean updateStudent(Student s) throws Exception {
        String sql = "UPDATE HostelStudents SET StudentName=?, RoomNumber=?, " +
                     "AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setDate(3, s.getAdmissionDate());
            ps.setDouble(4, s.getFeesPaid());
            ps.setDouble(5, s.getPendingFees());
            ps.setInt(6, s.getStudentID());
            return ps.executeUpdate() > 0;
        }
    }

    // ── DELETE ───────────────────────────────────────────────────────────────
    public boolean deleteStudent(int id) throws Exception {
        String sql = "DELETE FROM HostelStudents WHERE StudentID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    // ── GET ONE ──────────────────────────────────────────────────────────────
    public Student getStudentById(int id) throws Exception {
        String sql = "SELECT * FROM HostelStudents WHERE StudentID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        }
        return null;
    }

    // ── GET ALL ──────────────────────────────────────────────────────────────
    public List<Student> getAllStudents() throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(mapRow(rs));
        }
        return list;
    }

    // ── REPORT 1: Pending Fees ────────────────────────────────────────────────
    public List<Student> getStudentsWithPendingFees() throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE PendingFees > 0";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(mapRow(rs));
        }
        return list;
    }

    // ── REPORT 2: By Room ─────────────────────────────────────────────────────
    public List<Student> getStudentsByRoom(String room) throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE RoomNumber=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, room);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        }
        return list;
    }

    // ── REPORT 3: By Date Range ───────────────────────────────────────────────
    public List<Student> getStudentsByDateRange(Date from, Date to) throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, from);
            ps.setDate(2, to);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        }
        return list;
    }

    // ── HELPER ───────────────────────────────────────────────────────────────
    private Student mapRow(ResultSet rs) throws SQLException {
        return new Student(
            rs.getInt("StudentID"),
            rs.getString("StudentName"),
            rs.getString("RoomNumber"),
            rs.getDate("AdmissionDate"),
            rs.getDouble("FeesPaid"),
            rs.getDouble("PendingFees")
        );
    }
}