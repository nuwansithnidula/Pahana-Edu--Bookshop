<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.edups.model.Employee, com.edups.service.EmployeeDAO" %>
<%
    EmployeeDAO dao = new EmployeeDAO();
    List<Employee> employeeList = dao.getAllEmployees();
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List - PahanaEdu-Book-Shop</title>
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
        a.btn, .btn, input.btn {
            display: inline-block;
            padding: 10px 14px;
            text-decoration: none;
            border-radius: 6px;
            color: #fff;
            font-size: 14px;
            border: none;
            cursor: pointer;
        }
        .add-btn { background-color: #007bff; }
        .add-btn:hover { background-color: #0069d9; }
        .edit-btn { background-color: #28a745; }
        .edit-btn:hover { background-color: #218838; }
        .delete-btn { background-color: #dc3545; }
        .delete-btn:hover { background-color: #c82333; }

        /* Flash messages */
        .flash {
            padding: 10px 12px;
            border-radius: 6px;
            margin: 12px 0;
            font-size: 14px;
        }
        .flash.success { background: #e8f5e9; color: #2e7d32; border: 1px solid #c8e6c9; }
        .flash.error   { background: #ffebee; color: #c62828; border: 1px solid #ffcdd2; }

        .table-wrap { overflow-x: auto; margin-top: 10px; }
        table {
            width: 100%;
            min-width: 800px;
            border-collapse: collapse;
            background: #ffffff;
        }
        th, td {
            padding: 10px 12px;
            border: 1px solid #eee;
            text-align: left;
        }
        th {
            background-color: #f57c00;
            color: white;
        }
        .actions {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            align-items: center;
        }
        .empty-row {
            text-align: center;
            color: #666;
            font-style: italic;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2>Manage Employees</h2>
        <a href="<%= ctx %>/AddEmployee.jsp" class="btn add-btn">+ Add New Employee</a>
    </div>

    <!-- Flash / Error Messages (set in your servlet via request.setAttribute("success"/"error", "...")) -->
    <%
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
    %>

    <div class="table-wrap">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Password</th>
                <th style="width:220px;">Actions</th>
            </tr>
            <%
                if (employeeList == null || employeeList.isEmpty()) {
            %>
                <tr>
                    <td colspan="5" class="empty-row">No employees found.</td>
                </tr>
            <%
                } else {
                    for (Employee emp : employeeList) {
            %>
            <tr>
                <td><%= emp.getId() %></td>
                <td><%= emp.getName() %></td>
                <td><%= emp.getEmail() %></td>
                <td><%= emp.getPassword() %></td>
                <td>
                    <div class="actions">
                        <a class="btn edit-btn" href="<%= ctx %>/EmployeeServlet?id=<%= emp.getId() %>">Edit</a>
                        <form action="<%= ctx %>/EmployeeServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure?');">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= emp.getId() %>">
                            <input type="submit" value="Delete" class="btn delete-btn">
                        </form>
                    </div>
                </td>
            </tr>
            <%
                    } // end for
                } // end else
            %>
        </table>
    </div>
</div>

</body>
</html>
