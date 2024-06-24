<%@ page import="com.kitap.kitapatlasi.dao.ProductDaoImplementation" %>
<%@ page import="com.kitap.kitapatlasi.entity.Product" %>
<%@ page import="com.kitap.kitapatlasi.dao.ProductDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    try {
        // İstekten gelen parametreleri al
        String productName = request.getParameter("urunAdi");
        String productDetail = request.getParameter("urunDetayi");
        String productPriceStr = request.getParameter("urunFiyati");
        String categoryIdStr = request.getParameter("kategori");

        // Parametreleri doğrula
        if (productName == null || productName.isEmpty() ||
                productDetail == null || productDetail.isEmpty() ||
                productPriceStr == null || productPriceStr.isEmpty() ||
                categoryIdStr == null || categoryIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_CONFLICT, "Geçersiz giriş parametreleri");
            return;
        }

        double productPrice = Double.parseDouble(productPriceStr);
        int categoryId = Integer.parseInt(categoryIdStr);

        // Product nesnesi oluştur
        Product product = new Product();
        product.setProductName(productName);
        product.setProductDetail(productDetail);
        product.setProductPrice(productPrice);
        product.setCategoryID(categoryId);

        // DAO kullanarak ürünü ekle
        ProductDao productDao = new ProductDaoImplementation();
        boolean registrationSuccessful = productDao.addProduct(product);

        // Başarıya veya başarısızlığa göre yönlendir
        if (registrationSuccessful) {
            response.sendRedirect("adminPaneli.jsp?registration=success");
        } else {
            response.sendRedirect("adminPaneli.jsp?registration=fail");
        }
    } catch (NumberFormatException e) {
        // Sayısal ayrıştırma başarısız olursa (ProductPrice veya CategoryID)
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Geçersiz sayısal giriş");
    } catch (Exception e) {
        // Diğer beklenmedik istisnaları ele al
        e.printStackTrace(); // Hata ayıklama için istisnayı kaydet
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Sunucu iç hatası");
    }
%>
