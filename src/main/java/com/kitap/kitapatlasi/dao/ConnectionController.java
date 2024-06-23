package com.kitap.kitapatlasi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionController {
    public static Connection getConnection() {
        String url = "jdbc:sqlserver://DESKTOP-DRBOD1L:1433;databaseName=kitapatlasi;integratedSecurity=true;encrypt=true;trustServerCertificate=true";
        Connection conn = null;

        try {
            // JDBC sürücüsünü yükleyin
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Bağlantı kurun
            conn = DriverManager.getConnection(url);

            if (conn != null) {
                System.out.println("Veritabanına başarıyla bağlandı!");
            } else {
                System.out.println("Bağlantı kurulamadı!");
            }
        } catch (SQLException e) {
            System.err.println("SQL Hatası: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println("Sürücü Bulunamadı: " + e.getMessage());
        }

        return conn;
    }
}
