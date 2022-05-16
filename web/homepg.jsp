<%@page import="newpackage.Track_S_Id"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banasthali Bazaar</title>
        <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
        <style>
            .title{
                display:inline-block;
                margin:10px -18px 5px -18px;
                background-color: #adcdc2;
            }
            .title a{
                text-decoration: none;
            }
            .items{
                display:inline-block;
                width:20vw;
                heigth:30vh;
                margin:10px;
                padding:10px;
            }
            .items p{

                line-height: 3vh;
                text-align: left;
            }
        </style>
        <div class="imgcontainer">
            <img src="img/BanasthaliBazaar.png" alt="logo" width="70px" height="70px" style="border-radius:50px;">
            <h4 style="margin:1px;">BANASTHALI BAZAAR</h4>
        </div>
        <div class="entry">
            <center>
                <%
                    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
                    response.setHeader("Pragma", "no-cache");
                    response.setHeader("Expires", "0");

                    if (session.getAttribute("email") == null && session.getAttribute("pass") == null ) {
                        response.sendRedirect("student.html");
                    }
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                        Statement s = con.createStatement();
                        String email_id = session.getAttribute("email").toString();
                        String pass = session.getAttribute("pass").toString();
                        if (email_id.compareTo(" ") == 0) {
                            response.sendRedirect("index.html");
                        }
                        Track_S_Id.Student_Id(email_id);
                        PreparedStatement ps1 = con.prepareStatement("select * from student where Email_id=?");
                        ps1.setString(1, email_id);
                        String s_id = "";
                        String name = "";
                        String str = " ";
                        ResultSet rs1 = ps1.executeQuery();
                        if (rs1.next()) {
                            s_id = rs1.getString(1);
                            str = rs1.getString(2);
                            int end = str.indexOf(" ", 0);
                            name = rs1.getString(2);
                %>
                <h2 style="font-size:220%;color:#422113;">Welcome <%=name%></h3>

                    <%}
                        ResultSet rs = s.executeQuery("select * from category order by Category_Name asc");
                        while (rs.next()) {
                            String i_category = rs.getString(2);
                    %>

                    <article class="title" >
                        <figure >
                            <a href="showItem.jsp?id=<%=rs.getInt(1)%>"><img src="display_category_img.jsp?id=<%=rs.getInt(1)%>" style="border-radius:30px;" width="65px" height="65px"/></a>
                            <figcaption>
                                <a href="showItem.jsp?id=<%=rs.getInt(1)%>"><%=i_category%></a>
                            </figcaption>
                        </figure>
                    </article>
                    <%}
                    %>
                    <div class="btn" >
                        <a href="sell.jsp" >
                            <button style="width:150px;"><b>Sell Item</b></button>
                        </a>

                        <a href="profile.jsp">
                            <button style="width:150px;"><b>Edit Profile</b></button>
                        </a>
                       <% 
                        session.setAttribute("email", email_id);
                        session.setAttribute("pass", pass);
                    %>
                    <a href="logoutProcess.jsp">
                        <button style="width:150px;"><b>Log out</b></button>
                    </a>
                        <a href="Feedback_1.jsp">
                            <button style="width:150px;"><b>Give Feedback</b></button>
                        </a>
                        <a href="cart.jsp">
                            <button style="width:150px;"><b>My Wishlist</b></button>
                        </a>
                        <a href="HELP.jsp">
                            <button style="width:150px;"><b>Help</b></button>
                        </a>
                    </div>
                    <%
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    <h2 class="heading">One stop to Buy, Sell and Resell things.</h2>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                            PreparedStatement ps = con.prepareStatement("SELECT * FROM item LIMIT 12");
                            ResultSet rs = ps.executeQuery();
                            if (rs.next()) {
                                do {%>

                    <article class="items" >
                        <figure>
                            <a href="sellItem.jsp?id=<%=rs.getString(1)%>"><img src="displayItem.jsp?id=<%=rs.getString(1)%>" style="border-radius:20px;" width="200px" height="190px"/></a>
                            <figcaption >
                                <h3><%=rs.getString(2)%></h3>
                                <p><%=rs.getString(3)%></p>
                                <p style="background-color: yellow;border-radius: 20px;text-align: center;">Rs.<%=rs.getString(5)%></p>
                                <a href="add_wishlist.jsp?id=<%=rs.getString(1)%>"><button style="width:150px;">Add to Wishlist</button></a>  
                            </figcaption>
                        </figure>    
                    </article>            

                    <%} while (rs.next());
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
            </center>
        </div>
    </body>
</html>
