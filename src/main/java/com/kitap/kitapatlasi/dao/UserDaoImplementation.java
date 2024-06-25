package com.kitap.kitapatlasi.dao;

import com.kitap.kitapatlasi.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImplementation implements UserDao {

    private Connection conn;
    private PreparedStatement ps;

    @Override
    public List<User> getUserDao() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM [User]";
        try (Connection conn = ConnectionController.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
                        rs.getString("Name"),
                        rs.getString("LastName"),
                        rs.getString("Mail"),
                        rs.getString("Password"),
                        rs.getString("Address"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean addUser(User user) {
        // Validate user details
        if (user == null || user.getName() == null || user.getName().isEmpty() ||
                user.getLastName() == null || user.getLastName().isEmpty() ||
                user.getMail() == null || user.getMail().isEmpty() ||
                user.getPassword() == null || user.getPassword().isEmpty() ) {
            System.out.println("Invalid user details provided.");
            return false;
        }

        // Check if user already exists
        if (isUserExists(user.getMail())) {
            System.out.println("User with email " + user.getMail() + " already exists.");
            return false;
        }

        String insertQuery = "INSERT INTO [User] (Name, LastName, Mail, Password) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {

            // Start transaction
            conn.setAutoCommit(false);

            // Set parameters
            insertStmt.setString(1, user.getName());
            insertStmt.setString(2, user.getLastName());
            insertStmt.setString(3, user.getMail());
            insertStmt.setString(4, user.getPassword());


            // Execute update
            insertStmt.executeUpdate();

            // Commit transaction
            conn.commit();
            return true;

        } catch (SQLException e) {
            // Rollback transaction on error
            e.printStackTrace();
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            return false;
        }
    }


    @Override
    public boolean deleteUser(int UserID) {
        String query = "DELETE FROM [User] WHERE UserID = ? ";
        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement psmt = conn.prepareStatement(query)) {

            psmt.setInt(1, UserID);


            int rowsAffected = psmt.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Veritabanı hatası: " + e.getMessage());
            return false;
        }
    }
    @Override
    public boolean isUserExists(String email) {
        String checkQuery = "SELECT COUNT(*) FROM [User] WHERE Mail = ?";
        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {

            checkStmt.setString(1, email);
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean ControlUser(User user) {
        boolean result = false;
        String sorgu = "SELECT mail, password FROM [User] WHERE mail = ?";

        try {
            conn = ConnectionController.getConnection();
            if (conn == null) {
                System.out.println("Connection failed!");
                return false;
            }

            ps = conn.prepareStatement(sorgu);
            ps.setString(1, user.getMail());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String PasswordDB = rs.getString("password");

                if (PasswordDB != null && PasswordDB.equals(user.getPassword())) {
                    result = true;
                } else {
                    System.out.println("Password mismatch for user: " + user.getMail());
                }
            } else {
                System.out.println("User not found: " + user.getMail());
            }
        } catch (SQLException exception) {
            System.out.println("Database error: " + exception.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException sqlException) {
                System.out.println("Closing error: " + sqlException.getMessage());
            }
        }

        if (result) {
            System.out.println("User validation successful: " + user.getMail());
        } else {
            System.out.println("User validation failed: " + user.getMail());
        }

        return result;
}}
