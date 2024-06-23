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
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            margin-top: 100px;
        }
        .login-form {
            max-width: 400px;
            background: #ffffff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .form-title {
            text-align: center;
            margin-bottom: 30px;
            color: orange;
        }
        .form-control {
            margin-bottom: 20px;
        }
        .btn-orange {
            background-color: orange;
            color: white;
        }
    </style>
</head>
<body>
<div class="container login-container">
    <div class="login-form">
        <h2 class="form-title">Yönetici Girişi</h2>
        <form method="post" action="musteriyonetim.jsp">
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
                HttpSession a = request.getSession();
                a.setAttribute("loggedInAdmin", adminMail);
                response.sendRedirect("musteriyonetim.jsp");
            } else {
                // Show error message if authentication fails
        %>
        <div class="alert alert-danger" role="alert">
            Giriş başarısız. Lütfen email ve şifrenizi kontrol edin.
        </div>
        <%
                }
            } %>

    </div>
</div>
</body>
</html>
