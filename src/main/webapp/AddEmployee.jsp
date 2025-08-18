<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee - PahanaEdu-Book-Shop</title>
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
        input[type="text"], input[type="email"], input[type="password"] {
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
    </style>
    <script>
        function validateForm(event) {
            var ok = true;
            function setErr(id, msg){ document.getElementById(id).textContent = msg || ""; }

            var id       = document.getElementById("id").value.trim();
            var name     = document.getElementById("name").value.trim();
            var email    = document.getElementById("email").value.trim();
            var password = document.getElementById("password").value.trim();

            setErr("errId"); setErr("errName"); setErr("errEmail"); setErr("errPassword");

            if (id === "")        { setErr("errId", "Employee ID is required."); ok = false; }
            if (name === "")      { setErr("errName", "Name is required."); ok = false; }
            if (email === "")     { setErr("errEmail", "Email is required."); ok = false; }
            else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                setErr("errEmail", "Enter a valid email address."); ok = false;
            }
            if (password === "")  { setErr("errPassword", "Password is required."); ok = false; }

            if (!ok) event.preventDefault();
        }
    </script>
</head>
<body>

<div class="container">
    <h2>Add New Employee</h2>

    <!-- Optional flash messages from servlet -->
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

    <form method="post" action="<%= ctx %>/EmployeeServlet" onsubmit="validateForm(event)">
        <input type="hidden" name="action" value="add">

        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required>
        <span class="field-hint">Example: E1, E2, ...</span>
        <span id="errId" class="err"></span>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <span id="errName" class="err"></span>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <span id="errEmail" class="err"></span>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <span id="errPassword" class="err"></span>

        <input type="submit" value="Add">
    </form>

    <a href="<%= ctx %>/EmployeeList.jsp" class="back-link">Back to Employee List</a>
</div>

</body>
</html>
