package newpackage;
import java.sql.*;
public class check_alreadyAccount {
    public boolean check_email(String email) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement s = con.createStatement();
            PreparedStatement ps=con.prepareStatement("select * from student where Email_Id=?");
            ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return false;
            }else{
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
