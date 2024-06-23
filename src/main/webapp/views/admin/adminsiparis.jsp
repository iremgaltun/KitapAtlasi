<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kitap.kitapatlasi.entity.Order" %>
<%@ page import="com.kitap.kitapatlasi.dao.OrderDao" %>
<%@ page import="com.kitap.kitapatlasi.dao.OrderDaoImplementation" %>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yönetim Paneli - Siparişler</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/adminPanel.css">
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

<!-- Main content -->
<div class="container mt-4">
    <h2>Sipariş Yönetimi</h2>
    <div class="row mt-3">
        <div class="col-md-4 mb-3">
            <input type="text" class="form-control" id="searchInput" placeholder="Sipariş Ara">
        </div>
        <div class="col-md-4 mb-3">
            <button class="btn btn-orange btn-small btn-block" onclick="searchOrders()">Ara</button>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-striped" id="Order">
            <thead>
            <tr>
                <th>Siparis ID</th>
                <th>Müşteri ID</th>
                <th>Sipariş Tarihi</th>
                <th>Kargolama Tarihi</th>
                <th>Ödeme Tipi</th>
                <th>İşlemler</th>
            </tr>
            </thead>
            <tbody>
            <!-- Dinamik Siparişlerin Listelenmesi -->
            <%
                OrderDao orderDao = new OrderDaoImplementation();
                List<Order> orders = orderDao.getOrderDao();
                for (Order order : orders) {
            %>
            <tr>
                <td><%= order.getOrderID() %></td>
                <td><%= order.getUserID() %></td>
                <td><%= order.getOrderDate() %></td>
                <td><%= order.getShippingDate() %></td>
                <td><%= order.getPayment() %></td>
                <td>
                    <button class="btn btn-sm btn-outline-primary">Görüntüle</button>
                    <button class="btn btn-sm btn-outline-warning">Düzenle</button>

                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer class="footer bg-dark text-white py-3">
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
    function deleteOrder(orderId) {
        if (confirm("Bu siparişi silmek istediğinizden emin misiniz?")) {
            window.location.href = 'deleteOrder?orderId=' + orderId;
        }
    }

    function searchOrders() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("Order");
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0]; // Sipariş ID sütunu
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>
</body>
</html>
