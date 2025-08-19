package com.edups.servlet;

import com.edups.model.Bill;
import com.edups.model.BillItem;
import com.edups.service.BillDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/GenerateBillServlet")
public class GenerateBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");
        String[] itemIds = request.getParameterValues("itemId");
        String[] itemNames = request.getParameterValues("itemName");
        String[] quantities = request.getParameterValues("quantity");
        String[] prices = request.getParameterValues("price");

        List<BillItem> items = new ArrayList<>();
        double total = 0;

        for (int i = 0; i < itemIds.length; i++) {
            BillItem item = new BillItem();
            item.setItemId(Integer.parseInt(itemIds[i]));
            item.setItemName(itemNames[i]);
            item.setQuantity(Integer.parseInt(quantities[i]));
            item.setPrice(Double.parseDouble(prices[i]));
            total += item.getQuantity() * item.getPrice();
            items.add(item);
        }

        Bill bill = new Bill();
        bill.setAccountNumber(accountNumber);
        bill.setTotalAmount(total);
        bill.setItems(items);

        try {
            int billId = new BillDAO().saveBill(bill);
            response.sendRedirect("BillSuccess.jsp?bill_Id=" + billId);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}