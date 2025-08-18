<%@ page import="com.edups.model.customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    customer c = (customer) request.getAttribute("customer");
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer - PahanaEdu-Book-Shop</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #f8e6d2, #fcebd6);
            text-align: center;
        }
        .container {
            max-width: 500px;
            margin: 70px auto;
            background: #fff3e0;
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.10);
            text-align: left;
        }
        h2 {
            font-size: 28px;
            margin: 0 0 15px 0;
            color: #d35400;
            text-align: center;
        }
        label {
            display: block;
            font-weight: bold;
            color: #d35400;
            margin-bottom: 6px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-bottom: 6px;
            font-size: 14px;
        }
        .field-hint {
            display: block;
            font-size: 12px;
            color: #777;
            margin-bottom: 12px;
        }
        .err {
            display: block;
            font-size: 12px;
            color: #c62828;
            margin: 4px 0 10px;
            min-height: 16px;
        }
        input[type="submit"] {
            padding: 12px 25px;
            background-color: #d35400;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }
        input[type="submit"]:hover { background-color: #b54300; }
        a.back-link {
            display: inline-block;
            margin-top: 18px;
            text-decoration: none;
            padding: 10px 14px;
            background: #4CAF50;
            color: white;
            border-radius: 6px;
            font-size: 14px;
        }
        a.back-link:hover { background: #45a049; }

        /* flash messages */
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
        .empty {
            max-width: 500px;
            margin: 80px auto;
            background: #fff3e0;
            padding: 20px 24px;
            border-radius: 10px;
            color: #c62828;
            border: 1px solid #ffcdd2;
        }
    </style>
    <script>
        function validateForm(event) {
            var ok = true;
            function setErr(id, msg){ document.getElementById(id).textContent = msg || ""; }

            var name    = document.getElementById("name").value.trim();
            var address = document.getElementById("address").value.trim();
            var phone   = document.getElementById("phone").value.trim();
            var email   = document.getElementById("email").value.trim();

            setErr("errName"); setErr("errAddress"); setErr("errPhone"); setErr("errEmail");

            if (name === "")    { setErr("errName", "Name is required."); ok = false; }
            if (address === "") { setErr("errAddress", "Address is required."); ok = false; }
            if (phone === "")   { setErr("errPhone", "Phone is required."); ok = false; }
            else if (!/^[0-9+\-\s]{7,20}$/.test(phone)) { setErr("errPhone", "Enter a valid phone number."); ok = false; }

            if (email !== "" && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                setErr("errEmail", "Enter a valid email address.");
                ok = false;
            }

            if (!ok) event.preventDefault();
        }
    </script>
</head>
<body>

<%
    if (c == null) {
%>
    <div class="empty">
        <strong>Error:</strong> Customer data not found. Please go back to the list and try again.
        <div style="margin-top:10px;">
            <a href="<%= ctx %>/CustomerDetails.jsp" class="back-link">Back to Customer List</a>
        </div>
    </div>
<%
    } else {
%>

<div class="container">
    <h2>Edit Customer</h2>

    <!-- Optional flash messages set from servlet -->
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

    <form action="<%= ctx %>/AddCustomerServlet" method="post" onsubmit="validateForm(event)">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="accountNumber" value="<%= c.getAccountNumber() %>">

        <label>Account Number:</label>
        <input type="text" value="<%= c.getAccountNumber() %>" disabled>
        <span class="field-hint">Account number cannot be changed.</span>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= c.getName() %>" required>
        <span id="errName" class="err"></span>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= c.getAddress() %>" required>
        <span id="errAddress" class="err"></span>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="<%= c.getPhone() %>" required>
        <span class="field-hint">Use digits only or +, -, space (7–20 chars)</span>
        <span id="errPhone" class="err"></span>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<%= c.getEmail() %>">
        <span id="errEmail" class="err"></span>

        <input type="submit" value="Update Customer">
    </form>

    <a href="<%= ctx %>/CustomerDetails.jsp" class="back-link">Back to Customer List</a>
</div>

<%
    } // end else (c != null)
%>

</body>
</html>
