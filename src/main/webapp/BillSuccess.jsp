<%@ page import="com.edups.model.Bill, com.edups.model.BillItem, com.edups.service.BillDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int billId = Integer.parseInt(request.getParameter("bill_Id"));
    Bill bill = new BillDAO().getBillById(billId);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Bill Summary</title>
</head>
<body style="margin:0; font-family: Arial, sans-serif; background: linear-gradient(to right, #f8e6d2, #fcebd6); text-align:center;">

  <div style="padding: 60px 20px;">
    <h1 style="font-size: 36px; color:#e67e22; margin:0 0 10px 0;">Bill Generated Successfully</h1>
    <p style="font-size:16px; color:#333; margin:0 0 30px 0;">
      <strong style="color:#d35400;">Bill ID:</strong> <%= bill.getBillId() %> &nbsp; | &nbsp;
      <strong style="color:#d35400;">Account Number:</strong> <%= bill.getAccountNumber() %> &nbsp; | &nbsp;
      <strong style="color:#d35400;">Total Amount:</strong> Rs. <%= bill.getTotalAmount() %>
    </p>

    <div style="max-width: 900px; margin: 0 auto; background:#fff3e0; padding: 24px; border-radius: 12px; box-shadow: 0 4px 14px rgba(0,0,0,0.08); text-align:left;">
      <h3 style="margin-top:0; color:#d35400;">Items</h3>

      <table border="0" cellpadding="10" cellspacing="0" style="width:100%; border-collapse: collapse; background:white; border-radius: 8px; overflow:hidden;">
        <thead>
          <tr style="background:#f6d9bc;">
            <th style="text-align:left; border-bottom: 2px solid #f0cda7;">Item ID</th>
            <th style="text-align:left; border-bottom: 2px solid #f0cda7;">Item Name</th>
            <th style="text-align:right; border-bottom: 2px solid #f0cda7;">Qty</th>
            <th style="text-align:right; border-bottom: 2px solid #f0cda7;">Price (Rs.)</th>
            <th style="text-align:right; border-bottom: 2px solid #f0cda7;">Subtotal (Rs.)</th>
          </tr>
        </thead>
        <tbody>
        <%
            for (BillItem item : bill.getItems()) {
        %>
          <tr style="border-bottom: 1px solid #fde7cf;">
            <td style="padding:10px 8px;"><%= item.getItemId() %></td>
            <td style="padding:10px 8px;"><%= item.getItemName() %></td>
            <td style="padding:10px 8px; text-align:right;"><%= item.getQuantity() %></td>
            <td style="padding:10px 8px; text-align:right;">Rs. <%= item.getPrice() %></td>
            <td style="padding:10px 8px; text-align:right;">Rs. <%= item.getQuantity() * item.getPrice() %></td>
          </tr>
        <%
            }
        %>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="4" style="text-align:right; font-weight:bold; padding:12px 8px; color:#d35400;">Grand Total</td>
            <td style="text-align:right; font-weight:bold; padding:12px 8px; color:#d35400;">Rs. <%= bill.getTotalAmount() %></td>
          </tr>
        </tfoot>
      </table>

      <div style="text-align:center; margin-top:24px;">
        <button onclick="window.print()" style="
          padding: 12px 24px;
          font-size:16px;
          background-color:#d35400;
          color:white;
          border:none;
          border-radius:8px;
          cursor:pointer;
          transition: opacity .2s;">
          Print Bill
        </button>
      </div>
    </div>

    <div style="margin-top:24px;">
      <a href="CustomerDetails.jsp" style="
        display:inline-block;
        padding:10px 16px;
        font-size:15px;
        color:white;
        background-color:#e67e22;
        text-decoration:none;
        border-radius:8px;">
        ← Back to Customer List
      </a>
    </div>
  </div>

</body>
</html>
