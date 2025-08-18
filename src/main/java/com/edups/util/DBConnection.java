// File: com/edups/util/DBConnection.java
package com.edups.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/bookshop?characterEncoding=utf8";
    private static final String USERNAME = "root";       // ✅ Your MySQL username
    private static final String PASSWORD = "1234";       // ✅ Your MySQL password

    // Load the JDBC driver and return a database connection
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 8+ Driver
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    // Utility method to close any JDBC resources safely
    public static void closeResources(AutoCloseable... resources) {
        for (AutoCloseable res : resources) {
            try {
                if (res != null) res.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
