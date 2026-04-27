package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import com.dao.*;

@WebServlet("/DeleteFeePaymentServlet")
public class DeleteFeePaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("paymentId"));

            FeePaymentDAO dao = new FeePaymentDAO();
            dao.deletePayment(id);

            response.sendRedirect("DisplayFeePaymentsServlet");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}