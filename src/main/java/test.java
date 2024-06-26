import com.kitap.kitapatlasi.dao.ConnectionController;

import java.sql.Connection;
import java.sql.SQLException;

public class test {
    public static void main(String[] args) {
        Connection connection = ConnectionController.getConnection();
        if (connection != null) {
            System.out.println("Bağlantı başarılı!");
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Bağlantı başarısız.");
        }
    }
}
