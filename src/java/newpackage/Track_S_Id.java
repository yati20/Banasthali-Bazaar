package newpackage;
import java.sql.*;
public class Track_S_Id {
    public static String s_id="";
    public static String name="";
    public static void Student_Id(String email_id){
        try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    Statement s = con.createStatement();
                    PreparedStatement ps=con.prepareStatement("select * from student where Email_Id=?");
                    ps.setString(1, email_id);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        s_id = rs.getString(1);
                        name=rs.getString("Student_name");
                    }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
}
