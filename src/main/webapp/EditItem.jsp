<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.edups.model.Item" %>
<%
    Item item = (Item) request.getAttribute("item");
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Item - PahanaEdu-Book-Shop</title>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; background: linear-gradient(to right, #f8e6d2, #fcebd6); text-align: center; }
        .container { max-width: 500px; margin: 70px auto; background: #fff3e0; padding: 30px 35px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.10); text-align: left; }
        h2 { font-size: 28px; margin: 0 0 15px 0; color: #d35400; text-align: center; }
        label { display: block; font-weight: bold; color: #d35400; margin-bottom: 6px; }
        input[type="text"], input[type="number"] { width: 100%; padding: 10px; border-radius: 6px; border: 1px solid #ccc; margin-bottom: 6px; font-size: 14px; }
        .field-hint { display: block; font-size: 12px; color: #777; margin-bottom: 12px; }
        .err { display: block; font-size: 12px; color: #c62828; margin: 4px 0 10px; min-height: 16px; }
        input[type="submit"] { padding: 12px 25px; background-color: #d35400; color: white; border: none; border-radius: 6px; font-size: 16px; cursor: pointer; width: 100%; margin-top: 10px; }
        input[type="submit"]:hover { background-color: #b54300; }
        a.back-link { display: inline-block; margin-top: 18px; text-decoration: none; padding: 10px 14px; background: #4CAF50; color: white; border-radius: 6px; font-size: 14px; }
        a.back-link:hover { background: #45a049; }
        .flash { padding: 10px 12px; border-radius: 6px; margin: 12px 0; font-size: 14px; }
        .flash.success { background: #e8f5e9; color: #2e7d32; border: 1px solid #c8e6c9; }
        .flash.error { background: #ffebee; color: #c62828; border: 1px solid #ffcdd2; }
        .empty { max-width: 500px; margin: 80px auto; background: #fff3e0; padding: 20px 24px; border-radius: 10px; color: #c62828; border: 1px solid #ffcdd2; }
    </style>
    <script>
        function validateForm(event) {
            var ok = true;
            function setErr(id, msg){ document.getElementById(id).textContent = msg || ""; }

            var name  = document.getElementById("name").value.trim();
            var price = document.getElementById("price").value.trim();
            var qty   = document.getElementById("quantity").value.trim();

            setErr("errName"); setErr("errPrice"); setErr("errQty");

            if (name === "") setErr("errName", "Item name is required."), ok = false;

            if (price === "") {
                setErr("errPrice", "Price is required."); ok = false;
            } else {
                var p = Number(price);
                if (!isFinite(p) || p <= 0) { setErr("errPrice", "Enter a valid positive price."); ok = false; }
            }

            if (qty === "") {
                setErr("errQty", "Quantity is required."); ok = false;
            } else {
                var q = Number(qty);
                if (!Number.isInteger(q) || q < 0) { setErr("errQty", "Enter a valid non-negative integer."); ok = false; }
            }

            if (!ok) event.preventDefault();
        }
    </script>
</head>
<body>

<%
    if (item == null) {
%>
    <div class="empty">
        <strong>Error:</strong> Item data not found. Please go back to the list and try again.
        <div style="margin-top:10px;">
            <a href="<%= ctx %>/ItemList.jsp" class="back-link">Back to Item List</a>
        </div>
    </div>
<%
    } else {
%>

<div class="container">
    <h2>Edit Item</h2>

    <!-- Optional server flash messages -->
    <%
        String success = (String) request.getAttribute("success");
        String error   = (String) request.getAttribute("error");
        if (success != null) { %><div class="flash success"><%= success %></div><% }
        if (error != null)   { %><div class="flash error"><%= error %></div><% }
    %>

    <form action="<%= ctx %>/ItemServlet" method="post" onsubmit="validateForm(event)">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= item.getId() %>">

        <label>Item ID:</label>
        <input type="text" value="<%= item.getId() %>" disabled>
        <span class="field-hint">Item ID cannot be changed.</span>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= item.getName() %>" required>
        <span id="errName" class="err"></span>

        <label for="price">Price (LKR):</label>
        <input type="number" id="price" name="price" step="0.01" min="0" value="<%= item.getPrice() %>" required>
        <span id="errPrice" class="err"></span>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" step="1" min="0" value="<%= item.getQuantity() %>" required>
        <span id="errQty" class="err"></span>

        <input type="submit" value="Update Item">
    </form>

    <a href="<%= ctx %>/ItemList.jsp" class="back-link">Back to Item List</a>
</div>

<%
    } // end else
%>

</body>
</html>
