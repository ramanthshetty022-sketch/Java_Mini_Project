package com.hostel.dao;

import com.hostel.model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HostelDAO {

    private static final String URL  = "jdbc:mysql://localhost:3306/hostel_db";
    private static final String USER = "root";
    private static final String PASS = "root";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }

    public int getNextAutoIncrement() {
        String sql = "SELECT IFNULL(MAX(StudentID), 0) + 1 AS nextID FROM HostelStudents";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt("nextID");
        } catch (Exception e) { e.printStackTrace(); }
        return 1;
    }

    public boolean addStudent(Student s) {
        String sql = "INSERT INTO HostelStudents (StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) "
                   + "VALUES (?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setDate(3, s.getAdmissionDate());
            ps.setDouble(4, s.getFeesPaid());
            ps.setDouble(5, s.getPendingFees());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }

    public boolean updateStudent(Student s) {
        String sql = "UPDATE HostelStudents SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? "
                   + "WHERE StudentID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setDate(3, s.getAdmissionDate());
            ps.setDouble(4, s.getFeesPaid());
            ps.setDouble(5, s.getPendingFees());
            ps.setInt(6, s.getStudentID());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }

    public boolean deleteStudent(int id) {
        String sql = "DELETE FROM HostelStudents WHERE StudentID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }

    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(mapRow(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public Student getStudentById(int id) {
        String sql = "SELECT * FROM HostelStudents WHERE StudentID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public List<Student> getStudentsByRoom(String room) {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE RoomNumber LIKE ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + room + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public List<Student> getStudentsByDateRange(Date from, Date to) {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, from);
            ps.setDate(2, to);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public List<Student> getStudentsWithPendingFees() {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE PendingFees > 0";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(mapRow(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

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