package com.edups.servlet;

import com.edups.model.Employee;
import com.edups.service.EmployeeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/EmployeeLoginServlet")
public class EmployeeLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            EmployeeDAO dao = new EmployeeDAO();
            Employee emp = dao.getEmployeeByEmail(email);

            if (emp != null && emp.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("employee", emp);
                response.sendRedirect("EmployeeDashboard.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("EmployeeLogin.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("EmployeeLogin.jsp").forward(request, response);
        }
    }
}