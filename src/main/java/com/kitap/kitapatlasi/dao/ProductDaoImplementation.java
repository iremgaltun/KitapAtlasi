package com.kitap.kitapatlasi.dao;

import com.kitap.kitapatlasi.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImplementation implements ProductDao {

    private Connection conn;



    @Override
    public List<Product> getAllProduct() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Product";
        try (Connection conn = ConnectionController.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("ProductDetail"),
                        rs.getDouble("ProductPrice"),
                        rs.getString("ProductImage"), // Read image as byte array
                        rs.getInt("CategoryID"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public boolean addProduct(Product product) {
        // Validate product details
        if (product == null || product.getProductName() == null || product.getProductName().isEmpty() ||
                product.getProductDetail() == null || product.getProductDetail().isEmpty() ||
                product.getProductPrice() <= 0 || product.getCategoryID() <= 0) {
            System.out.println("Invalid product details provided.");
            return false;
        }

        String insertQuery = "INSERT INTO Product (ProductName, ProductDetail, ProductPrice, CategoryID) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement insertStmt = conn.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {

            // Start transaction
            conn.setAutoCommit(false);

            // Set parameters
            insertStmt.setString(1, product.getProductName());
            insertStmt.setString(2, product.getProductDetail());
            insertStmt.setDouble(3, product.getProductPrice());
            insertStmt.setInt(4, product.getCategoryID());

            // Execute update
            int affectedRows = insertStmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating product failed, no rows affected.");
            }

            // Get generated product ID
            try (ResultSet generatedKeys = insertStmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    product.setProductID(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating product failed, no ID obtained.");
                }
            }

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
    public List<Product> getProductsByCategoryName(String categoryName) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT p.ProductID, p.ProductName, p.ProductDetail, p.ProductPrice, p.ProductImage, p.CategoryID " +
                "FROM [Product] p JOIN [Category] c ON p.CategoryID = c.CategoryID " +
                "WHERE c.CategoryName = ?";

        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, categoryName);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product(
                            rs.getInt("ProductID"),
                            rs.getString("ProductName"),
                            rs.getString("ProductDetail"),
                            rs.getDouble("ProductPrice"),
                            rs.getString("ProductImage"),
                            rs.getInt("CategoryID"));
                    products.add(product);
                }
            }
            System.out.println("Bulunan ürün sayısı: " + products.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public boolean deleteProduct(int productID) {
        String deleteQuery = "DELETE FROM Product WHERE ProductID = ?";
        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery)) {

            deleteStmt.setInt(1, productID);
            int rowsAffected = deleteStmt.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Veritabanı hatası: " + e.getMessage());

        }return false;
    }



    public Product getProductByName(String productName) {
        String query = "SELECT * FROM [Product] WHERE ProductName = ?";
        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, productName);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                            rs.getInt("ProductID"),
                            rs.getString("ProductName"),
                            rs.getString("ProductDetail"),
                            rs.getDouble("ProductPrice"),
                            rs.getString("ProductImage"), // Read image as byte array
                            rs.getInt("CategoryID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }




    public Product getProductByID(int productID) {
        String query = "SELECT * FROM [Product] WHERE ProductID = ?";
        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, productID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                            rs.getString("ProductName"),
                            rs.getString("ProductDetail"),
                            rs.getDouble("ProductPrice"),
                            rs.getString("ProductImage"),
                            rs.getInt("ProductID"));
                    // Read image as byte array

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<Product> getProductByCategoryID(int CategoryID) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM [Product] WHERE CategoryID = ?";
        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, CategoryID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product(
                            rs.getInt("ProductID"),
                            rs.getString("ProductName"),
                            rs.getString("ProductDetail"),
                            rs.getDouble("ProductPrice"),
                            rs.getString("ProductImage"),
                            rs.getInt("CategoryID"));
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }







}
