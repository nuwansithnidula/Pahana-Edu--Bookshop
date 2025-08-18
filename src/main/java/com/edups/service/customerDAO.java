package com.edups.service;

import com.edups.model.customer;
import com.edups.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class customerDAO {

    public void addCustomer(customer customer) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO customers (accountNumber, name, address, phone, email) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, customer.getAccountNumber());
            stmt.setString(2, customer.getName());
            stmt.setString(3, customer.getAddress());
            stmt.setString(4, customer.getPhone());
            stmt.setString(5, customer.getEmail());

            stmt.executeUpdate();
        }
    }

    public List<customer> getAllCustomers() throws SQLException, ClassNotFoundException {
        List<customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM customers";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                customer c = new customer();
                c.setAccountNumber(rs.getString("accountNumber"));
                c.setName(rs.getString("name"));
                c.setAddress(rs.getString("address"));
                c.setPhone(rs.getString("phone"));
                c.setEmail(rs.getString("email"));
                customers.add(c);
            }
        }

        return customers;
    }

    public customer getCustomerByAccountNumber(String accountNumber) throws SQLException, ClassNotFoundException {
        customer c = null;
        String sql = "SELECT * FROM customers WHERE accountNumber = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, accountNumber);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                c = new customer();
                c.setAccountNumber(rs.getString("accountNumber"));
                c.setName(rs.getString("name"));
                c.setAddress(rs.getString("address"));
                c.setPhone(rs.getString("phone"));
                c.setEmail(rs.getString("email"));
            }
        }

        return c;
    }

    public void updateCustomer(customer customer) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE customers SET name=?, address=?, phone=?, email=? WHERE accountNumber=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getAddress());
            stmt.setString(3, customer.getPhone());
            stmt.setString(4, customer.getEmail());
            stmt.setString(5, customer.getAccountNumber());
            stmt.executeUpdate();
        }
    }

    public void deleteCustomer(String accountNumber) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM customers WHERE accountNumber = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, accountNumber);
            stmt.executeUpdate();
        }
    }
}