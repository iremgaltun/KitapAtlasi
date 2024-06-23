<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.kitap.kitapatlasi.dao.ProductDaoImplementation" %>
<%@ page import="com.kitap.kitapatlasi.dao.ProductDao" %>
<%@ page import="com.kitap.kitapatlasi.entity.Product" %>

<%
    // productId parametresini al
    int productId = Integer.parseInt(request.getParameter("productId"));

    // Ürünü sil
    ProductDao productDao = new ProductDaoImplementation();
    boolean deleteSuccessful = productDao.deleteProduct(productId);

    // Silme işlemi başarılıysa adminPaneli.jsp'ye yönlendir
    if (deleteSuccessful) {
        response.sendRedirect("adminPaneli.jsp?delete=success");
    } else {
        response.sendRedirect("adminPaneli.jsp?delete=fail");
    }
%>
