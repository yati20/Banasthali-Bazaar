<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sell Item</title>
        <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
        <div class="entry">
            <center>
                <h2 style="font-family:arial;color:#47342c"><b>SHOP AT BANASTHALI BAZAAR</b></h2><br/><br/>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                        Statement s = con.createStatement();
                        String i_id = request.getParameter("id");
                        String s_id = "";
                        String hostel = "";
                        PreparedStatement ps = con.prepareStatement("select * from item where Item_Id=?");
                        ps.setString(1, i_id);
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                            s_id = rs.getString(6);
                            PreparedStatement ps1 = con.prepareStatement("select * from student where Student_Id=?");
                            ps1.setString(1, s_id);
                            ResultSet rs1 = ps1.executeQuery();
                            if (rs1.next()) {%>
                <img src="displayItem.jsp?id=<%=rs.getString(1)%>" width="200px" height="200px"/>
                <br>
                <p>Item Name : <%=rs.getString(2)%></p>
                <p>Item Description : <%=rs.getString(3)%></p>
                <p>Item Price : Rs.<%=rs.getString(5)%></p>
                <p>Seller Name :<%=rs1.getString(2)%></p>
                <%
                    PreparedStatement ps2 = con.prepareStatement("select * from hostel where Hostel_Id=?");
                    ps2.setString(1, rs1.getString(7));
                    ResultSet rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        hostel = rs2.getString(2);
                    }
                %>
                <p>Seller Hostel Name : <%=hostel%></p>
                <p>Seller Room Number : <%=rs1.getString(8)%></p>
                <p>Seller Contact Number : <%=rs1.getString(9)%></p>
                <a href="online_payment.jsp?id=<%=rs.getString(1)%>"><button style="width:150px;"><b>Buy</b></button></a>
                <a href="cart.jsp"><button style="width:150px;"><b>Back</b></button></a>
                <%} else {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('There is some error');");
                                out.println("location='homepg.jsp';");
                                out.println("</script>");
                            }
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('There is some error');");
                            out.println("location='homepg.jsp';");
                            out.println("</script>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </center>
        </div>
    </body>
</html>
