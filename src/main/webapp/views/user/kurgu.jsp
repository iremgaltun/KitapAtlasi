<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kurgu Kitapları</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/logo.css">
    <link rel="stylesheet" href="../css/scrollbar.css">
    <link rel="stylesheet" href="../css/urunler.css">
    <link rel="stylesheet" href="../css/sidebar.css">
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');



        body {
            font-family: 'Poppins', sans-serif;
            padding-top: 56px;
            margin-top: 70px;
            background-color: #f5f5f5;
        }

        .account-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: gray;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }
.account-dropdown {
    position: absolute;
    top: calc(100% + 5px);
    left: 50%;
    transform: translateX(-50%);
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    width: 200px; /* Menü genişliği düzenlendi */
    height: 250px; /* Menü yüksekliği düzenlendi */
    z-index: 1000;
    display: none; /* Varsayılan olarak gizli */
}

.account-dropdown .account-dropdown-header {
    font-weight: bold;
    padding: 8px 12px;
    background-color: #f5f5f5;
    border-bottom: 1px solid #ddd;
    height: 50px; /* Başlık yüksekliği */
    display: flex;
    align-items: center;
    justify-content: center;
}

.account-dropdown a {
    display: block;
    padding: 8px 12px;
    text-decoration: none;
    color: #333;
    transition: background-color 0.3s ease, color 0.3s ease;
    border-bottom: 1px solid #ddd; /* Ayrım çizgileri eklendi */
    height: 50px; /* Her sekmenin yüksekliği */
    display: flex;
    align-items: center;
}

.account-dropdown a:last-child {
    border-bottom: none; /* Son öğedeki kenarlık kaldırıldı */
}

.account-dropdown a:hover {
    background-color: #9fc7aa;
    color: white;
}

.account-icon:hover .account-dropdown {
    display: block; /* Üzerine gelince dropdown göster */
}

        .navbar-nav .form-inline {
            display: flex;
            align-items: center;
        }

        .navbar-nav .form-inline input {
            border-radius: 30px;
            border: 2px solid orange;
        }

        .navbar-nav .form-inline button {
            border-radius: 20px;
            border: 2px solid orange;
            margin-left: 10px;
        }

        .navbar-nav .btn-light {
            border: 2px solid orange;
            border-radius: 20px;
            margin-left: 10px;
        }
    </style>
    
</head>
<body>
<!-- Navbar -->
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
                    </div>
                </li>
            </ul>
        </div>
    </nav>
<!-- Main content -->
<div class="container mt-5 pt-5">
    <h1 class="my-4">Kurgu Kitapları</h1>
    <div class="row">
        <!-- Kitap 1 -->
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <img src="https://images-na.ssl-images-amazon.com/images/I/81eB+7+CkUL.jpg" class="card-img-top" alt="Kitap Görseli">
                <div class="card-body">
                    <h5 class="card-title">Bir Avuç Mutluluk</h5>
                    <p class="card-text">Yazar: Mihri Müşfik Bey</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="redirectToUrunDetay()">Görüntüle</button>
                            <button type="button" class="btn btn-sm btn-orange">Sepete Ekle</button>
                        </div>
                        <small class="text-muted">₺19.99</small>
                    </div>
                </div>
            </div>
        </div>
        <!-- Diğer kitaplar burada listelenebilir -->
    </div>
</div>
<!-- Footer -->
<footer class="footer">
    <div class="container">
        <a href="#" class="back-to-top">Başa Dön</a>
        <div class="row footer-top">
            <div class="col-md-4">
                <h5>Hakkımızda</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Kariyer</a></li>
                    <li><a href="#">İletişim</a></li>
                    <li><a href="#">Müşteri Hizmetleri</a></li>
                    <li><a href="#">Erişebilirlik</a></li>
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
<!-- JavaScript -->
<script>
    function redirectToUrunDetay() {
        window.location.href = "urundetay.jsp";
    }
    // Footer'ı sadece sayfa en altına inildiğinde göster
    window.onscroll = function () {
        var footer = document.querySelector('.footer');
        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
            footer.style.display = 'block';
        } else {
            footer.style.display = 'none';
        }
    };
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
