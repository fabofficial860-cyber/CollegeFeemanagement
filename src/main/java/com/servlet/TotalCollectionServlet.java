package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.dao.FeePaymentDAO;

@WebServlet("/TotalCollectionServlet")
public class TotalCollectionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String from = req.getParameter("fromDate");
            String to = req.getParameter("toDate");

            FeePaymentDAO dao = new FeePaymentDAO();
            double total = dao.getTotalCollection(from, to);

            req.setAttribute("total", total);

            RequestDispatcher rd = req.getRequestDispatcher("total_result.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}