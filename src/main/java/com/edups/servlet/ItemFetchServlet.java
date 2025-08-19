package com.edups.servlet;

import com.edups.model.Item;
import com.edups.service.ItemDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ItemFetchServlet")
public class ItemFetchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            int id = Integer.parseInt(idParam);
            ItemDAO dao = new ItemDAO();
            Item item = dao.getItemById(id);

            if (item != null) {
                // Manual JSON response
                String json = String.format("{\"id\":%d,\"name\":\"%s\",\"price\":%.2f}",
                        item.getId(), item.getName(), item.getPrice());
                out.write(json);
            } else {
                out.write("{\"error\":\"Item not found\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"error\":\"Exception occurred\"}");
        }
    }
}