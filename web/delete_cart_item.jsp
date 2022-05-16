<%@page import="newpackage.Track_S_Id"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                String i_id = request.getParameter("id");
                String s_id = Track_S_Id.s_id;
                PreparedStatement ps = con.prepareStatement("delete from wishlist where Item_Id=? and Student_Id=?");
                ps.setString(1, i_id);
                ps.setString(2, s_id);
                int i = ps.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("cart.jsp");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('There is some Error');");
                    out.println("location='cart.jsp';");
                    out.println("</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
