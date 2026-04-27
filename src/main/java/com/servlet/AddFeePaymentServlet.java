package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;

@WebServlet("/AddFeePaymentServlet")
public class AddFeePaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 🔹 Get form values
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            String studentName = request.getParameter("studentName");
            String paymentDate = request.getParameter("paymentDate");
            String status = request.getParameter("status");
            
            double amount = Double.parseDouble(request.getParameter("amount"));

            if (amount < 0) {
                response.getWriter().println("Amount cannot be negative");
                return;
            }

            // ✅ IMPORTANT (MOST MISSED LINE)
            String feeType = request.getParameter("feeType");

            // 🔹 Set model
            FeePayment fp = new FeePayment();
            fp.setStudentId(studentId);
            fp.setStudentName(studentName);
            fp.setPaymentDate(paymentDate);
            fp.setAmount(amount);
            fp.setStatus(status);
            fp.setFeeType(feeType); // ✅ MUST

            // 🔹 Save to DB
            FeePaymentDAO dao = new FeePaymentDAO();
            dao.addPayment(fp);

            // 🔹 Redirect
            response.sendRedirect("DisplayFeePaymentsServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}