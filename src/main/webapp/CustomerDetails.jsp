<%@ page import="java.util.*, com.edups.model.customer, com.edups.service.customerDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    customerDAO dao = new customerDAO();
    List<customer> customerList = dao.getAllCustomers();
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Details - PahanaEdu-Book-Shop</title>
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
        h2 {
            margin: 0 0 12px 0;
            font-size: 28px;
            color: #d35400;
        }
        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-bottom: 10px;
        }
        a.btn, .btn {
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
        .history-btn { background-color: #f39c12; }
        .history-btn:hover { background-color: #e67e22; }

        .flash {
            padding: 10px 12px;
            border-radius: 6px;
            margin: 12px 0;
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

        .table-wrap { overflow-x: auto; }
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
        .empty-row {
            text-align: center;
            color: #666;
            font-style: italic;
        }
        .actions {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="toolbar">
        <h2>Customer List</h2>
        <a href="<%= ctx %>/AddCustomer.jsp" class="btn add-btn">+ Add Customer</a>
    </div>

    <%-- Flash messages --%>
    <%
        String success = (String) request.getAttribute("success");
        String error = (String) request.getAttribute("error");
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
                <th>Account Number</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>

            <%
                if (customerList == null || customerList.isEmpty()) {
            %>
                <tr>
                    <td colspan="6" class="empty-row">No customers found.</td>
                </tr>
            <%
                } else {
                    for (customer c : customerList) {
            %>
            <tr>
                <td><%= c.getAccountNumber() %></td>
                <td><%= c.getName() %></td>
                <td><%= c.getAddress() %></td>
                <td><%= c.getPhone() %></td>
                <td><%= c.getEmail() %></td>
                <td>
                    <div class="actions">
                        <a class="btn edit-btn" href="<%= ctx %>/AddCustomerServlet?action=edit&accountNumber=<%= c.getAccountNumber() %>">Edit</a>
                        <a class="btn delete-btn" href="<%= ctx %>/AddCustomerServlet?action=delete&accountNumber=<%= c.getAccountNumber() %>" onclick="return confirm('Are you sure you want to delete this customer?');">Delete</a>
                        <form action="<%= ctx %>/CustomerBillHistoryServlet" method="post" style="display:inline;">
                            <input type="hidden" name="accountNumber" value="<%= c.getAccountNumber() %>"/>
                            <button type="submit" class="btn history-btn">History</button>
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