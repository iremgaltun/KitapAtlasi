<%@ page import="com.kitap.kitapatlasi.entity.User" %>
<%@ page import="com.kitap.kitapatlasi.dao.UserDaoImplementation" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kitap Atlası - Giriş Yap</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../css/logo.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/girisuye.css">
    <link rel="stylesheet" href="../css/scrollbar.css">
    <link rel="stylesheet" href="../css/snackbar.css">
    <style>
        .footer {
            margin-top: 300px;
        }
        .admin-link {
            position: fixed;
            bottom: 10px;
            right: 10px;
            font-size: 12px;
            color: gray;
        }
        .admin-link a {
            color: gray;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <a class="navbar-brand" href="AnaSayfa.jsp">
        <img src="../../assets/images/logo.jpg" alt="Kitap Logo" class="kitap-logo">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <form class="form-inline ml-3">
                <input class="form-control mr-sm-2" type="search" placeholder="kitap adı, yazar veya yayınevi ara"
                       aria-label="Search">
                <button class="btn btn-light my-2 my-sm-0" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
            <li class="nav-item">
                <a class="nav-link" href="sepet.jsp">
                    <button type="button" class="btn btn-light">
                        <i class="fas fa-shopping-cart"></i> Sepet
                    </button>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="uyeol.jsp">
                    <button type="button" class="btn btn-light">Üye Ol</button>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="girisyap.jsp">
                    <button type="button" class="btn btn-light">Giriş Yap</button>
                </a>
            </li>
        </ul>
    </div>
</nav>


<!-- Giriş Yap Formu -->
<div class="container mt-5">
    <div class="login-container">
        <h2 class="mb-4 text-center">Giriş Yap</h2>
        <form method="POST" action="kullanıcıAnasayfa.jsp">
            <div class="form-group">
                <label for="email">E-posta Adresi</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="E-posta adresinizi girin" required>
            </div>
            <div class="form-group">
                <label for="password">Şifre</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Şifrenizi girin" required>
            </div>
            <button type="submit" class="btn btn-orange btn-block">Giriş Yap</button>
        </form>

        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String mail = request.getParameter("email");
                String password = request.getParameter("password");

                User user = new User(mail, password);
                UserDaoImplementation userDaoImplementation = new UserDaoImplementation();

                if (userDaoImplementation.ControlUser(user)) {
                    // Set session attribute and redirect
                    HttpSession a = request.getSession(true);
                    a.setAttribute("loggedInUser", mail);
                    response.sendRedirect("kullanıcıAnasayfa.jsp");
                } else {
                    // Show error message if authentication fails
        %>
        <div class="alert alert-danger" role="alert">
            Giriş başarısız. Lütfen email ve şifrenizi kontrol edin.
        </div>
        <%
                }
            }
        %>
        <div class="signup-link">
            Hesabın yok mu? <a href="uyeol.jsp">Üye ol</a>
        </div>
    </div>
</body>
</html>

<!-- Snackbar -->
<div id="snackbar">Giriş yapıldı</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <a href="#" class="back-to-top"></a>
        <div class="row footer-top">
            <div class="col-md-4">
                <h5>Hakkımızda</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Müşteri Hizmetleri</a></li>
                    <li><a href="#">İletişim Bilgileri</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Ödeme Araçları</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Kredi Kartı</a></li>
                    <li><a href="#">Taksitli Ödeme</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>İletişim</h5>
                <ul class="list-unstyled">
                    <li><a href="mailto:info@kitapatlasi.com"><i class="fas fa-envelope"></i> info@kitapatlasi.com</a></li>
                    <li><a href="tel:+901234567890"><i class="fas fa-phone"></i> +90 123 456 78 90</a></li>
                </ul>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                </div>
            </div>
        </div>
        <p class="text-center">&copy; 2024 Kitap Atlası. Tüm hakları saklıdır.</p>
    </div>
</footer>

<!-- Admin Girişi -->
<div class="admin-link">
    <a href="../admin/adminGiris.jsp">Yönetici Girişi</a>
</div>

<!-- JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
