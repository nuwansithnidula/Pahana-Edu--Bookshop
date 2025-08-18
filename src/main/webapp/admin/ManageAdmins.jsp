<%@ page import="java.util.List" %>
<%@ page import="com.edups.model.Admin" %>
<%@ page import="com.edups.service.AdminService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Admins - PahanaEdu-Book-Shop</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #f8e6d2, #fcebd6);
        }
        .container {
            max-width: 1100px;
            margin: 60px auto;
            background: #fff3e0;
            padding: 24px 28px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.10);
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            margin-bottom: 16px;
        }
        h2 {
            margin: 0;
            font-size: 28px;
            color: #d35400;
        }
        a.button, button.button, input.button {
            padding: 10px 14px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        a.button:hover, button.button:hover, input.button:hover {
            background-color: #45a049;
        }
        .delete-button {
            background-color: #f44336 !important;
        }
        .delete-button:hover {
            background-color: #d32f2f !important;
        }
        .table-wrap {
            overflow-x: auto;
            margin-top: 10px;
        }
        table {
            width: 100%;
            min-width: 800px;
            border-collapse: collapse;
            margin-top: 10px;
            background: white;
        }
        table, th, td {
            border: 1px solid #eee;
        }
        th {
            background-color: #f57c00;
            color: white;
        }
        th, td {
            padding: 10px 12px;
            text-align: left;
        }
        .actions {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .flash {
            padding: 10px 12px;
            border-radius: 6px;
            margin: 12px 0 6px;
            font-size: 14px;
        }
        .flash.success {
            background: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #c8e6c9;
        }
        .flash.error {
            background: #ffebee;
            color: #c62828;
            border: 1px solid #ffcdd2;
        }
        .toolbar {
            display: flex;
            gap: 10px;
        }
        .photo {
            width: 60px; height: 60px; object-fit: cover; border-radius: 6px; border: 1px solid #eee;
        }
        .no-photo {
            display: inline-flex; align-items: center; justify-content: center;
            width: 60px; height: 60px; border-radius: 6px; border: 1px dashed #ccc; color: #777; font-size: 12px;
            background: #fafafa;
        }
        .empty-row {
            text-align: center; color: #666; font-style: italic;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2>Admin Management</h2>
        <div class="toolbar">
            <a href="<%=request.getContextPath()%>/admin/AddAdmin.jsp" class="button">Add New Admin</a>
        </div>
    </div>

    <%
        // Flash messages (optional): set request attributes "success" or "error" in your servlet
        String success = (String) request.getAttribute("success");
        String error   = (String) request.getAttribute("error");
        if (success != null) {
    %>
        <div class="flash success"><%= success %></div>
    <%
        }
        if (error != null) {
    %>
        <div class="flash error"><%= error %></div>
    <%
        }

        AdminService service = new AdminService();
        List<Admin> adminList = service.getAllAdmins();
        String ctx = request.getContextPath();
    %>

    <div class="table-wrap">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Photo</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    
                </tr>
            </thead>
            <tbody>
            <%
                if (adminList == null || adminList.isEmpty()) {
            %>
                <tr>
                    <td colspan="6" class="empty-row">No admins found.</td>
                </tr>
            <%
                } else {
                    for (Admin admin : adminList) {
                        String fileName = admin.getFileName();
                        boolean hasPhoto = (fileName != null && !fileName.trim().isEmpty());
                        String imgSrc = ctx + "/admin/pictures/" + (hasPhoto ? fileName : "");
            %>
                <tr>
                    <td><%= admin.getId() %></td>
                    <td>
                        <%
                            if (hasPhoto) {
                        %>
                            <img class="photo" src="<%= imgSrc %>" alt="photo">
                        <%
                            } else {
                        %>
                            <span class="no-photo">No photo</span>
                        <%
                            }
                        %>
                    </td>
                    <td><%= admin.getName() %></td>
                    <td><%= admin.getEmail() %></td>
                    <td><%= admin.getPassword() %></td>
                    <td>
                       
                    </td>
                </tr>
            <%
                    } // end for
                } // end else
            %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
