<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx = request.getContextPath();
    // Optional: show logged-in employee name if you set it in session
    String empName = (String) session.getAttribute("employeeName");
    if (empName == null || empName.trim().isEmpty()) empName = "Employee";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard - PahanaEdu</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #f8e6d2, #fcebd6);
        }
        .header {
            background-color: #d35400;
            color: white;
            padding: 22px 24px;
            position: relative;
        }
        .header h1 {
            margin: 0;
            font-size: 26px;
        }
        .header h2 {
            margin: 4px 0 0 0;
            font-size: 14px;
            font-weight: normal;
            opacity: 0.95;
        }
        .logout-btn {
            position: absolute;
            top: 18px;
            right: 20px;
        }
        .logout-btn button {
            background-color: #ffffff;
            color: #d35400;
            padding: 10px 16px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            border-radius: 6px;
        }
        .logout-btn button:hover {
            background: #ffe0cc;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            background: #fff3e0;
            padding: 28px 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.10);
        }
        .container h2 {
            margin-top: 0;
            color: #d35400;
            text-align: center;
            font-size: 24px;
            margin-bottom: 18px;
        }

        /* Flash messages */
        .flash {
            padding: 10px 12px;
            border-radius: 6px;
            margin: 12px 0 20px;
            font-size: 14px;
        }
        .flash.success { background: #e8f5e9; color: #2e7d32; border: 1px solid #c8e6c9; }
        .flash.error   { background: #ffebee; color: #c62828; border: 1px solid #ffcdd2; }

        .options {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 22px;
        }
        .tile {
            display: inline-block;
            background-color: #ffffff;
            border: 2px solid #d35400;
            border-radius: 12px;
            padding: 28px 24px;
            width: 180px;
            text-align: center;
            font-size: 16px;
            color: #d35400;
            text-decoration: none;
            font-weight: bold;
            transition: transform 0.25s ease, background-color 0.25s ease, box-shadow 0.25s ease;
            box-shadow: 0 2px 6px rgba(0,0,0,0.06);
        }
        .tile:hover {
            background-color: #ffe0b2;
            transform: translateY(-2px);
            box-shadow: 0 6px 14px rgba(0,0,0,0.12);
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Welcome, <%= empName %></h1>
    <h2>PahanaEdu Employee Panel</h2>
    <div class="logout-btn">
        <form action="<%=request.getContextPath()%>/logout" method="get">
  <button type="submit" style="background-color: #fff3e0; color: #d35400; border: none; padding: 10px 20px; border-radius: 6px;">
    Logout
  </button>
    </div>
</div>

<div class="container">
    <!-- Optional flash messages (set in servlets with request.setAttribute("success"/"error", "...")) -->
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

    <h2>Dashboard Options</h2>
    <div class="options"> 
        <a class="tile" href="<%= ctx %>/CustomerDetails.jsp">Customers</a>
        <a class="tile" href="<%= ctx %>/ItemList.jsp">Products</a>
        <a class="tile" href="<%= ctx %>/GenerateBill.jsp">Calculate Bill</a>
        <a class="tile" href="<%= ctx %>/AdminHelp.jsp">Help Section</a>
    </div>
</div>

</body>
</html>
