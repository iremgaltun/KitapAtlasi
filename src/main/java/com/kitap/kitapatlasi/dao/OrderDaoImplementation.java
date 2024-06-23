package com.kitap.kitapatlasi.dao;

import com.kitap.kitapatlasi.entity.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;


public class OrderDaoImplementation implements OrderDao {


    @Override
    public List<Order> getOrderDao() {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM [Order]";

        try (Connection conn = ConnectionController.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getString("OrderDate"),
                        rs.getString("ShippingDate"),
                        rs.getString("DeliveryDate"),
                        rs.getString("payment")
                );
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Order> getOrdersByUserName(String UserMail) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Order] WHERE UserMail = ?";

        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, UserMail);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order(
                            rs.getInt("OrderID"),
                            rs.getInt("UserID"),
                            rs.getString("OrderDate"),
                            rs.getString("ShippingDate"),
                            rs.getString("DeliveryDate"),
                            rs.getString("Payment")
                    );
                    orders.add(order);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle specific exceptions (SQLException, etc.) separately if needed
        }
        return orders;
    }

    @Override
    public void deleteOrder(int orderId) {
        String query = "DELETE FROM orders WHERE orderId = ?";

        try (Connection conn = ConnectionController.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, orderId);
            pstmt.executeUpdate();

            System.out.println("Sipariş başarıyla silindi. OrderID: " + orderId);
        } catch (SQLException e) {
            System.err.println("Sipariş silinirken hata oluştu. OrderID: " + orderId);
            e.printStackTrace();
            // İstisna yönetimi: İstisnayı uygun şekilde işleyin veya uygun bir şekilde geri döndürün.
        } catch (Exception e) {
            System.err.println("Beklenmeyen bir hata oluştu.");
            e.printStackTrace();
            // İstisna yönetimi: İstisnayı uygun şekilde işleyin veya uygun bir şekilde geri döndürün.
        }
    }
}




