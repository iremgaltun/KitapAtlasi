<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sepet Onaylama - Kitap Atlası</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/logo.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/sidebar.css">
    <link rel="stylesheet" href="../css/scrollbar.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/dropdown.css">
    <link rel="stylesheet" href="../css/home.css">

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

        .total-price {
            font-weight: bold;
            color: #ff6600;
        }

        .btn-confirm {
            background-color: #ff6600;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 20px;
        }

        .btn-confirm:hover {
            background-color: #ff4500;
        }

        .total-amount-label {
            font-weight: bold;
            color: #333;
            text-align: right;
        }

        .total-amount {
            font-weight: bold;
            color: #ff6600;
        }

        .address-form {
            margin-top: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .payment-info {
            margin-top: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            width: 50px;
            height: 75px;
            object-fit: cover;
        }

        /* Modal Styles */
        .modal-content {
            border-radius: 10px;
        }

        .modal-header,
        .modal-footer {
            border: none;
        }

        .modal-footer .btn {
            background-color: #ff6600;
            color: white;
        }

        .modal-footer .btn:hover {
            background-color: #ff4500;
        }
    </style>
</head>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <a class="navbar-brand" href="kullaniciAnasayfa.jsp">
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
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <div class="account-icon">
                    <i class="fas fa-user"></i>
                    <div class="account-dropdown">
                        <a href="#">Hesabım</a>
                        <a href="#">Favorilerim</a>
                        <a href="#">Siparişlerim</a>
                        <a href="üyelikBilgilerim.jsp">Üyelik Bilgilerim</a>
                        <a href="#">Çıkış Yap</a>

                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>

<!-- Content -->
<div class="container">
    <h2>Sepet Onayla</h2>
    <table class="table">
        <thead>
        <tr>
            <th>Ürün</th>
            <th></th>
            <th>Adet</th>
            <th></th>
            <th>Birim Fiyatı</th>
            <th>Toplam Fiyatı</th>
        </tr>
        </thead>
        <tbody id="confirm-cart-items">
        <!-- Here we'll dynamically add the confirmed cart items -->
        </tbody>
        <tfoot>
        <tr>
            <td colspan="5" class="total-amount-label">Toplam Ödenecek Tutar:</td>
            <td class="total-amount">0 TL</td>
        </tr>
        </tfoot>
    </table>

    <!-- Address and Payment Information -->
    <div class="address-form">
        <h3>Adres Bilgileri</h3>

        <div class="form-group">
            <label for="address">Adres</label>
            <input type="text" id="address" name="address" class="form-control" value="yeşil yurt  Mah. 123. Sok. No:45">
        </div>
        <div class="form-group">
            <label for="city">Şehir</label>
            <input type="text" id="city" name="city" class="form-control" value="Adana">
        </div>
        <div class="form-group">
            <label for="phone">Telefon</label>
            <input type="text" id="phone" name="phone" class="form-control" value="05368704202">
        </div>
    </div>

    <div class="payment-info">
        <h3>Ödeme Bilgileri</h3>
        <div class="form-group">
            <label for="card-number">Kredi Kartı Numarası</label>
            <input type="text" id="card-number" name="card-number" class="form-control" value="434512345678987">
        </div>
        <div class="form-group">
            <label for="expiry-date">Son Kullanma Tarihi</label>
            <input type="text" id="expiry-date" name="expiry-date" class="form-control" value="09/28">
        </div>
        <div class="form-group">
            <label for="cvv">CVV Kodu</label>
            <input type="text" id="cvv" name="cvv" class="form-control" value="610">
        </div>
    </div>
    <!-- Finalize Order Button -->
    <button class="btn-confirm" onclick="finalizeOrder()">Siparişi Tamamla</button>
</div>

<!-- Confirmation Modal -->
<div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmationModalLabel">Tebrikler Siparişiniz Alındı!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Siparişiniz başarıyla alınmıştır. Siparişlerim sayfasına gitmek için aşağıdaki butona tıklayabilirsiniz.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="redirectToOrders()">Siparişlerim Sayfasına Git</button>
            </div>
        </div>
    </div>
</div>
<!-- jQuery and Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    var order; // Global olarak order değişkenini tanımlıyoruz

    window.onload = function () {
        try {
            var cartItemsString = localStorage.getItem('cartItems');
            var cartItems = cartItemsString ? JSON.parse(cartItemsString) : [];

            console.log('Current cartItems:', cartItems);

            var confirmCartTable = document.getElementById('confirm-cart-items');

            // Tüm cartItems içeriğini kontrol et
            cartItems.forEach(function (item, index) {
                var newRow = document.createElement('tr');
                newRow.id = 'row_' + index;

                var titleCell = document.createElement('td');
                titleCell.textContent = item.title;

                var imageCell = document.createElement('td');
                var imgElement = document.createElement('img');
                imgElement.src = item.imageUrl;
                imgElement.alt = item.title;
                imgElement.className = 'product-image';
                imageCell.appendChild(imgElement);

                var quantityCell = document.createElement('td');
                quantityCell.textContent = item.quantity;

                var authorCell = document.createElement('td');
                authorCell.textContent = item.author;

                var priceCell = document.createElement('td');
                priceCell.textContent = item.price + ' TL';

                var totalPriceCell = document.createElement('td');
                totalPriceCell.className = 'total-price';
                totalPriceCell.textContent = (item.quantity * item.price) + ' TL';

                newRow.appendChild(titleCell);
                newRow.appendChild(imageCell);
                newRow.appendChild(quantityCell);
                newRow.appendChild(authorCell);
                newRow.appendChild(priceCell);
                newRow.appendChild(totalPriceCell);

                confirmCartTable.appendChild(newRow);
            });

            updateTotalAmount(); // Toplam tutarı güncelleyen fonksiyonu çağır

        } catch (error) {
            console.error('Error loading cart items:', error);
            alert('Sepet yüklenirken bir hata oluştu.');
        }
    };

    function updateTotalAmount() {
        try {
            var totalAmount = 0;
            var rows = document.querySelectorAll('#confirm-cart-items tr');
            rows.forEach(function (row) {
                var totalPrice = parseFloat(row.querySelector('.total-price').innerText.replace(' TL', ''));
                totalAmount += totalPrice;
            });
            document.querySelector('.total-amount').innerText = totalAmount.toFixed(2) + ' TL'; // Toplam tutarı güncelle
        } catch (error) {
            console.error('Error updating total amount:', error);
        }
    }

    function finalizeOrder() {
        try {
            // Sepet öğelerini localStorage'dan al
            var cartItemsString = localStorage.getItem('cartItems');
            var cartItems = cartItemsString ? JSON.parse(cartItemsString) : [];

            var address = document.getElementById('address').value.trim();
            var city = document.getElementById('city').value.trim();
            var phone = document.getElementById('phone').value.trim();
            var cardNumber = document.getElementById('card-number').value.trim();
            var expiryDate = document.getElementById('expiry-date').value.trim();
            var cvv = document.getElementById('cvv').value.trim();

            // Basit doğrulama - zorunlu alanları kontrol et
            if (!address || !city || !phone || !cardNumber || !expiryDate || !cvv) {
                alert('Lütfen tüm alanları doldurun.');
                return;
            }

            // Sipariş bilgilerini hazırla
            order = {
                items: cartItems,
                totalAmount: document.querySelector('.total-amount').innerText,
                address: {
                    address: address,
                    city: city,
                    phone: phone
                },
                payment: {
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cvv: cvv
                }
            };

            console.log('Order finalized:', order);

            // Modalı göster
            $('#confirmationModal').modal('show');

        } catch (error) {
            console.error('Error finalizing order:', error);
            alert('Sipariş tamamlanırken bir hata oluştu: ' + error.message);
        }
    }

    function redirectToOrders() {
        try {
            var url = 'siparişlerim.jsp';
            url += '?totalAmount=' + encodeURIComponent(order.totalAmount);
            url += '&items=' + encodeURIComponent(JSON.stringify(order.items));
            console.log('Redirecting to:', url);
            window.location.href = url;

            // Sipariş tamamlandıktan sonra sepeti temizle
            localStorage.removeItem('cartItems');

        } catch (error) {
            console.error('Error redirecting to orders:', error);
            alert('Siparişlerim sayfasına yönlendirilirken bir hata oluştu.');
        }
    }
</script>
</body>
</html>