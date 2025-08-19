// File: com/edups/servlet/EmployeeServlet.java
package com.edups.servlet;

import com.edups.model.Employee;
import com.edups.service.EmployeeDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        EmployeeDAO dao = new EmployeeDAO();
        String action = req.getParameter("action");

        try {
            if ("add".equals(action)) {
                dao.addEmployee(new Employee(
                    req.getParameter("id"),
                    req.getParameter("name"),
                    req.getParameter("email"),
                    req.getParameter("password")
                ));
                resp.sendRedirect("EmployeeList.jsp");

            } else if ("update".equals(action)) {
                dao.updateEmployee(new Employee(
                    req.getParameter("id"),
                    req.getParameter("name"),
                    req.getParameter("email"),
                    req.getParameter("password")
                ));
                resp.sendRedirect("EmployeeList.jsp");

            } else if ("delete".equals(action)) {
                dao.deleteEmployee(req.getParameter("id"));
                resp.sendRedirect("EmployeeList.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            Employee emp = new EmployeeDAO().getEmployeeById(id);
            req.setAttribute("employee", emp);
            req.getRequestDispatcher("EditEmployee.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
