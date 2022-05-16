package newpackage;

import java.sql.*;

public class check_pwd {

    public boolean check_email(String email, String password) {
        String pwd = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement s = con.createStatement();
            PreparedStatement ps = con.prepareStatement("select * from student where Email_Id=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pwd = rs.getString(3);
                if (pwd.equals(password)) {
                    return true;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
