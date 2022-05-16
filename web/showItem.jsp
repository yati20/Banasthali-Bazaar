<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items</title>
        <link rel="stylesheet" href="css/style3.css">
        <link rel="stylesheet" href="css/style5.css">
    </head>
    <body>
        <style>
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
        <div class="entry">
            <center>
                <div class="imgcontainer">
                    <img src="img/BanasthaliBazaar.png" alt="logo" class="logo">
                </div>
                <h3 style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-size:200%;color:#422113;"><b>Continue Your Search</b></h3>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                        Statement s = con.createStatement();
                        String c_id = request.getParameter("id");
                        session.setAttribute("c_id",c_id);
                        PreparedStatement ps = con.prepareStatement("select * from item where Category_Id=?");
                        ps.setString(1, c_id);
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                            do {%>
                
                <article class="items" >
                    
                    <figure>
                        <a href="sellItem.jsp?id=<%=rs.getString(1)%>"><img src="displayItem.jsp?id=<%=rs.getString(1)%>" style="border-radius:20px;"width="200px" height="200px"/></a>
                        <figcaption>
                            <h3><%=rs.getString(2)%></h3>
                            <p><%=rs.getString(3)%></p>
                            <p style="background-color: yellow;">Rs.<%=rs.getString(5)%></p>
                            <a href="add_wishlist.jsp?id=<%=rs.getString(1)%>"><button style="width:150px;"><b>Add to Wishlist</b></button></a>

                            
                        </figcaption>
                    </figure>
                </article>
                <%} while (rs.next());
        } else {%>
                <h2><b>Oooops!!!! No item present</b></h2>
                <%}%>
                <br><a href="homepg.jsp"><button style="width:150px;"><b>Back</b></button></a>
                <%} catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </center>
        </div>
    </body>
</html>
