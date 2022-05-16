<%@page import="newpackage.Track_S_Id"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Wishlist</title>
        <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
        <style>
            .title{
                display:inline-block;
                margin:-18px;
                background-color: #adcdc2;
            }
            .items{
                display:inline-block;
                width:20vw;
                heigth:30vh;
                margin:10px;
                padding:10px;
            }
            .items p{

                line-height: 4vh;
                text-align: left;
            }
        </style>
    <center>
        <div class="imgcontainer">
            <img src="img/BanasthaliBazaar.png" alt="logo" class="logo">
        </div>
        <h2><b>YOUR WISHLIST</b></h2>
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
                PreparedStatement ps = con.prepareStatement("select * from wishlist where Student_Id=?");
                ps.setString(1, s_id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    PreparedStatement ps1 = con.prepareStatement("select * from item where Item_Id in (select Item_Id from wishlist where Student_Id=?)");
                    ps1.setString(1, s_id);
                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {%>
        <article class="items">
            <figure>
                <a href="buy.jsp?id=<%=rs1.getString(1)%>"><img src="displayItem.jsp?id=<%=rs1.getString(1)%>" style="border-radius:20px;" width="200px" height="200px"/></a>
                <figcaption>
                    <center><h3><%=rs1.getString(2)%></h3><center>
                            <p><%=rs1.getString(3)%></p>
                            <p>Rs.<%=rs1.getString(5)%></p>
                            <a href="delete_cart_item.jsp?id=<%=rs1.getString(1)%>"><button style="width:150px;"><b>Delete</b></button></a>
                            </figcaption>
                            </figure>
                            </article> 
                            <%}
        } else {%>
                            <br/><br/><br/>
                            <h2><b>You Have No Items In Your Cart</b></h2>
                            <br/><br/><br/>
                            <%}%>
                            <br/>
                            <a href="homepg.jsp"><button style="width:180px;"><b>BACK</b></button></a>
                            <%} catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </center>
                        </body>
                        </html>
