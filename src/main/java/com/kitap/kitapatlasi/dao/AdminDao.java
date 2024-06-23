package com.kitap.kitapatlasi.dao;

import com.kitap.kitapatlasi.entity.Admin;

import java.util.List;

public interface AdminDao {
    List<Admin> readingData();
    boolean addAdmin(Admin admin);
}
