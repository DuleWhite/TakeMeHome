package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBUtil {
    private static Connection  connection = null;
    private static final String URL="jdbc:mysql://127.0.0.1:3306/TakeMeHome?serverTimezone=GMT&useSSL=false";
    private static final String USER="root";
    private static final String PASSWORD="root";
    static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection(URL,USER,PASSWORD);
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection() {
        return connection;
    }
}
