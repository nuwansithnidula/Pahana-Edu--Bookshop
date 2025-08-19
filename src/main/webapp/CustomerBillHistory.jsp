<%@ page import="java.util.*, com.edups.model.Bill" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bill History</title>
</head>
<body>

<h2>Bill History for Account: <%= request.getAttribute("accountNumber") %></h2>

<%
    List<Bill> bills = (List<Bill>) request.getAttribute("bills");
    if (bills != null && !bills.isEmpty()) {
%>
    <table border="1" cellpadding="10">
        <tr>
            <th>Bill ID</th>
            <th>Total Amount</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
        <% for (Bill bill : bills) { %>
        <tr>
            <td><%= bill.getBillId() %></td>
            <td>Rs. <%= bill.getTotalAmount() %></td>
            <td><%= bill.getBillDate() %></td>
            <td>
                <form action="BillSuccess.jsp" method="get">
                    <input type="hidden" name="bill_Id" value="<%= bill.getBillId() %>"/>
                    <button type="submit">View</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
<% } else { %>
    <p>No bills found for this account.</p>
<% } %>

<br><a href="CustomerList.jsp">Back to Customer List</a>
</body>
</html>