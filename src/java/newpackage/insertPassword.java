package newpackage;

import java.sql.*;

public class insertPassword {

    public boolean checkPassword(String new_password, String confirm_password, String email) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement s = con.createStatement();
            if (new_password.equals(confirm_password)) {
                PreparedStatement ps = con.prepareStatement("update student set Password=? where Email_Id=?");
                ps.setString(1, new_password);
                ps.setString(2, email);
                if (ps.executeUpdate() > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
