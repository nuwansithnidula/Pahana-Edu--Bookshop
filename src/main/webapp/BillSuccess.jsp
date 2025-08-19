<%@ page import="com.edups.model.Bill, com.edups.model.BillItem, com.edups.service.BillDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int billId = Integer.parseInt(request.getParameter("bill_Id"));
    Bill bill = new BillDAO().getBillById(billId);
%>
<html>
<head>
    <title>Bill Summary</title>
</head>
<body>
    <h2>Bill Generated Successfully</h2>
    <p><strong>Bill ID:</strong> <%= bill.getBillId() %></p>
    <p><strong>Account Number:</strong> <%= bill.getAccountNumber() %></p>
    <p><strong>Total Amount:</strong> Rs. <%= bill.getTotalAmount() %></p>

    <h3>Items:</h3>
    <table border="1" cellpadding="8">
        <tr>
            <th>Item ID</th><th>Item Name</th><th>Qty</th><th>Price</th><th>Subtotal</th>
        </tr>
        <%
            for (BillItem item : bill.getItems()) {
        %>
        <tr>
            <td><%= item.getItemId() %></td>
            <td><%= item.getItemName() %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getPrice() %></td>
            <td><%= item.getQuantity() * item.getPrice() %></td>
        </tr>
        <% } %>
    </table>

    <br>
    <button onclick="window.print()">Print Bill</button>
    <br><br>
    <a href="CustomerList.jsp">← Back to Customer List</a>
</body>
</html>