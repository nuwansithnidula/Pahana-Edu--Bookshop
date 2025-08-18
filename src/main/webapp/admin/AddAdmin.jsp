<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Admin - PahanaEdu-Book-Shop</title>
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
        form {
            text-align: left;
            margin-top: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            color: #d35400;
            margin-bottom: 6px;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="file"] {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-bottom: 18px;
            font-size: 14px;
        }
        input[type="submit"] {
            padding: 12px 25px;
            background-color: #d35400;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #b54300;
        }
        a.back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            padding: 10px 14px;
            background: #4CAF50;
            color: white;
            border-radius: 6px;
            font-size: 14px;
        }
        a.back-link:hover {
            background: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Create New Admin</h2>

    <form method="post" action="<%= request.getContextPath() %>/AdminServlet" enctype="multipart/form-data">
        <input type="hidden" name="action" value="add">

        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <label>Profile Picture:</label>
        <input type="file" name="fileName">

        <input type="submit" value="Create Admin">
    </form>

    <a href="<%= request.getContextPath() %>/admin/ManageAdmins.jsp" class="back-link">Back to Admin List</a>
</div>

</body>
</html>
