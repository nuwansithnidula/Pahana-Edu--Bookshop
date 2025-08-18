package com.edups.servlet;

import com.edups.model.Admin;
import com.edups.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin/login") // Matches form action
public class AdminLoginServlet extends HttpServlet {
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        adminService = new AdminService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to login page
        response.sendRedirect(request.getContextPath() + "/admin/AdminLogin.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username"); // MATCHES form field
        String password = request.getParameter("password");

        Admin admin = adminService.getAdminByEmail(username); // treating email as login

        if (admin != null && admin.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid credentials");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/AdminLogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}
