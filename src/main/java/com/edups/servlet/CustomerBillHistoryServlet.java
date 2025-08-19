package com.edups.servlet;

import com.edups.model.Bill;
import com.edups.service.BillDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/CustomerBillHistoryServlet")
public class CustomerBillHistoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");

        try {
            BillDAO billDAO = new BillDAO();
            List<Bill> bills = billDAO.getBillsByAccount(accountNumber);

            request.setAttribute("bills", bills);
            request.setAttribute("accountNumber", accountNumber);
            request.getRequestDispatcher("CustomerBillHistory.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error retrieving bill history: " + e.getMessage());
        }
    }
}