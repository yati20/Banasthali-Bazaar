
<%@page import="newpackage.DB"%>
<%@page import="java.sql.*"%>
<%@page import="newpackage.Track_S_Id"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
        <div class="imgcontainer">
            <img src="img/BanasthaliBazaar.png" alt="logo" class="logo">
        </div>
        <div class
             <div class="entry">

                <%
                    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
                    response.setHeader("Pragma", "no-cache");
                    response.setHeader("Expires", "0");

                    if (session.getAttribute("email") == null && session.getAttribute("pass") == null) {
                        response.sendRedirect("student.html");
                    }
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                        Statement s = con.createStatement();
                        String s_id = Track_S_Id.s_id;
                        session.setAttribute("st_id", s_id);
                        String name = "";
                        PreparedStatement ps = con.prepareStatement("select * from student where Student_Id=?");
                        ps.setString(1, s_id);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            name = rs.getString(2);
                        }
                %>
                <h1 style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-size:220%;color:#422113;"><b>WELCOME <%out.println(name);%></b></h1>
                <form action="account.jsp" method="post">
                    <a href="account.jsp">
                        <button style="width:180px"><b>My Account</b></button>
                    </a>
                </form>
                <form action="view_item.jsp" method="post">
                    <a href="view_item.jsp">
                        <button style="width:180px"><b>My Items</b></button>
                    </a>
                </form>
                <form action="homepg.jsp" method="post">
                    <a href="homepg.jsp">
                        <button style="width:180px"><b>Back</b></button>
                    </a>
                </form>
                <%} catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

            </div>
    </body>
</html>
