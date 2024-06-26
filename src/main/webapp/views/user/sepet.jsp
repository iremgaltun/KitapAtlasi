<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sepetim - Kitap Atlası</title>
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

        .quantity-buttons {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .quantity-buttons button {
            background-color: #ff6600;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .quantity-buttons input {
            width: 50px;
            text-align: center;
            border: 1px solid #ddd;
            margin: 0 5px;
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

        .product-image {
            width: 50px;
            height: auto;
            margin-right: 10px;
        }

        .title-cell {
            display: flex;
            align-items: center;
        }
        /* Modal CSS */
        .modal-backdrop {
            background-color: rgba(0, 0, 0, 0.5); /* Arka plan rengi ve opaklığı */
        }

        .modal-content {
            background-color: #fff; /* Modal içeriğinin arka plan rengi */
            border-radius: 0.3rem; /* Kenar yuvarlaklığı */
            box-shadow: 0 0 1rem rgba(0, 0, 0, 0.1); /* Modalın gölgesi */
        }

        .modal-header {
            border-bottom: 1px solid #dee2e6; /* Başlık alt çizgisi */
            padding: 1rem; /* Başlık iç boşluğu */
        }

        .modal-title {
            font-size: 1.25rem; /* Başlık metin boyutu */
        }

        .modal-body {
            padding: 1rem; /* İçerik iç boşluğu */
        }

        .close {
            padding: 1rem; /* Kapatma düğmesi iç boşluğu */
        }

        .close span {
            font-size: 1.5rem; /* Kapatma düğmesi simgesi boyutu */
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
                        <a href="siparişlerim.jsp">Siparişlerim</a>
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
    <h2>Sepetim</h2>
    <table class="table">
        <thead>
        <tr>
            <th>Ürün</th>
            <th>Adet</th>
            <th>Birim Fiyatı</th>
            <th>Toplam Fiyatı</th>
            <th>İşlemler</th>
        </tr>
        </thead>
        <tbody id="cart-items">
        </tbody>
        <tfoot>
        <tr>
            <td colspan="4" class="total-amount-label">Toplam Ödenecek Tutar:</td>
            <td class="total-amount">0 TL</td>
            <td></td>
        </tr>
        </tfoot>
    </table>
    <button class="btn-confirm" onclick="confirmCart()">Sepeti Onayla</button>
</div>
<div class="modal fade" id="removeFromCartModal" tabindex="-1" role="dialog" aria-labelledby="removeFromCartModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="removeFromCartModalLabel">Ürün Sepetten Çıkarıldı</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Ürün başarıyla sepetten çıkarıldı.
            </div>
        </div>
    </div>
</div>

<!-- jQuery and Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    window.onload = function () {
        try {
            var cartItemsString = localStorage.getItem('cartItems');
            var cartItems = cartItemsString ? JSON.parse(cartItemsString) : [];

            console.log('Current cartItems:', cartItems);

            var cartTable = document.getElementById('cart-items');

            // Tüm cartItems içeriğini kontrol et
            cartItems.forEach(function (item, index) {
                var newRow = document.createElement('tr');
                newRow.id = 'row_' + index;

                var titleCell = document.createElement('td');
                titleCell.className = 'title-cell';

                var img = document.createElement('img');
                img.src = item.imageUrl;
                img.alt = item.title;
                img.className = 'product-image';
                titleCell.appendChild(img);

                var text = document.createElement('span');
                text.textContent = item.title;
                titleCell.appendChild(text);

                var quantityCell = document.createElement('td');
                var quantityDiv = document.createElement('div');
                quantityDiv.className = 'quantity-buttons';

                var decreaseButton = document.createElement('button');
                decreaseButton.textContent = '-';
                decreaseButton.onclick = function () { updateQuantity(index, -1); };
                quantityDiv.appendChild(decreaseButton);

                var quantityInput = document.createElement('input');
                quantityInput.type = 'text';
                quantityInput.value = item.quantity;
                quantityInput.id = 'quantity_' + index;
                quantityDiv.appendChild(quantityInput);

                var increaseButton = document.createElement('button');
                increaseButton.textContent = '+';
                increaseButton.onclick = function () { updateQuantity(index, 1); };
                quantityDiv.appendChild(increaseButton);

                quantityCell.appendChild(quantityDiv);

                var authorCell = document.createElement('td');
                authorCell.textContent = item.author;

                var priceCell = document.createElement('td');
                priceCell.textContent = item.price + ' TL';

                var totalPriceCell = document.createElement('td');
                totalPriceCell.className = 'total-price';
                totalPriceCell.textContent = (item.quantity * item.price) + ' TL';
                totalPriceCell.id = 'total_' + index;

                var removeButtonCell = document.createElement('td');
                var removeButton = document.createElement('button');
                removeButton.className = 'btn btn-danger';
                removeButton.textContent = 'Sepetten Çıkar';
                removeButton.setAttribute('onclick', `removeFromCart(${index})`);
                removeButtonCell.appendChild(removeButton);



                newRow.appendChild(titleCell);
                newRow.appendChild(quantityCell);
                newRow.appendChild(priceCell);
                newRow.appendChild(totalPriceCell);
                newRow.appendChild(removeButtonCell);

                cartTable.appendChild(newRow);
            });

            updateTotalAmount();

        } catch (error) {
            console.error('Error loading cart items:', error);
        }
    };

    function updateQuantity(index, change) {
        var cartItemsString = localStorage.getItem('cartItems');
        var cartItems = cartItemsString ? JSON.parse(cartItemsString) : [];

        if (cartItems[index]) {
            cartItems[index].quantity += change;

            if (cartItems[index].quantity <= 0) {
                cartItems[index].quantity = 1;
            }

            localStorage.setItem('cartItems', JSON.stringify(cartItems));
            document.getElementById('quantity_' + index).value = cartItems[index].quantity;
            document.getElementById('total_' + index).textContent = (cartItems[index].quantity * cartItems[index].price) + ' TL';

            updateTotalAmount();
        }
    }


    function removeFromCart(index) {
        try {
            var cartItems = localStorage.getItem('cartItems') ? JSON.parse(localStorage.getItem('cartItems')) : [];
            cartItems.splice(index, 1);
            localStorage.setItem('cartItems', JSON.stringify(cartItems));
            document.getElementById('row_' + index).remove(); // Satırı tablodan kaldır
            updateTotalAmount();

            // Modalı göster
            $('#removeFromCartModal').modal('show');

            // Modalı 2 saniye sonra kapat
            setTimeout(function() {
                $('#removeFromCartModal').modal('hide');
            }, 2000);
            updateTotalAmount();
        } catch (error) {
            console.error('Error removing item from cart:', error);
            location.reload();
        }
    }


    function updateTotalAmount() {
        var cartItemsString = localStorage.getItem('cartItems');
        var cartItems = cartItemsString ? JSON.parse(cartItemsString) : [];

        var totalAmount = cartItems.reduce(function (acc, item) {
            return acc + (item.quantity * item.price);
        }, 0);

        document.querySelector('.total-amount').textContent = totalAmount + ' TL';
    }

    function confirmCart() {
        try {
            var cartItems = localStorage.getItem('cartItems') ? JSON.parse(localStorage.getItem('cartItems')) : [];
            console.log('Cart confirmed:', cartItems);
            localStorage.setItem('confirmedCartItems', JSON.stringify(cartItems)); // Sakla onaylanan ürünleri
            window.location.href = 'sepetOnayla.jsp'; // Yeni sayfaya yönlendir
        } catch (error) {
            console.error('Error confirming cart:', error);
            alert('Sepet onaylanırken bir hata oluştu.');
        }
    }
</script>