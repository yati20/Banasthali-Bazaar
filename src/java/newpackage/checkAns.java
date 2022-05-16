package newpackage;

import java.sql.*;

public class checkAns {

    public boolean CheckAns(String ans, String email) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement s = con.createStatement();
            PreparedStatement ps1 = con.prepareStatement("select * from student where Email_id=?");
            ps1.setString(1, email);
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                String s_answer = rs1.getString(6);
                if (ans.equalsIgnoreCase(s_answer)) {
                    return true;
                }
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
