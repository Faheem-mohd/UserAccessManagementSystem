package com.user.web.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");
        

        String jdbcUrl = "jdbc:postgresql://localhost:9502/UAM";
        String username = "postgres"; 
        String password = "123"; 

        return DriverManager.getConnection(jdbcUrl, username, password);
    }
}
