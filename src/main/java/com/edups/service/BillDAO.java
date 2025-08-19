package com.edups.service;

import com.edups.model.Bill;
import com.edups.model.BillItem;
import com.edups.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {

    // Save Bill with items and payment
    public int saveBill(Bill bill) throws Exception {
        String billSQL = "INSERT INTO bills (accountNumber, total_amount) VALUES (?, ?)";
        String itemSQL = "INSERT INTO bill_items (bill_id, item_id, item_name, quantity, price) VALUES (?, ?, ?, ?, ?)";
        String paymentSQL = "INSERT INTO payment_history (bill_id, amount_paid) VALUES (?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement billStmt = conn.prepareStatement(billSQL, Statement.RETURN_GENERATED_KEYS)) {

            conn.setAutoCommit(false); // Transaction start

            // Insert into bills table
            billStmt.setString(1, bill.getAccountNumber());
            billStmt.setDouble(2, bill.getTotalAmount());
            billStmt.executeUpdate();

            ResultSet rs = billStmt.getGeneratedKeys();
            int billId = 0;
            if (rs.next()) {
                billId = rs.getInt(1);
            } else {
                throw new Exception("Failed to retrieve generated bill ID.");
            }

            // Insert into bill_items
            try (PreparedStatement itemStmt = conn.prepareStatement(itemSQL)) {
                for (BillItem item : bill.getItems()) {
                    itemStmt.setInt(1, billId);
                    itemStmt.setInt(2, item.getItemId());
                    itemStmt.setString(3, item.getItemName());
                    itemStmt.setInt(4, item.getQuantity());
                    itemStmt.setDouble(5, item.getPrice());
                    itemStmt.addBatch();
                }
                itemStmt.executeBatch();
            }

            // Insert into payment_history
            try (PreparedStatement paymentStmt = conn.prepareStatement(paymentSQL)) {
                paymentStmt.setInt(1, billId);
                paymentStmt.setDouble(2, bill.getTotalAmount());
                paymentStmt.executeUpdate();
            }

            conn.commit(); // Commit all
            return billId;

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    // Retrieve full bill info by billId
    public Bill getBillById(int billId) throws Exception {
        String billSQL = "SELECT * FROM bills WHERE bill_id = ?";
        String itemsSQL = "SELECT * FROM bill_items WHERE bill_id = ?";

        try (Connection conn = DBConnection.getConnection()) {
            Bill bill = new Bill();
            List<BillItem> items = new ArrayList<>();

            // Get bill header
            try (PreparedStatement stmt = conn.prepareStatement(billSQL)) {
                stmt.setInt(1, billId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    bill.setBillId(billId);
                    bill.setAccountNumber(rs.getString("accountNumber"));
                    bill.setTotalAmount(rs.getDouble("total_amount"));
                    bill.setBillDate(rs.getTimestamp("bill_date")); // assuming created_at is present
                } else {
                    return null; // Not found
                }
            }

            // Get bill items
            try (PreparedStatement stmt = conn.prepareStatement(itemsSQL)) {
                stmt.setInt(1, billId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    BillItem item = new BillItem();
                    item.setItemId(rs.getInt("item_id"));
                    item.setItemName(rs.getString("item_name"));
                    item.setQuantity(rs.getInt("quantity"));
                    item.setPrice(rs.getDouble("price"));
                    items.add(item);
                }
            }

            bill.setItems(items);
            return bill;

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
    
    public List<Bill> getBillsByAccount(String accountNumber) throws Exception {
        List<Bill> billList = new ArrayList<>();
        String sql = "SELECT * FROM bills WHERE accountNumber = ? ORDER BY bill_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, accountNumber);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillId(rs.getInt("bill_id"));
                bill.setAccountNumber(rs.getString("accountNumber"));
                bill.setTotalAmount(rs.getDouble("total_amount"));
                bill.setBillDate(rs.getTimestamp("bill_date"));
                billList.add(bill);
            }
        }
        return billList;
    }
}