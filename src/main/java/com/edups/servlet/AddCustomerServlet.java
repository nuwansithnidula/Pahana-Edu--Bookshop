// File: com/edups/servlet/AddCustomerServlet.java
package com.edups.servlet;

import com.edups.model.customer;
import com.edups.service.customerDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "AddCustomerServlet", urlPatterns = {"/AddCustomerServlet"})
 public class AddCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String accountNumber = request.getParameter("accountNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        customerDAO dao = new customerDAO();

        try {
            if ("add".equalsIgnoreCase(action)) {
                customer customerObj = new customer(accountNumber, name, address, phone, email);
                dao.addCustomer(customerObj);
                response.sendRedirect("CustomerDetails.jsp");
            } else if ("update".equalsIgnoreCase(action)) {
                customer updatedCustomer = new customer(accountNumber, name, address, phone, email);
                dao.updateCustomer(updatedCustomer);
                response.sendRedirect("CustomerDetails.jsp");
            } else {
                response.getWriter().println("<h3>Invalid action specified</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String accountNumber = request.getParameter("accountNumber");
        customerDAO dao = new customerDAO();

        try {
            if ("delete".equalsIgnoreCase(action) && accountNumber != null) {
                dao.deleteCustomer(accountNumber);
                response.sendRedirect("CustomerDetails.jsp");
            } else if ("edit".equalsIgnoreCase(action) && accountNumber != null) {
                customer c = dao.getCustomerByAccountNumber(accountNumber);
                request.setAttribute("customer", c);
                request.getRequestDispatcher("EditCustomer.jsp").forward(request, response);
            } else {
                response.sendRedirect("AddCustomer.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}