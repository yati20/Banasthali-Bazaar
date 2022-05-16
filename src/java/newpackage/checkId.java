package newpackage;

import java.sql.*;

public class checkId {
    public static String email_1 = "";
    public static String check(String email) {
        email_1 = email;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement s = con.createStatement();
            PreparedStatement ps1 = con.prepareStatement("select * from student where Email_id=?");
            ps1.setString(1, email);
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                PreparedStatement ps2 = con.prepareStatement("select * from securityquestion where Security_Question_Id in(select Security_Question_Id from student where Email_id=?)");
                ps2.setString(1, email);
                ResultSet rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    String question = rs2.getString(2);
                    return question;
                }
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
       return "0";
    }
}
