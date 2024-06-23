<%@ page import="com.kitap.kitapatlasi.dao.ProductDaoImplementation" %>
<%@ page import="com.kitap.kitapatlasi.entity.Product" %>
<%@ page import="com.kitap.kitapatlasi.dao.ProductDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    try {
        // Retrieve parameters from the request
        String productName = request.getParameter("urunAdi");
        String productDetail = request.getParameter("urunDetayi");
        double productPrice = Double.parseDouble(request.getParameter("urunFiyati"));
        int categoryId = Integer.parseInt(request.getParameter("kategoriId"));

        // Validate parameters
        if (productName == null || productName.isEmpty() ||
                productDetail == null || productDetail.isEmpty() ||
                productPrice <= 0 || categoryId <= 0) {

            // Send conflict response if parameters are invalid
            response.sendError(HttpServletResponse.SC_CONFLICT, "Invalid input parameters");
            return;
        }

        // Create Product object
        Product product = new Product();
        product.setProductName(productName);
        product.setProductDetail(productDetail);
        product.setProductPrice(productPrice);
        product.setCategoryID(categoryId);

        // Use DAO to add product
        ProductDao productDao = new ProductDaoImplementation();
        boolean registrationSuccessful = productDao.addProduct(product);

        // Redirect based on registration success or failure
        if (registrationSuccessful) {
            response.sendRedirect("adminPaneli.jsp?registration=success");
        } else {
            response.sendRedirect("musteriyonetim.jsp?registration=fail");
        }
    } catch (NumberFormatException e) {
        // Handle case where numeric parsing fails (ProductPrice or CategoryID)
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid numeric input");
    } catch (Exception e) {
        // Handle other unexpected exceptions
        e.printStackTrace(); // Log exception for debugging
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
    }
%>
