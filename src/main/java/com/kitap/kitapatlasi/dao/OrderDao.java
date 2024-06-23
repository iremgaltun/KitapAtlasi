package com.kitap.kitapatlasi.dao;

import com.kitap.kitapatlasi.entity.Order;

import java.util.List;

public interface OrderDao {
    List<Order> getOrderDao();
    List<Order> getOrdersByUserName(String userMail);
    void deleteOrder(int orderId);}

