// File: com/edups/service/EmployeeDAO.java
package com.edups.service;

import com.edups.model.Employee;
import com.edups.util.DBConnection;

import java.sql.*;
import java.util.*;

public class EmployeeDAO {

    public void addEmployee(Employee emp) throws Exception {
        String sql = "INSERT INTO employee (id, name, email, password) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, emp.getId());
            stmt.setString(2, emp.getName());
            stmt.setString(3, emp.getEmail());
            stmt.setString(4, emp.getPassword());
            stmt.executeUpdate();
        }
    }

    public List<Employee> getAllEmployees() throws Exception {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employee";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(new Employee(
                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password")
                ));
            }
        }
        return list;
    }

    
    public Employee getEmployeeByEmail(String email) throws Exception {
        String sql = "SELECT * FROM employee WHERE email=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Employee(
                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password")
                );
            }
        }
        return null;
    }


    
    
    public Employee getEmployeeById(String id) throws Exception {
        String sql = "SELECT * FROM employee WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Employee(
                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password")
                );
            }
        }
        return null;
    }

    public void updateEmployee(Employee emp) throws Exception {
        String sql = "UPDATE employee SET name=?, email=?, password=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, emp.getName());
            stmt.setString(2, emp.getEmail());
            stmt.setString(3, emp.getPassword());
            stmt.setString(4, emp.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteEmployee(String id) throws Exception {
        String sql = "DELETE FROM employee WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, id);
            stmt.executeUpdate();
        }
    }
}
