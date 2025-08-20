<%@ page import="java.util.*, com.edups.model.Bill" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bill History</title>
</head>
<body style="margin:0; font-family: Arial, sans-serif; background: linear-gradient(to right, #f8e6d2, #fcebd6); text-align:center;">

  <div style="padding:60px 20px;">
    <h1 style="font-size: 32px; color:#e67e22; margin-bottom:20px;">
      Bill History for Account: 
      <span style="color:#d35400;"><%= request.getAttribute("accountNumber") %></span>
    </h1>

    <%
      List<Bill> bills = (List<Bill>) request.getAttribute("bills");
      if (bills != null && !bills.isEmpty()) {
    %>
      <div style="max-width: 900px; margin: 0 auto; background:#fff3e0; padding: 24px; border-radius: 12px; box-shadow: 0 4px 14px rgba(0,0,0,0.08); text-align:left;">
        <table cellpadding="10" cellspacing="0" style="width:100%; border-collapse:collapse; background:white; border-radius:8px; overflow:hidden;">
          <thead>
            <tr style="background:#f6d9bc;">
              <th style="text-align:left; border-bottom:2px solid #f0cda7;">Bill ID</th>
              <th style="text-align:right; border-bottom:2px solid #f0cda7;">Total Amount (Rs.)</th>
              <th style="text-align:left; border-bottom:2px solid #f0cda7;">Date</th>
              <th style="text-align:center; border-bottom:2px solid #f0cda7;">Action</th>
            </tr>
          </thead>
          <tbody>
          <% for (Bill bill : bills) { %>
            <tr style="border-bottom:1px solid #fde7cf;">
              <td style="padding:10px 8px;"><%= bill.getBillId() %></td>
              <td style="padding:10px 8px; text-align:right;">Rs. <%= bill.getTotalAmount() %></td>
              <td style="padding:10px 8px;"><%= bill.getBillDate() %></td>
              <td style="text-align:center; padding:10px 8px;">
                <form action="BillSuccess.jsp" method="get" style="margin:0;">
                  <input type="hidden" name="bill_Id" value="<%= bill.getBillId() %>"/>
                  <button type="submit" style="
                    padding: 8px 16px;
                    font-size:14px;
                    background-color:#d35400;
                    color:white;
                    border:none;
                    border-radius:6px;
                    cursor:pointer;
                    transition:opacity .2s;">
                    View
                  </button>
                </form>
              </td>
            </tr>
          <% } %>
          </tbody>
        </table>
      </div>
    <% } else { %>
      <p style="font-size:18px; color:#b00020; margin-top:40px;">No bills found for this account.</p>
    <% } %>

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
