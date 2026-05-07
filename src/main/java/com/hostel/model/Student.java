package com.hostel.model;

import java.sql.Date;

public class Student {
    private int studentID;
    private String studentName;
    private String roomNumber;
    private Date admissionDate;
    private double feesPaid;
    private double pendingFees;

    public Student() {}

    public Student(int studentID, String studentName, String roomNumber,
                   Date admissionDate, double feesPaid, double pendingFees) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.roomNumber = roomNumber;
        this.admissionDate = admissionDate;
        this.feesPaid = feesPaid;
        this.pendingFees = pendingFees;
    }

    public int getStudentID() { return studentID; }
    public void setStudentID(int v) { this.studentID = v; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String v) { this.studentName = v; }

    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String v) { this.roomNumber = v; }

    public Date getAdmissionDate() { return admissionDate; }
    public void setAdmissionDate(Date v) { this.admissionDate = v; }

    public double getFeesPaid() { return feesPaid; }
    public void setFeesPaid(double v) { this.feesPaid = v; }

    public double getPendingFees() { return pendingFees; }
    public void setPendingFees(double v) { this.pendingFees = v; }
}