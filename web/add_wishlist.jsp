<%@page import="java.sql.*"%>
<%@page import="newpackage.Track_S_Id"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                String i_id = request.getParameter("id");
                String s_id = Track_S_Id.s_id;
                PreparedStatement ps1 = con.prepareStatement("select * from wishlist where Item_Id=? and Student_Id=?");
                ps1.setString(1, i_id);
                ps1.setString(2, s_id);
                ResultSet rs = ps1.executeQuery();
                if (rs.next()) {
                    response.sendRedirect("homepg.jsp");
                } else {
                    PreparedStatement ps = con.prepareStatement("insert into wishlist(Item_Id,Student_Id) values(?,?)");
                    ps.setString(1, i_id);
                    ps.setString(2, s_id);
                    if (ps.executeUpdate() > 0) {
                        response.sendRedirect("homepg.jsp");
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </center>
</body>
</html>
