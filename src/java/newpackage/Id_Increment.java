package newpackage;

import java.sql.*;

public class Id_Increment {

    public String ID() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project","root","");
            System.out.println("Connected succesfully");
            PreparedStatement ps1 = con.prepareStatement("Select * from student");
            ResultSet rs = ps1.executeQuery();
            if (!rs.next()) {
                String id="BUS100001";
                return id;
            } else {
                String sid;
                String s = "";
                do {
                    sid = rs.getString(1);
                    //s = s + "" + sid + "\t" + rs.getString(1) + "\t" + rs.getString(4) + "\t" + rs.getString(3) + "\n";
                } while (rs.next());
                sid = sid.substring(0, 3) + (Integer.parseInt(sid.substring(3, 9)) + 1);
                return sid;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "0";
    }
}