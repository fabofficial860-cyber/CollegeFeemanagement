package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;

@WebServlet("/OverdueServlet")
public class OverdueServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            FeePaymentDAO dao = new FeePaymentDAO();

            List<FeePayment> list = dao.getOverduePayments();

            req.setAttribute("reportList", list);

            RequestDispatcher rd = req.getRequestDispatcher("report_result.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}