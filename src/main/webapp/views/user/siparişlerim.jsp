<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Siparişlerim - Kitap Atlası</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/logo.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/scrollbar.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/dropdown.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
            padding-top: 70px;
        }

        .container {
            margin-top: 20px;
        }

        h2 {
            color: #333;
        }

        table {
            width: 100%;
            background-color: #fff;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th,
        td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            color: black;
        }

        th {
            background-color: #9fc7aa;
            color: black;
        }

        tr {
            color: black;
        }

        .product-image {
            width: 50px;
            height: 75px;
            object-fit: cover;
        }

        .total-amount {
            font-size: 12px;
            font-weight: bold;
            margin-top: 10px;
            text-align: right;
            margin-right:20px;

        }

    </style>
</head>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <a class="navbar-brand" href="kullanıcıAnasayfa.jsp">
        <img src="../../assets/images/logo.jpg" alt="Kitap Logo" class="kitap-logo">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <form class="form-inline ml-3">
                <input class="form-control mr-sm-2" type="search"
                       placeholder="kitap adı, yazar veya yayınevi ara" aria-label="Search">
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
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <div class="account-icon">
                    <i class="fas fa-user"></i>
                    <div class="account-dropdown">
                        <a href="uyelikBilgilerim.jsp">Üyelik Bilgilerim</a>
                        <a href="favorilerim.jsp">Favorilerim</a>
                        <a href="siparişlerim.jsp">Siparişlerim</a>

                        <a href="#">Yardım</a>
                        <div style="border-top: 1px solid #ddd;"></div>
                        <a href="#">Çıkış Yap</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>
<!-- Content -->
<div class="container">
    <h2>Güncel Siparişlerim</h2>
    <table class="table">
        <thead>
        <tr>
            <th>Ürün Resmi</th>
            <th>Ürün Adı</th>
            <th>Miktar</th>
            <th> Fiyat</th>
            <th>Sipariş Tarihi</th>
            <th>Sipariş Durumu</th>
            <th>Tahmini Teslimat Süresi</th>
        </tr>
        </thead>
        <tbody id="order-list">
        <!-- Here we'll dynamically add the orders -->
        </tbody>

    </table>
</div>

<!-- jQuery and Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    window.onload = function () {
        try {
            // URL'den sipariş bilgilerini al
            var urlParams = new URLSearchParams(window.location.search);
            var totalAmount = urlParams.get('totalAmount');
            var itemsString = urlParams.get('items');
            var items = itemsString ? JSON.parse(itemsString) : [];

            console.log('Retrieved totalAmount:', totalAmount);
            console.log('Retrieved items:', items);

            var orderList = document.getElementById('order-list');
            var totalPrice = 0; // Toplam fiyatı saklamak için değişken

            // Tüm siparişleri kontrol et ve tabloya ekle
            items.forEach(function (item, index) {
                var newRow = document.createElement('tr');
                newRow.id = 'order_row_' + index;

                var imageCell = document.createElement('td');
                var imgElement = document.createElement('img');
                imgElement.src = item.imageUrl; // Ürün resmi
                imgElement.alt = item.title;
                imgElement.className = 'product-image';
                imageCell.appendChild(imgElement);

                var titleCell = document.createElement('td');
                titleCell.textContent = item.title; // Ürün adı

                var quantityCell = document.createElement('td');
                quantityCell.textContent = item.quantity; // Ürün miktarı

                var totalPriceCell = document.createElement('td');
                var totalItemPrice = item.quantity * item.price;
                totalPriceCell.textContent = totalItemPrice.toFixed(2) + ' TL'; // Toplam fiyat
                totalPrice += totalItemPrice; // Toplam fiyata ekle

                var orderDateCell = document.createElement('td');
                orderDateCell.textContent = new Date().toLocaleDateString(); // Sipariş tarihi

                var orderStatusCell = document.createElement('td');
                orderStatusCell.textContent = 'Hazırlanıyor'; // Örnek olarak sabit bir sipariş durumu

                var estimatedDeliveryCell = document.createElement('td');
                estimatedDeliveryCell.textContent = '3-5 iş günü'; // Örnek olarak sabit bir tahmini teslimat süresi

                newRow.appendChild(imageCell);
                newRow.appendChild(titleCell);
                newRow.appendChild(quantityCell);
                newRow.appendChild(totalPriceCell);
                newRow.appendChild(orderDateCell);
                newRow.appendChild(orderStatusCell);
                newRow.appendChild(estimatedDeliveryCell);

                orderList.appendChild(newRow);
            });

            // Toplam ödenen tutarı güncelle
            var totalAmountElement = document.createElement('div');
            totalAmountElement.className = 'total-amount';
            totalAmountElement.innerHTML = '<h3>Toplam Ödenen Tutar: ' + totalPrice.toFixed(2) + ' TL</h3>';
            document.body.appendChild(totalAmountElement);

        } catch (error) {
            console.error('Error loading orders:', error);
            alert('Siparişler yüklenirken bir hata oluştu.');
        }
    };
</script>
</body>

</html>