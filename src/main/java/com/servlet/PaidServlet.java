package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;

@WebServlet("/PaidServlet")
public class PaidServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        FeePaymentDAO dao = new FeePaymentDAO();

        List<FeePayment> list = dao.getPaidStudents();

        req.setAttribute("reportList", list);

        req.getRequestDispatcher("report_result.jsp").forward(req, res);
    }
}