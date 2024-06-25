<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kitap.kitapatlasi.entity.Product" %>
<%@ page import="com.kitap.kitapatlasi.dao.ProductDao" %>
<%@ page import="com.kitap.kitapatlasi.dao.ProductDaoImplementation" %>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yönetim Paneli - Ürünler</title>
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

<!-- Main content -->
<div class="container mt-4">
    <h2>Ürün Yönetimi</h2>
    <div class="row mt-3">
        <div class="col-md-4 mb-3">
            <button class="btn btn-orange btn-block" data-toggle="modal" data-target="#modalYeniUrun">Yeni Ürün Ekle</button>
        </div>
        <div class="col-md-4 mb-3">
            <input
                    type="text" class="form-control" id="urunAdiAra" placeholder="Ürün Adı Ara">
        </div>
        <div class="col-md-4 mb-3">
            <button class="btn btn-primary btn-block" onclick="ara()">Ara</button>
        </div>
    </div>
    <!-- Ürünler Tablosu -->
    <div class="table-responsive">
        <table id="Product" class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Ürün Adı</th>
                <th>Ürün Detayı</th>
                <th>Ürün Fiyatı</th>
                <th>KategoriID</th>
                <th>İşlemler</th>
            </tr>
            </thead>
            <tbody>
            <%
                ProductDaoImplementation productDao = new ProductDaoImplementation();
                List<Product> productList = productDao.getAllProduct();
                for (Product product : productList) {
            %>
            <tr>
                <td><%= product.getProductID() %></td>
                <td><%= product.getProductName() %></td>
                <td><%= product.getProductDetail() %></td>
                <td><%= product.getProductPrice() %></td>
                <td><%= product.getCategoryID() %></td>
                <td>
                    <button class="btn btn-sm btn-outline-warning">Düzenle</button>
                    <button class="btn btn-sm btn-outline-danger" onclick="deleteProduct(<%= product.getProductID() %>)">Sil</button>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Yeni Ürün Ekle Modal -->
<!-- Yeni Ürün Ekle Modal -->
<div class="modal fade" id="modalYeniUrun" tabindex="-1" role="dialog" aria-labelledby="modalYeniUrunLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalYeniUrunLabel">Yeni Ürün Ekle</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formYeniUrun" action="UrunEkle.jsp" method="post">
                    <div class="form-group">
                        <label for="urunAdi">Ürün Adı</label>
                        <input type="text" class="form-control" id="urunAdi" name="urunAdi" required>
                    </div>
                    <div class="form-group">
                        <label for="urunDetayi">Ürün Detayı</label>
                        <input type="text" class="form-control" id="urunDetayi" name="urunDetayi" required>
                    </div>
                    <div class="form-group">
                        <label for="urunFiyati">Fiyat</label>
                        <input type="number" step="0.01" min="0" class="form-control" id="urunFiyati" name="urunFiyati" required>
                    </div>
                    <div class="form-group">
                        <label for="kategori">Ürünün Kategorisi</label>
                        <select class="form-control" id="kategori" name="kategori" required>
                            <option value="">Kategori Seç</option>
                            <!-- Kategoriler buraya dinamik olarak eklenecek -->
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                        <button type="submit" class="btn btn-primary">Kaydet</button>
                    </div>
                </form>

            </div>
        </div>
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
    function ara() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("urunAdiAra");
        filter = input.value.toUpperCase();
        table = document.getElementById("Product");
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1]; // Ürün adı sütunu (2. sütun)
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

    function deleteProduct(productId) {
        if (confirm("Bu ürünü silmek istediğinizden emin misiniz?")) {
            // Yönlendirme yapılacak URL'i oluşturun
            var url = "UrunSil.jsp?productId=" + productId;

            // Yönlendirme işlemi
            window.location.href = url;
        }
    }
    const kategoriler = [
        { kategoriId: 9690, ad: 'Edebiyat' },
        { kategoriId: 9111, ad: 'Eğitim' },
        { kategoriId: 10269, ad: 'Roman' },
        { kategoriId: 10848, ad: 'Çocuk' },
        { kategoriId: 12006, ad: 'Tarih' },
        { kategoriId: 13164, ad: 'Felsefe' },
        { kategoriId: 11427, ad: 'Çizgiroman' },
        { kategoriId: 13743, ad: 'Kişisel Gelişim' },
        { kategoriId: 14322, ad: 'eKitap' }
    ];

    document.addEventListener('DOMContentLoaded', function() {
        const kategoriSelect = document.getElementById('kategori');
        kategoriler.forEach(function(kategori) {
            const option = document.createElement('option');
            option.value = kategori.kategoriId;
            option.textContent = kategori.ad + ' (' + kategori.kategoriId + ')';
            kategoriSelect.appendChild(option);
        });
    });


    function kategoriSecildi() {
        const kategoriSelect = document.getElementById('kategori');
        const secilenIndex = kategoriSelect.selectedIndex;
        const secilenOption = kategoriSelect.options[secilenIndex];
        secilenOption.textContent = secilenOption.textContent.replace('Kategori Seç', 'Seçilen Kategori');
    }

</script>

</body>
</html>