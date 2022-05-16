package newpackage;
import java.sql.*;
public class Track_I_Id {
    public static String i_id = "";
    public static void Item_Id(String s_id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement s = con.createStatement();
            PreparedStatement ps = con.prepareStatement("select * from item where Student_Id=?");
            ps.setString(1, s_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i_id = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
