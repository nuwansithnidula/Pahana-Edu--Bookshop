package com.edups.servlet;

import com.edups.model.Item;
import com.edups.service.ItemDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ItemServlet")
public class ItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ItemDAO dao = new ItemDAO();

        try {
            if ("add".equals(action)) {
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                dao.addItem(new Item(0, name, price, quantity));
                response.sendRedirect("ItemList.jsp");

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                dao.updateItem(new Item(id, name, price, quantity));
                response.sendRedirect("ItemList.jsp");

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.deleteItem(id);
                response.sendRedirect("ItemList.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ItemDAO dao = new ItemDAO();

        try {
            if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.deleteItem(id);
                response.sendRedirect("ItemList.jsp");

            } else if (request.getParameter("id") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                Item item = dao.getItemById(id);
                request.setAttribute("item", item);
                request.getRequestDispatcher("EditItem.jsp").forward(request, response);
            } else {
                response.sendRedirect("ItemList.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}