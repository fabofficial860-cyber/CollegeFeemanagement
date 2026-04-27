package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;

@WebServlet("/DisplayFeePaymentsServlet")
public class DisplayFeePaymentsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            FeePaymentDAO dao = new FeePaymentDAO();

            // Fetch records
            List<FeePayment> list = dao.getAllPayments();

            // Send to JSP
            req.setAttribute("paymentList", list);

            // Forward to display page
            RequestDispatcher rd = req.getRequestDispatcher("feepaymentdisplay.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();

            // Show error on browser (helps in viva/debug)
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}