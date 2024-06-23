package com.kitap.kitapatlasi.entity;

public class Product {
    private int productID;
    private String productName;
    private String productDetail;
    private double productPrice;
    private String productImage;
    private int categoryID;

    // Constructor, getters, and setters

    public Product(int productID, String productName, String productDetail, double productPrice, String productImage, int categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.productDetail = productDetail;
        this.productPrice = productPrice;
        this.productImage = productImage;
        this.categoryID = categoryID;
    }

    public Product() {


    }



    public Product(String productName, String productDetail, double productPrice, String productImage, int categoryID) {
        this.productName = productName;
        this.productDetail = productDetail;
        this.productPrice = productPrice;
        this.productImage = productImage;
        this.categoryID = categoryID;
    }


    // Getters and setters

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
}