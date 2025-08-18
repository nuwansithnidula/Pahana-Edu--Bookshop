<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Employee Login - PahanaEdu-Book-Shop</title>
  <script>
    function validateForm(event) {
      var email = document.getElementById("email").value.trim();
      var password = document.getElementById("password").value.trim();
      var emailError = document.getElementById("emailError");
      var passError = document.getElementById("passError");

      emailError.textContent = "";
      passError.textContent = "";

      var valid = true;

      if (email === "") {
        emailError.textContent = "Email is required.";
        valid = false;
      }
      if (password === "") {
        passError.textContent = "Password is required.";
        valid = false;
      }

      if (!valid) {
        event.preventDefault();
      }
    }
  </script>
</head>
<body style="margin: 0; font-family: Arial, sans-serif; background: linear-gradient(to right, #f8e6d2, #fcebd6); text-align: center;">

  <div style="padding: 80px 20px;">
    <h1 style="font-size: 36px; color: #d35400;">Employee Login</h1>
    <p style="font-size: 18px; color: #333;">Please enter your credentials to access the employee panel.</p>

    <form action="<%=request.getContextPath()%>/EmployeeLoginServlet" method="post" onsubmit="validateForm(event)" style="max-width: 400px; margin: 50px auto; background: #fff3e0; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">

      <div style="margin-bottom: 20px; text-align: left;">
        <label for="email" style="display: block; font-weight: bold; color: #d35400;">Email</label>
        <input type="email" id="email" name="email" style="width: 100%; padding: 10px; border-radius: 6px;">
        <span id="emailError" style="color: red; font-size: 14px;"></span>
      </div>

      <div style="margin-bottom: 30px; text-align: left;">
        <label for="password" style="display: block; font-weight: bold; color: #d35400;">Password</label>
        <input type="password" id="password" name="password" style="width: 100%; padding: 10px; border-radius: 6px;">
        <span id="passError" style="color: red; font-size: 14px;"></span>
      </div>

      <button type="submit" style="padding: 12px 25px; font-size: 16px; background-color: #d35400; color: white; border-radius: 6px;">Login</button>

      <% String error = (String) request.getAttribute("errorMessage"); if (error != null) { %>
        <p style="color:red;"><%= error %></p>
      <% } %>
    </form>
  </div>

</body>
</html>
