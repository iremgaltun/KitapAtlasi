package com.kitap.kitapatlasi.dao;

import com.kitap.kitapatlasi.entity.User;

import java.util.List;

public interface UserDao {

     List<User> getUserDao();
    boolean addUser(User user);
    boolean deleteUser(int UserID);
    boolean isUserExists(String email);
    boolean ControlUser(User user);
}
