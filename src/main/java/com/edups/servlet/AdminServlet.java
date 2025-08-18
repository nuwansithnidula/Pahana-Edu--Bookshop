// File: com/edups/servlet/AdminServlet.java
package com.edups.servlet;

import com.edups.model.Admin;
import com.edups.service.AdminService;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/AdminServlet")
@MultipartConfig
public class AdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        AdminService service = new AdminService();
        String action = req.getParameter("action");

        try {
            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            Part filePart = req.getPart("fileName");

            String fileName = handleUpload(req, filePart);

            Admin admin = new Admin();
            if (id != null && !id.isEmpty()) admin.setId(Integer.parseInt(id));
            admin.setName(name);
            admin.setEmail(email);
            admin.setPassword(password);

            // If fileName is uploaded, use it. Otherwise, keep the old one (for update)
            if (fileName != null) {
                admin.setFileName(fileName);
            } else if ("update".equals(action)) {
                Admin existing = service.getAdmin(Integer.parseInt(id));
                admin.setFileName(existing != null ? existing.getFileName() : "default.png");
            } else {
                admin.setFileName("default.png");
            }

            switch (action) {
                case "add":
                    service.createAdmin(admin);
                    break;
                case "update":
                    service.updateAdmin(admin);
                    break;
                case "delete":
                    service.deleteAdmin(Integer.parseInt(id));
                    break;
            }

            resp.sendRedirect("admin/ManageAdmins.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Admin admin = new AdminService().getAdmin(id);
            req.setAttribute("admin", admin);
            req.getRequestDispatcher("admin/EditAdmin.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }

    private String handleUpload(HttpServletRequest req, Part part) throws IOException {
        if (part != null && part.getSize() > 0) {
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String uploadDir = req.getServletContext().getRealPath("/admin/pictures");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            File file = new File(dir, fileName);
            part.write(file.getAbsolutePath());

            return fileName;
        }
        return null;
    }
}