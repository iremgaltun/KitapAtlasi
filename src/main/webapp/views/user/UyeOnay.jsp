<%@ page import="com.kitap.kitapatlasi.dao.UserDao" %>
<%@ page import="com.kitap.kitapatlasi.entity.User" %>
<%@ page import="com.kitap.kitapatlasi.dao.UserDaoImplementation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String ad = request.getParameter("Ad");
    String soyad = request.getParameter("Soyad");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String password2 = request.getParameter("password2");

    // Validate input data
    if (ad == null || ad.isEmpty() || soyad == null || soyad.isEmpty() ||
            email == null || email.isEmpty() || password == null || password.isEmpty() ||
            !password.equals(password2)) {
        response.sendRedirect("uyeol.jsp?registration=error");
        return;
    }

    UserDaoImplementation userDao = new UserDaoImplementation();
    User newUser = new User();
    newUser.setName(ad);
    newUser.setLastName(soyad);
    newUser.setMail(email);
    newUser.setPassword(password);

    boolean registrationSuccessful = userDao.addUser(newUser);

    if (registrationSuccessful) {
        response.sendRedirect("girisyap.jsp?registration=success");
    } else {
        response.sendRedirect("uyeol.jsp?registration=fail");
    }
%>