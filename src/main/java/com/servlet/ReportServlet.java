package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;   // ⭐ ADD THIS
import com.dao.FeePaymentDAO;
import com.model.FeePayment;

@WebServlet("/ReportServlet")   // ⭐ ADD THIS
public class ReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");

            FeePaymentDAO dao = new FeePaymentDAO();
            List<FeePayment> list = dao.getReport(fromDate, toDate);

            request.setAttribute("reportList", list);

            RequestDispatcher rd = request.getRequestDispatcher("report_result.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}