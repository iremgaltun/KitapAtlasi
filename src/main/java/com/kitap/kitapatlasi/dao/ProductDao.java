package com.kitap.kitapatlasi.dao;

import com.kitap.kitapatlasi.entity.Product;

import java.util.List;

public interface ProductDao {
    List<Product> getAllProduct();
    boolean addProduct(Product product);
     boolean deleteProduct(int ProductID);
    Product getProductByName(String productName);
    List<Product> getProductsByCategoryName(String categoryName);
}
