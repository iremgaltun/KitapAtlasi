<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.kitap.kitapatlasi.dao.UserDaoImplementation" %>
<%@ page import="com.kitap.kitapatlasi.entity.User" %>
<%@ page import="com.kitap.kitapatlasi.dao.UserDao" %>
<%@ page import="java.util.List" %>









<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yönetim Paneli</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/adminPaneli.css">
    <style>
        .btn-orange {
            background-color: orange;
            color: white;
        }
        .btn-small {
            font-size: 0.8rem;
            padding: 5px 10px;
        }
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Yönetim Paneli</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="adminPaneli.jsp">Ürünler</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="musteriyonetim.jsp">Müşteriler</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminsiparis.jsp">Siparişler</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminGiris.jsp">Çıkış Yap</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Müşteri Yönetimi -->
        <h2>Müşteri Yönetimi</h2>
        <div class="table-responsive mt-3">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Kullanıcı ID</th>
                    <th>Ad</th>
                    <th>Soyad</th>
                    <th>Email</th>
                    <th>Şifre</th>
                    <th>Adres</th>
                    <th>İşlemler</th>
                </tr>
                </thead>
                <tbody>
                <%
                    // UserDaoImplementation sınıfını kullanarak tüm kullanıcıları al
                    UserDaoImplementation userDao = new UserDaoImplementation();
                    List<User> users = userDao.getUserDao();

                    // Tüm kullanıcıları döngü ile listele
                    for (User user : users) {
                %>
                <tr>
                     <td><%=user.getUserID()%></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getLastName() %></td>
                    <td><%= user.getMail() %></td>
                    <td><%= user.getPassword() %></td>
                    <td><%= user.getAddress() %></td>
                    <td>
                        <button class="btn btn-sm btn-outline-warning">Düzenle</button>
                        <button class="btn btn-sm btn-outline-danger" onclick="deleteUser(<%= user.getUserID()  %>)">Sil</button>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <!-- Footer -->
    <footer class="footer mt-auto py-3 bg-dark text-white">
        <div class="container text-center">
            <p>&copy; 2024 Kitap Atlası. Tüm hakları saklıdır.</p>
        </div>
    </footer>

    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Custom Script -->
    <script>
        function deleteUser(userId) {
            if (confirm("Bu ürünü silmek istediğinizden emin misiniz?")) {
                // Yönlendirme yapılacak URL'i oluşturun
                var url = "MusteriSil.jsp?userId=" + userId;

                // Yönlendirme işlemi
                window.location.href = url;
            }
        }
    </script>
</body>
</html>
