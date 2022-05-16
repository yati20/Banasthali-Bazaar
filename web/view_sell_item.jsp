<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Details</title>
        <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
        <div class="entry">
            <%
                response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    Statement s = con.createStatement();
                    String id = (String) session.getAttribute("id");
                    PreparedStatement ps = con.prepareStatement("select * from item where item_id=?");
                    ps.setString(1, id);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {%>
            <h2 style="color:#52ab98"><b>Item Inserted Successfully!</b></h2>
            <h3 style="font-family:arial;color:#47342c"><b>Edit Item Details if Any!</b></h3>
            <%
                int category = rs.getInt(7);
                PreparedStatement ps1 = con.prepareStatement("select * from category where Category_id=?");
                ps1.setInt(1, category);
                ResultSet rs1 = ps1.executeQuery();
                String i_category = "";
                String s_category = "";
                if (rs1.next()) {
                    s_category = rs1.getString(2);
                }%>
            <img src="displayItem.jsp?id=<%=id%>" width="300px" height="300px"/>
            <br>
            <h3>Item Category : <%=s_category%></h3>
            <h3>Item Title : <%=rs.getString(2)%></h3>
            <h3>Item Description : <%=rs.getString(3)%></h3>
            <h3>Item Price : Rs. <%=rs.getString(5)%></h3><br/>
            <a href="edit_sell_item.jsp?id=<%=id%>"><button style="width:150px;"><b>Edit</b></button></a><br/><br/> 
            <a href="homepg.jsp"><button style="width: 150px;"><b>Sell</b></button></a><br/><br/>
                        <%}
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
        </div>
    </body>
</html>
