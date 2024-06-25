<%@ page import="com.kitap.kitapatlasi.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kitap.kitapatlasi.dao.ProductDaoImplementation" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>





<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kitap Atlası</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/logo.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/dropdown.css">
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/sidebar.css">
    <link rel="stylesheet" href="../css/scrollbar.css">
    <link rel="stylesheet" href="../css/urunler.css">
    <style>
        .modal-content {
            border-radius: 10px;
        }

        .modal-header,
        .modal-footer {
            border: none;
        }
        main {
            margin-top: 20px; /* Ana içerik alanı ile navbar arasındaki boşluk */
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
            <form id="searchForm" class="form-inline ml-3" onsubmit="return aramaYap()">
                <input id="searchInput" class="form-control mr-sm-2" type="search" placeholder="kitap adı, yazar veya yayınevi ara"
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
                        <a href="girisyap.jsp">Çıkış Yap</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <strong>KATEGORİLER</strong>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Egitim">
                            Eğitim
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Edebiyat">
                            Edebiyat
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Roman">
                            Roman
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Cocuk%20ve%20Genclik">
                            Çocuk
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Cizgi%20Roman">
                            Çizgi Roman
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Tarih">
                            Tarih
                        </a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Yabancı%20Dil">
                            Yabancı Dil
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Felsefe">
                            Felsefe
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Kişisel+Gelisim">
                            Kişisel Gelişim
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=e-kitap">
                            e-kitap
                        </a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Bilim Kurgu">
                            Bilim Kurgu
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="KullaniciKategori.jsp?kategori=Genç Yetişkin">
                            Genç Yetişkin
                        </a>
                    </li>






                </ul>
            </div>
        </nav>

        <!-- Main content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <%
                String CategoryName ="Egitim";
                String kategori = request.getParameter("kategori");
                if (kategori != null && !kategori.isEmpty()) {
                    ProductDaoImplementation productDao = new ProductDaoImplementation();
                    List<Product> products = productDao.getProductsByCategoryName(URLDecoder.decode(kategori, "UTF-8"));

                    // Hata ayıklama için kategori ve ürün sayısını yazdırın
                    System.out.println("Seçilen Kategori: " + kategori);
                    System.out.println("Bulunan Ürün Sayısı: " + (products != null ? products.size() : 0));

                    if (products != null && !products.isEmpty()) {
            %>
            <h1><%= kategori %> Kitapları</h1>
            <div class="row">
                <% for (Product product : products) { %>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="<%= request.getContextPath() + "/assets/images/" + product.getProductImage() %>" class="card-img-top" alt="Kitap Görseli">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getProductName() %></h5>

                            <p class="card-text">Fiyat: <%= product.getProductPrice() %> TL</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="urundetay.jsp?productId=<%= product.getProductID() %>" class="btn btn-sm btn-outline-secondary">Görüntüle</a>
                                    <button type="button" class="btn btn-sm btn-orange" onclick="addToCart('<%= product.getProductName() %>', '<%= product.getProductDetail() %>', <%= product.getProductPrice() %>, '<%= request.getContextPath() + "/assets/images/" + product.getProductImage() %>')">Sepete Ekle</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <%
            } else {
            %>
            <h1><%= kategori %> Kategorisinde Ürün Bulunamadı</h1>
            <%
                }
            } else {
            %>
            <h1>Kategori Seçilmedi</h1>
            <%
                }
            %>

        </main>
    </div>

    <footer class="footer">
        <div class="container">
            <a href="#" class="back-to-top"></a>
            <div class="row footer-top">
                <div class="col-md-4">
                    <h5>Ha</h5>
                    <ul class="list-unstyled">
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#">E</a></li>
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
        function aramaYap() {
            var input, filter, div, h5, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            div = document.getElementById("Product").getElementsByClassName("col-md-4");

            for (var i = 0; i < div.length; i++) {
                h5 = div[i].getElementsByTagName("h5")[0];
                if (h5) {
                    txtValue = h5.textContent || h5.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        div[i].style.display = "";
                    } else {
                        div[i].style.display = "none";
                    }
                }
            }
            return false;
        }

        function addToCart(title, author, price, imageUrl, quantity = 1) {
            var item = {
                "title": title,
                "author": author,
                "price": price,
                "imageUrl": imageUrl,  // Ürün resmini ekliyoruz
                "quantity": quantity
            };

            try {
                // localStorage'den mevcut sepet öğelerini alıyoruz veya boş bir dizi oluşturuyoruz
                var cartItems = localStorage.getItem('cartItems') ? JSON.parse(localStorage.getItem('cartItems')) : [];

                // Eğer sepet öğeleri içinde aynı başlık, yazar ve fiyatta bir öğe varsa, miktarı artırıyoruz
                var existingItem = cartItems.find(item => item.title === title && item.author === author && item.price === price);
                if (existingItem) {
                    existingItem.quantity += quantity;
                } else {
                    // Yoksa yeni öğeyi sepete ekliyoruz
                    cartItems.push(item);
                }

                // Güncellenmiş sepet öğelerini localStorage'e kaydediyoruz
                localStorage.setItem('cartItems', JSON.stringify(cartItems));
                console.log('Updated cartItems:', cartItems);

                // Sepete ekleme modalını gösteriyoruz
                $('#addToCartModal').modal('show');
                setTimeout(function() {
                    $('#addToCartModal').modal('hide');
                }, 1000); // 2 saniye sonra modalı gizliyoruz
            } catch (error) {
                console.error('Error adding item to cart:', error);
                alert('Sepete Ürün Ekleyebilmek İçin Giriş yapınız.Hesabınız Yoksa Üye Olunuz');
            }
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</div>
</div>
</body>

</html>
