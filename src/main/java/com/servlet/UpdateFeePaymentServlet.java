package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import com.dao.*;
import com.model.*;

@WebServlet("/UpdateFeePaymentServlet")
public class UpdateFeePaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int paymentId = Integer.parseInt(request.getParameter("paymentId"));
            String name = request.getParameter("studentName");
            double amount = Double.parseDouble(request.getParameter("amount"));
            String status = request.getParameter("status");

            FeePayment fp = new FeePayment();
            fp.setPaymentId(paymentId);
            fp.setStudentName(name);
            fp.setAmount(amount);
            fp.setStatus(status);
            fp.setFeeType(request.getParameter("feeType")); // ✅ MUST

            
            FeePaymentDAO dao = new FeePaymentDAO();
            dao.updatePayment(fp);

            response.sendRedirect("DisplayFeePaymentsServlet");
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}