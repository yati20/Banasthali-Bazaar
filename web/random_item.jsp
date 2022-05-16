<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items for display</title>
    </head>
    <body>
    <center>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                PreparedStatement ps = con.prepareStatement("select * from item order by Item_Id desc");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    do {%>
        <a href="sellItem.jsp?id=<%=rs.getString(1)%>"><button><img src="displayItem.jsp?id=<%=rs.getString(1)%>" width="200px" height="200px"/></button></a>
        <b><%=rs.getString(3)%></b>
        Price <b><%=rs.getString(5)%></b>
        <%} while (rs.next());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </center>
</body>
</html>
