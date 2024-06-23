package com.kitap.kitapatlasi.entity;

public class User {
    private int userID;
    private String name;
    private String lastName;
    private String mail;
    private String password;
    private String address;

    // Constructor with all fields
    public User(int userID, String name, String lastName, String mail, String password, String address) {
        this.userID = userID;
        this.name = name;
        this.lastName = lastName;
        this.mail = mail;
        this.password = password;
        this.address = address;
    }

    // Empty constructor
    public User() {
    }

    // Constructor with mail and password (used for login purposes)
    public User(String mail, String password) {
        this.mail = mail;
        this.password = password;
    }

    // Getter and setter methods
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
