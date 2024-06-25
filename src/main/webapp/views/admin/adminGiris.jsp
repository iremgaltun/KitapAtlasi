<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kitap.kitapatlasi.dao.AdminDaoImplementation" %>
<%@ page import="com.kitap.kitapatlasi.entity.Admin" %>
<%@ page import="jakarta.servlet.http.*" %>








<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yönetici Girişi</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <link rel="stylesheet" href="../css/girisuye.css">
</head>
<body>
<div class="container login-container">
    <div class="login-form">
        <h2 class="form-title">Yönetici Girişi</h2>
        <form method="post" action="adminGiris.jsp">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Şifre:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-orange btn-block">Giriş Yap</button>
        </form>
        <%-- JSP Scriptlet: Handle form submission --%>
        <% if ("POST".equalsIgnoreCase(request.getMethod())) {
            String adminMail = request.getParameter("email");
            String adminPassword = request.getParameter("password");

            Admin admin = new Admin(adminMail, adminPassword);
            AdminDaoImplementation dao = new AdminDaoImplementation();

            if (dao.control(admin)) {
                // Set session attribute and redirect
                HttpSession sess = request.getSession(true); // true to create new session if doesn't exist
                sess.setAttribute("loggedInAdmin", adminMail);
                response.sendRedirect("adminPaneli.jsp"); // Redirect to admin panel or dashboard
            } else {
        %>
        <div class="alert alert-danger" role="alert">
            Giriş başarısız. Lütfen email ve şifrenizi kontrol edin.
        </div>
        <% } } %> <!-- End of form submission handling -->
    </div>
</div>
</body>
</html>