import com.kitap.kitapatlasi.dao.ConnectionController;
import com.kitap.kitapatlasi.dao.ProductDaoImplementation;
import com.kitap.kitapatlasi.entity.Product;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class test {
    public static void main(String[] args) {
        ProductDaoImplementation P = new ProductDaoImplementation(); // ProductService sınıfının doğru adını kullanarak değiştirin

        // Örnek bir kategori adı
        String categoryName = "Egitim";

        // Kategori adına göre ürünleri getir
        List<Product> products = P.getProductsByCategoryName(categoryName);

        // Ürünlerin listelendiğini doğrula
        for (Product product : products) {
            System.out.println("Ürün Adı: " + product.getProductName());
            System.out.println("Ürün Detayı: " + product.getProductDetail());
            System.out.println("Ürün Fiyatı: " + product.getProductPrice());
            System.out.println("Ürün Resmi: " + product.getProductImage());
            System.out.println("--------------------------------------");
        }
    }
}
