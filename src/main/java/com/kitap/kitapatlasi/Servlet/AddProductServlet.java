package com.kitap.kitapatlasi.Servlet;

import java.io.IOException;
import com.kitap.kitapatlasi.dao.ProductDao;
import com.kitap.kitapatlasi.dao.ProductDaoImplementation;
import com.kitap.kitapatlasi.entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("urunAdi");
        String productDetail = request.getParameter("urunDetayi");
        double productPrice = Double.parseDouble(request.getParameter("urunFiyati"));
        int categoryId = Integer.parseInt(request.getParameter("kategoriId"));

        Product newProduct = new Product();


        ProductDao productDao = new ProductDaoImplementation();
        productDao.addProduct(newProduct);

        response.sendRedirect("adminPaneli.jsp");
    }
}
