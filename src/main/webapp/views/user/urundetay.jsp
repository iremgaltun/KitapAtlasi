<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kitap Detayı</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/logo.css">
    <link rel="stylesheet" href="../css/navbar.css">
   
    <link rel="stylesheet" href="../css/scrollbar.css">
    <link rel="stylesheet" href="../css/urunler.css">
    <link rel="stylesheet" href="../css/footer.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            margin-top:40px;
            font-family: 'Poppins', sans-serif;
            padding-top: 56px;
            background-color: #f5f5f5;
        }



        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card img {
            height: 300px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .card:hover img {
            transform: scale(1.05);
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .btn-orange {
            background-color: #ff6600;
            border-color: #ff6600;
            color: white;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .btn-orange:hover {
            background-color: #ff8533;
            border-color: #ff8533;
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
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <!-- Main content -->
    <div class="container-fluid">
        <div class="row justify-content-center mt-5">
            <!-- Kitap Detayı -->
            <div class="col-md-8">
                <div class="card mb-4 shadow-sm">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="https://images-na.ssl-images-amazon.com/images/I/81eB+7+CkUL.jpg"
                                class="card-img" alt="Kitap Görseli">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Bir Avuç Mutluluk</h5>
                                <p class="card-text">Yazar: Mihri Müşfik Bey</p>
                                <p class="card-text">Fiyat: ₺19.99</p>
                                <p class="card-text">Sayfa Sayısı: 256</p>
                                <p class="card-text">Tür: Roman</p>
                                <p class="card-text">Basım Yılı: 2023</p>
                                <button type="button" class="btn btn-orange" onclick="addToCart()">Sepete Ekle</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        function addToCart() {
            // Sepete ekleme işlemi burada gerçekleştirilecek
            alert('Ürün sepete eklendi!');
        }
    </script>
</body>

</html>


