package newpackage;
import java.sql.*;
public class admin_delete_item {
    public boolean delete(String s_id){
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                PreparedStatement ps = con.prepareStatement("delete from item where Student_Id=?");
                ps.setString(1,s_id);
                int i=ps.executeUpdate();
                if(i>=0){
                    return true;
                }else{
                    return false;
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        return false;
    }
    
}
