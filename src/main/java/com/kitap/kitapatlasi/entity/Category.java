package com.kitap.kitapatlasi.entity;

public class Category {
    private int categoryID;
    private String categoryName;

    // Default constructor
    public Category() {
    }

    // Parameterized constructor
    public Category(String categoryName) {
        this.categoryName = categoryName;
    }

    // Getter and setter for categoryID
    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    // Getter and setter for categoryName

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "Category" +

                ", categoryName='" + categoryName + '\'' ;
    }
}
