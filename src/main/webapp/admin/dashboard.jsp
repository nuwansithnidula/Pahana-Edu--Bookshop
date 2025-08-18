<%@ page session="true" %>
<%@ page import="com.edups.model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - PahanaEdu-Book-Shop</title>
</head>
<body style="margin: 0; font-family: Arial, sans-serif; background: linear-gradient(to right, #f8e6d2, #fcebd6);">

    <!-- HEADER -->
    <div style="background-color: #d35400; padding: 20px; color: white; display: flex; justify-content: space-between; align-items: center;">
        <div style="display: flex; align-items: center;">
            <img src="<%= request.getContextPath() + "/" + admin.getFileName() %>" alt="Admin Image" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover; margin-right: 15px; border: 2px solid white;">
            <div>
                <h2 style="margin: 0;">Welcome, <%= admin.getName() %></h2>
                <p style="margin: 0; font-size: 14px;">PahanaEdu Admin Panel</p>
            </div>
        </div>
        <form action="<%=request.getContextPath()%>/logout" method="get">
  <button type="submit" style="background-color: #fff3e0; color: #d35400; border: none; padding: 10px 20px; border-radius: 6px;">
    Logout
  </button>
</form>
    </div>

    <!-- CONTENT -->
    <div style="padding: 50px 20px; text-align: center;">
        <h2 style="color: #d35400; font-size: 28px;">Dashboard Options</h2>

        <div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 30px; margin-top: 40px;">
            <a href="ManageAdmins.jsp" style="text-decoration: none;">
                <div style="width: 200px; padding: 20px; background-color: #fff3e0; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); color: #d35400;">
                    <h3>Admins</h3>
                </div>
            </a>

            <a href="<%= request.getContextPath() %>/EmployeeList.jsp" style="text-decoration: none;">
    <div style="width: 200px; padding: 20px; background-color: #fff3e0; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); color: #d35400;">
        <h3>Employees</h3>
    </div>
</a>
                <a href="<%= request.getContextPath() %>/CustomerDetails.jsp" style="text-decoration: none;">
                <div style="width: 200px; padding: 20px; background-color: #fff3e0; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); color: #d35400;">
                    <h3>Customers</h3>
                </div>
            </a>

            <a href="<%= request.getContextPath() %>/ItemList.jsp" style="text-decoration: none;">
                <div style="width: 200px; padding: 20px; background-color: #fff3e0; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); color: #d35400;">
                    <h3>Products</h3>
                </div>
            </a>

            
            <a href="<%= request.getContextPath() %>/GenerateBill.jsp" style="text-decoration: none;">
                <div style="width: 200px; padding: 20px; background-color: #fff3e0; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); color: #d35400;">
                    <h3>Calculate Bill</h3>
                </div>
            </a>

            <a href="<%= request.getContextPath() %>/AdminHelp.jsp" style="text-decoration: none;">
                <div style="width: 200px; padding: 20px; background-color: #fff3e0; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); color: #d35400;">
                    <h3>Help Section</h3>
                </div>
            </a>
        </div>
    </div>

</body>
</html>
