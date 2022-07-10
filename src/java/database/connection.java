
package database;
// @author RAHUL and SHREYA (INTERNSHIP PROJECT)

import java.sql.*;

public class connection {


    public static Connection connection;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_system", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (connection);
    }}