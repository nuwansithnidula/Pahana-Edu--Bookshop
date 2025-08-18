<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer - PahanaEdu-Book-Shop</title>
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
        }
        h2 {
            font-size: 28px;
            margin-bottom: 15px;
            color: #d35400;
        }
        form { text-align: left; margin-top: 20px; }
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
            text-align: left;
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
    </style>
    <script>
        function validateForm(event) {
            var ok = true;

            function setErr(id, msg){ document.getElementById(id).textContent = msg || ""; }

            var accountNumber = document.getElementById("accountNumber").value.trim();
            var name          = document.getElementById("name").value.trim();
            var address       = document.getElementById("address").value.trim();
            var phone         = document.getElementById("phone").value.trim();
            var email         = document.getElementById("email").value.trim();

            setErr("errAccountNumber"); setErr("errName"); setErr("errAddress");
            setErr("errPhone"); setErr("errEmail");

            if (accountNumber === "") { setErr("errAccountNumber", "Account number is required."); ok = false; }
            if (name === "")          { setErr("errName", "Name is required."); ok = false; }
            if (address === "")       { setErr("errAddress", "Address is required."); ok = false; }
            if (phone === "")         { setErr("errPhone", "Phone is required."); ok = false; }
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
    String ctx = request.getContextPath();
%>
<div class="container">
    <h2>Add New Customer</h2>

    <!-- Flash messages from server (optional) -->
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
        <input type="hidden" name="action" value="add">

        <label for="accountNumber">Account Number:</label>
        <input type="text" id="accountNumber" name="accountNumber" required>
        <span id="errAccountNumber" class="err"></span>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <span id="errName" class="err"></span>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
        <span id="errAddress" class="err"></span>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required>
        <span class="field-hint">Use digits only or +, -, space (7–20 chars)</span>
        <span id="errPhone" class="err"></span>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email">
        <span id="errEmail" class="err"></span>

        <input type="submit" value="Add Customer">
    </form>

    <a href="<%= ctx %>/CustomerDetails.jsp" class="back-link">Back to Customer List</a>
</div>
</body>
</html>
