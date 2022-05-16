package newpackage;

import java.sql.*;

public class DB {

    public static Connection getConnection() {
        Connection con=null;
        try {
            Class.forName("");
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement s = con.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

}
