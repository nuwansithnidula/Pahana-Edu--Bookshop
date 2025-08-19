<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Help - PahanaEdu Billing System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #fdf6e3;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: #fffaf0;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #d35400;
        }

        ul {
            padding-left: 20px;
        }

        p {
            line-height: 1.6;
        }

        .section {
            margin-bottom: 30px;
        }

        .highlight {
            background: #fcf3cf;
            border-left: 4px solid #f39c12;
            padding: 10px;
            margin: 10px 0;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Help & User Guide</h1>

    <div class="section">
        <h2>📌 Getting Started</h2>
        <p>Welcome to the PahanaEdu Billing System. This guide will help new users understand how to navigate and use the system efficiently.</p>
    </div>

    <div class="section">
        <h2>👨‍💼 Logging In</h2>
        <ul>
            <li>Go to the <strong>Admin</strong> or <strong>Employee</strong> login page.</li>
            <li>Enter your username and password provided by the administrator.</li>
            <li>Click <strong>Login</strong> to access the dashboard.</li>
        </ul>
    </div>
    
    <div class="section">
    <h2>👨‍💼 Managing Employees</h2>
    <ul>
        <li>Navigate to <strong>Employee List</strong> from the admin dashboard.</li>
        <li>Click on the <strong>+ Add Employee</strong> button to register new staff members.</li>
        <li>Use the <strong>Edit</strong> button to update employee details like name, contact, or role.</li>
        <li>Use the <strong>Delete</strong> button to remove employees who are no longer part of the system.</li>
        <li>Each employee must have a unique <strong>Employee ID</strong> or <strong>Username</strong> for login.</li>
    </ul>
</div>

    <div class="section">
        <h2>📁 Managing Customers</h2>
        <ul>
            <li>Navigate to <strong>Customer List</strong> from the dashboard.</li>
            <li>Use the <strong>+ Add Customer</strong> button to register new customers.</li>
            <li>Use <strong>Edit</strong> and <strong>Delete</strong> buttons to manage customer details.</li>
        </ul>
    </div>

    <div class="section">
        <h2>🛒 Managing Items</h2>
        <ul>
            <li>Go to the <strong>Item List</strong> page.</li>
            <li>Click <strong>+ Add Item</strong> to add new products.</li>
            <li>Update item names, prices, and delete unused ones.</li>
        </ul>
    </div>

    <div class="section">
        <h2>🧾 Generating Bills</h2>
        <ul>
            <li>Go to <strong>Generate Bill</strong> page.</li>
            <li>Enter <strong>Account Number</strong> and add <strong>Item ID & Quantity</strong>.</li>
            <li>Prices and item names will auto-fill (if configured).</li>
            <li>Click <strong>Generate Bill</strong> to save and print.</li>
        </ul>
    </div>

    <div class="section">
        <h2>📊 Viewing Bill History</h2>
        <ul>
            <li>Go to <strong>Customer Bill History</strong> from the dashboard or customer list.</li>
            <li>Enter the account number to see previous bills and their details.</li>
        </ul>
    </div>

    <div class="section highlight">
        <strong>💡 Tips:</strong>
        <ul>
            <li>Use modern browsers like Chrome or Edge for the best experience.</li>
            <li>Click “Logout” after use to protect your account.</li>
            <li>Ensure data accuracy before saving any record.</li>
        </ul>
    </div>
</div>

</body>
</html>