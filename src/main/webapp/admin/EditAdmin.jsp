<%@ page import="com.edups.model.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Admin admin = (Admin) request.getAttribute("admin");
%>
<html>
<head>
    <title>Edit Admin</title>
</head>
<body>

<h2>Edit Admin</h2>

<form method="post" action="<%= request.getContextPath() %>/AdminServlet" enctype="multipart/form-data">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<%= admin.getId() %>">

    <label>Name:</label><br>
    <input type="text" name="name" value="<%= admin.getName() %>" required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" value="<%= admin.getEmail() %>" required><br><br>

    <label>Password:</label><br>
    <input type="password" name="password" value="<%= admin.getPassword() %>" required><br><br>

    <label>Current Profile Picture:</label><br>
    <img src="<%= request.getContextPath() %>/admin/pictures/<%= admin.getFileName() %>" width="60" height="60"/><br><br>

    <label>Change Picture:</label><br>
    <input type="file" name="fileName"><br><br>

    <input type="submit" value="Update Admin">
</form>

<br>
<a href="<%= request.getContextPath() %>/admin/ManageAdmins.jsp">Back to Admin List</a>

</body>
</html>