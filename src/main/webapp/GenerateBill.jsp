<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Bill - PahanaEdu-Book-Shop</title>
    <style>
        body { margin:0; font-family: Arial, sans-serif; background: linear-gradient(to right, #f8e6d2, #fcebd6); }
        .container { max-width: 1100px; margin: 50px auto; background: #fff3e0; padding: 24px 28px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.10); }
        h2 { margin:0 0 16px 0; color:#d35400; font-size:28px; text-align:center; }
        form { margin-top: 10px; }
        label { display:inline-block; font-weight:bold; color:#d35400; margin: 10px 8px 6px 0; }
        input[type="text"], input[type="number"] { padding:10px; border-radius:6px; border:1px solid #ccc; font-size:14px; }
        input[readonly] { background-color: #f3f3f3; }
        .field { margin-bottom: 12px; }
        .flash { padding:10px 12px; border-radius:6px; margin:12px 0; font-size:14px; }
        .flash.success { background:#e8f5e9; color:#2e7d32; border:1px solid #c8e6c9; }
        .flash.error { background:#ffebee; color:#c62828; border:1px solid #ffcdd2; }

        .table-wrap { overflow-x:auto; margin-top: 12px; }
        table { width:100%; border-collapse: collapse; background:#fff; }
        th, td { padding:10px 12px; border:1px solid #eee; text-align:left; vertical-align:middle; }
        th { background:#f57c00; color:#fff; }
        .row-error { color:#c62828; font-size:12px; display:block; margin-top:4px; min-height: 16px; }

        .actions { margin-top:16px; display:flex; gap:10px; flex-wrap:wrap; }
        .btn { display:inline-block; padding:10px 14px; border:none; border-radius:6px; font-size:14px; cursor:pointer; }
        .btn-primary { background:#d35400; color:#fff; }
        .btn-primary:hover { background:#b54300; }
        .btn-secondary { background:#007bff; color:#fff; }
        .btn-secondary:hover { background:#0069d9; }
        .hint { font-size:12px; color:#777; display:block; margin-top:4px; }

        .top-row { display:flex; align-items:center; gap:10px; flex-wrap:wrap; }
        .top-row input[type="text"] { min-width: 240px; }
    </style>
    <script>
        const CTX = "<%= ctx %>";

        function fetchItemDetails(row) {
            const idInput = row.querySelector("input[name='itemId']");
            const nameInput = row.querySelector("input[name='itemName']");
            const priceInput = row.querySelector("input[name='price']");
            const err = row.querySelector(".row-error");

            const itemId = (idInput.value || "").trim();
            err.textContent = "";
            if (!itemId) {
                nameInput.value = "";
                priceInput.value = "";
                return;
            }

            fetch(CTX + '/ItemFetchServlet?id=' + encodeURIComponent(itemId))
                .then(r => r.ok ? r.json() : Promise.reject())
                .then(data => {
                    if (data && data.name && (data.price || data.price === 0)) {
                        nameInput.value = data.name;
                        priceInput.value = data.price;
                    } else {
                        nameInput.value = 'Not Found';
                        priceInput.value = '0';
                        err.textContent = "Item not found.";
                    }
                })
                .catch(() => {
                    nameInput.value = 'Error';
                    priceInput.value = '0';
                    err.textContent = "Failed to fetch item details.";
                });
        }

        function newRowHTML() {
            return `
                <tr>
                    <td>
                        <input type="text" name="itemId" onblur="fetchItemDetails(this.closest('tr'))" required>
                        <span class="row-error"></span>
                    </td>
                    <td><input type="text" name="itemName" readonly></td>
                    <td><input type="number" name="quantity" min="1" required></td>
                    <td><input type="text" name="price" readonly></td>
                </tr>
            `;
        }

        function addRow() {
            const tbody = document.querySelector("#itemsTable tbody");
            const tr = document.createElement("tr");
            tr.innerHTML = `
                <td>
                    <input type="text" name="itemId" onblur="fetchItemDetails(this.closest('tr'))" required>
                    <span class="row-error"></span>
                </td>
                <td><input type="text" name="itemName" readonly></td>
                <td><input type="number" name="quantity" min="1" required></td>
                <td><input type="text" name="price" readonly></td>
            `;
            tbody.appendChild(tr);
        }

        function validateBill(event) {
            let ok = true;
            const acct = document.getElementById("accountNumber");
            const acctErr = document.getElementById("acctErr");
            acctErr.textContent = "";
            if (!acct.value.trim()) {
                acctErr.textContent = "Account number is required.";
                ok = false;
            }

            const rows = document.querySelectorAll("#itemsTable tbody tr");
            if (rows.length === 0) {
                alert("Please add at least one item.");
                ok = false;
            }

            rows.forEach(row => {
                const id = row.querySelector("input[name='itemId']").value.trim();
                const qty = row.querySelector("input[name='quantity']").value.trim();
                const price = row.querySelector("input[name='price']").value.trim();
                const err = row.querySelector(".row-error");
                err.textContent = "";

                if (!id) { err.textContent = "Item ID is required."; ok = false; return; }

                const q = Number(qty);
                if (!qty || !Number.isFinite(q) || q < 1) {
                    err.textContent = "Quantity must be 1 or more.";
                    ok = false;
                }

                const p = Number(price);
                if (!Number.isFinite(p) || p < 0) {
                    err.textContent = "Invalid price for this item.";
                    ok = false;
                }
            });

            if (!ok) event.preventDefault();
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Generate Bill</h2>

    <!-- Optional server-side flash messages -->
    <%
        String success = (String) request.getAttribute("success");
        String error   = (String) request.getAttribute("error");
        if (success != null) { %><div class="flash success"><%= success %></div><% }
        if (error != null)   { %><div class="flash error"><%= error %></div><% }
    %>

    <form action="<%= ctx %>/GenerateBillServlet" method="post" onsubmit="validateBill(event)">
        <div class="top-row">
            <label for="accountNumber">Customer Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>
            <span id="acctErr" class="hint" style="color:#c62828;"></span>
        </div>

        <div class="table-wrap">
            <table id="itemsTable">
                <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Price (each)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input type="text" name="itemId" onblur="fetchItemDetails(this.closest('tr'))" required>
                            <span class="row-error"></span>
                        </td>
                        <td><input type="text" name="itemName" readonly></td>
                        <td><input type="number" name="quantity" min="1" required></td>
                        <td><input type="text" name="price" readonly></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="actions">
            <button type="button" class="btn btn-secondary" onclick="addRow()">+ Add Another Item</button>
            <button type="submit" class="btn btn-primary">Generate Bill</button>
        </div>
    </form>
</div>
</body>
</html>
