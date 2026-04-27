package com.dao;

import java.sql.*;
import java.util.*;
import com.model.FeePayment;

public class FeePaymentDAO {

    // 🔹 ADD PAYMENT (UPDATED WITH FEETYPE)
    public void addPayment(FeePayment fp) {
        try (Connection con = DBConnection.getConnection()) {

            String query = "INSERT INTO FeePayments(StudentID, StudentName, PaymentDate, Amount, Status, FeeType) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, fp.getStudentId());
            ps.setString(2, fp.getStudentName());
            ps.setString(3, fp.getPaymentDate());
            ps.setDouble(4, fp.getAmount());
            ps.setString(5, fp.getStatus());
            ps.setString(6, fp.getFeeType()); // ✅ ADDED

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 🔹 DISPLAY ALL PAYMENTS (UPDATED WITH FEETYPE)
    public List<FeePayment> getAllPayments() {
        List<FeePayment> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM FeePayments");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                FeePayment fp = new FeePayment();

                fp.setPaymentId(rs.getInt("PaymentID"));
                fp.setStudentId(rs.getInt("StudentID"));
                fp.setStudentName(rs.getString("StudentName"));
                fp.setPaymentDate(rs.getDate("PaymentDate").toString());
                fp.setAmount(rs.getDouble("Amount"));
                fp.setStatus(rs.getString("Status"));
                fp.setFeeType(rs.getString("FeeType")); // ✅ ADDED

                list.add(fp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 🔹 UPDATE PAYMENT (UPDATED WITH FEETYPE)
    public void updatePayment(FeePayment fp) {
        try (Connection con = DBConnection.getConnection()) {

        	String query = "UPDATE FeePayments SET StudentName=?, Amount=?, Status=?, FeeType=? WHERE PaymentID=?";
        	PreparedStatement ps = con.prepareStatement(query);

        	ps.setString(1, fp.getStudentName());
        	ps.setDouble(2, fp.getAmount());
        	ps.setString(3, fp.getStatus());
        	ps.setString(4, fp.getFeeType());
        	ps.setInt(5, fp.getPaymentId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 🔹 DELETE PAYMENT
    public void deletePayment(int id) {
        try (Connection con = DBConnection.getConnection()) {

            String query = "DELETE FROM FeePayments WHERE PaymentID=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 🔹 DATE RANGE REPORT
    public List<FeePayment> getReport(String from, String to) {
        List<FeePayment> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT * FROM FeePayments WHERE PaymentDate BETWEEN ? AND ?");
        ) {

            ps.setString(1, from);
            ps.setString(2, to);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FeePayment fp = new FeePayment();

                fp.setStudentName(rs.getString("StudentName"));
                fp.setAmount(rs.getDouble("Amount"));
                fp.setStatus(rs.getString("Status"));
                fp.setFeeType(rs.getString("FeeType")); // ✅ ADDED

                list.add(fp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 🔹 PAID STUDENTS
    public List<FeePayment> getPaidStudents() {
        List<FeePayment> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT * FROM FeePayments WHERE LOWER(Status)='paid'");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                FeePayment fp = new FeePayment();

                fp.setStudentName(rs.getString("StudentName"));
                fp.setAmount(rs.getDouble("Amount"));
                fp.setStatus(rs.getString("Status"));
                fp.setFeeType(rs.getString("FeeType")); // ✅ ADDED

                list.add(fp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 🔹 OVERDUE PAYMENTS
    public List<FeePayment> getOverduePayments() {
        List<FeePayment> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT * FROM FeePayments WHERE LOWER(Status)='overdue'");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                FeePayment fp = new FeePayment();

                fp.setStudentName(rs.getString("StudentName"));
                fp.setAmount(rs.getDouble("Amount"));
                fp.setStatus(rs.getString("Status"));
                fp.setFeeType(rs.getString("FeeType")); // ✅ ADDED

                list.add(fp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 🔹 TOTAL COLLECTION
    public double getTotalCollection(String from, String to) {
        double total = 0;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT SUM(Amount) FROM FeePayments WHERE PaymentDate BETWEEN ? AND ?");
        ) {

            ps.setString(1, from);
            ps.setString(2, to);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                total = rs.getDouble(1);
                if (rs.wasNull()) {
                    total = 0;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }
}