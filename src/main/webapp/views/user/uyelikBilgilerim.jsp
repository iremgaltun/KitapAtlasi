<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kitap Atlası</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery and Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/logo.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/dropdown.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/scrollbar.css">

    <style>
        .container-content {
            margin-top: 110px;
        }

        .btn-group .btn {
            background-color: white;
            border: 2px solid orange;
            color: black;
            border-radius: 5px;
            margin-right: 5px;
        }

        .btn-group .btn.active {
            background-color: orange;
            color: white;
        }

        .tab-content {
            background-color: white;
            padding: 20px;
            border: 2px solid orange;
            border-radius: 5px;
            margin-top: 20px;
        }

        .form-container {
            padding: 20px;
            background-color: white;
            border: 2px solid orange;
            border-radius: 5px;
        }

        .btn-primary-custom {
            background-color: orange;
            border: none;
            color: white;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <a class="navbar-brand" href="#">
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
<div class="container container-content">

    <div class="btn-group" role="group" aria-label="Üyelik Bilgileri">
        <button type="button" class="btn active" data-target="#personal-info">Kişisel Bilgilerim</button>
        <button type="button" class="btn" data-target="#address-info">Adres Bilgilerim</button>
        <button type="button" class="btn" data-target="#change-password">Şifre Değişikliği</button>
        <button type="button" class="btn" data-target="#payment-info">Ödeme Bilgilerim</button>
    </div>

    <div class="tab-content">
        <!-- Kişisel Bilgilerim -->
        <div id="personal-info" class="tab-pane active form-container">
            <h2>Kişisel Bilgilerim</h2>
            <form>
                <div class="form-group">
                    <label for="name">Ad</label>
                    <input type="text" class="form-control" id="name" value="Demet">
                </div>
                <div class="form-group">
                    <label for="surname">Soyad</label>
                    <input type="text" class="form-control" id="surname" value="Öztaş">
                </div>
                <div class="form-group">
                    <label for="email">E-posta Adresi</label>
                    <input type="email" class="form-control" id="email" value="oztasdemet0@gmail.com">
                </div>
                <div class="form-group">
                    <label for="phone">Telefon Numarası</label>
                    <input type="tel" class="form-control" id="phone" value="05368704202">
                </div>
                <button type="button" class="btn btn-primary-custom">Kişisel Bilgilerimi Güncelle</button>
            </form>
        </div>

        <!-- Adres Bilgilerim -->
        <div id="address-info" class="tab-pane form-container">
            <h2>Adres Bilgilerim</h2>
            <form>
                <div class="form-group">
                    <label for="address">Adres</label>
                    <input type="text" class="form-control" id="address" value="Ornek Mah. 123. Sok. No:45">
                </div>
                <div class="form-group">
                    <label for="city">Şehir</label>
                    <input type="text" class="form-control" id="city" value="İstanbul">
                </div>
                <div class="form-group">
                    <label for="zipcode">Posta Kodu</label>
                    <input type="text" class="form-control" id="zipcode" value="34000">
                </div>
                <button type="button" class="btn btn-primary-custom">Adres Bilgilerimi Güncelle</button>
            </form>

            <!-- Kayıtlı adresler burada listelenecek -->
        </div>

        <!-- Şifre Değişikliği -->
        <div id="change-password" class="tab-pane form-container">
            <h2>Şifre Değişikliği</h2>
            <form>
                <div class="form-group">
                    <label for="current-password">Mevcut Şifre</label>
                    <input type="password" class="form-control" id="current-password">
                </div>
                <div class="form-group">
                    <label for="new-password">Yeni Şifre</label>
                    <input type="password" class="form-control" id="new-password">
                </div>
                <div class="form-group">
                    <label for="confirm-password">Yeni Şifre Onayı</label>
                    <input type="password" class="form-control" id="confirm-password">
                </div>
                <button type="button" class="btn btn-primary-custom">Şifreyi Güncelle</button>
            </form>
        </div>

        <!-- Ödeme Bilgilerim -->
        <div id="payment-info" class="tab-pane form-container">
            <h2>Ödeme Bilgilerim</h2>
            <form>
                <div class="form-group">
                    <label for="card-number">Kredi Kartı Numarası</label>
                    <input type="text" class="form-control" id="card-number" value="1234 5678 9101 1121">
                </div>
                <div class="form-group">
                    <label for="expiry-date">Son Kullanma Tarihi</label>
                    <input type="text" class="form-control" id="expiry-date" value="12/25">
                </div>
                <div class="form-group">
                    <label for="cvv">CVV</label>
                    <input type="text" class="form-control" id="cvv" value="123">
                </div>
                <button type="button" class="
btn btn-primary-custom">Ödeme Bilgilerimi Güncelle</button>
            </form>

            <!-- Kayıtlı kartlar burada listelenecek -->
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        $('.btn-group .btn').click(function () {
            $('.btn-group .btn').removeClass('active');
            $(this).addClass('active');

            var target = $(this).data('target');
            $('.tab-pane').removeClass('active');
            $(target).addClass('active');
        });

        // Event handlers for updating personal info, address info, and payment info
        $('button:contains("Kişisel Bilgilerimi Güncelle")').click(function () {
            alert("Kişisel bilgileriniz güncellendi!");
            // Handle the update process here
        });

        $('button:contains("Adres Bilgilerimi Güncelle")').click(function () {
            alert("Adres bilgileriniz güncellendi!");
            // Handle the update process here
        });

        $('button:contains("Ödeme Bilgilerimi Güncelle")').click(function () {
            alert("Ödeme bilgileriniz güncellendi!");
            // Handle the update process here
        });
    });
</script>
</body>

</html>
