<%@page import="java.sql.*,java.util.*"%>
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
                String hostel = request.getParameter("hostel");
                String operation = request.getParameter("operation");
                if (operation.equals("insert")) {
                    PreparedStatement ps2 = con.prepareStatement("insert into hostel(Hostel_name) values(?)");
                    ps2.setString(1, hostel);
                    if (ps2.executeUpdate() > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Inserted');");
                        out.println("location='add_hostel.jsp';");
                        out.println("</script>");
                    }
                } else {
                    PreparedStatement ps2 = con.prepareStatement("delete from hostel where Hostel_name=?");
                    ps2.setString(1, hostel);
                    if (ps2.executeUpdate() > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Deleted');");
                        out.println("location='add_hostel.jsp';");
                        out.println("</script>");
                    }
                }
            } catch (Exception e) {
                out.println("error is : " + e);
            }
        %>
    </body>
</html>
