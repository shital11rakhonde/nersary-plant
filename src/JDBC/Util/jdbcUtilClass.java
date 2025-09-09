package JDBC.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class jdbcUtilClass {

    private static final String URL = "jdbc:mysql://localhost:3306/plant_nursery";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";  // ✅ use latest driver class
    private static final String USERNAME = "root";
    private static final String PASSWORD = "swami@123";

    static {
        try {
            Class.forName(DRIVER);  // Load driver once
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection openconnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);  // ✅ always return fresh connection
    }
}
