package com.kitap.kitapatlasi.dao;

import com.kitap.kitapatlasi.entity.Admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoImplementation {
    private Connection conn;
    private PreparedStatement ps;

    public List<Admin> readingData() {
        List<Admin> liste = new ArrayList<>();
        String sorgu = "SELECT * FROM [Admin]";

        try {
            conn = ConnectionController.getConnection();
            ps = conn.prepareStatement(sorgu);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Admin uye;
                uye = new Admin(rs.getString("AdminMail"), rs.getString("AdminPassword"));
                liste.add(uye);
            }
        } catch (SQLException exception) {
            System.out.println("Bir hata meydana geldi: " + exception);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException sqlException) {
                System.out.println("Bir hata meydana geldi: " + sqlException);
            }
        }

        return liste;
    }

    public boolean control(Admin admin) {
        boolean result = false;
        String sorgu = "SELECT AdminMail, AdminPassword FROM [Admin] WHERE AdminMail = ?";

        try {
            conn = ConnectionController.getConnection();
            ps = conn.prepareStatement(sorgu);
            ps.setString(1, admin.getAdminMail());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String adminPasswordDB = rs.getString("AdminPassword");

                if (adminPasswordDB != null && adminPasswordDB.equals(admin.getAdminPassword())) {
                    result = true;
                }
            }
        } catch (SQLException exception) {
            System.out.println("Veritabanı hatası: " + exception.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException sqlException) {
                System.out.println("Kapatma hatası: " + sqlException.getMessage());
            }
        }
        if (result) {
            System.out.println("Kullanıcı doğrulama başarılı: " + admin.getAdminMail());
        } else {
            System.out.println("Kullanıcı doğrulama başarısız: " + admin.getAdminMail());
        }


        return result;
    }

}