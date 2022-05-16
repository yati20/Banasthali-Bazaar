<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Item</title>
        <link rel="stylesheet" href="css/style4.css">
     </head>
    <body>
    <center>
        <div class="entry">
            <form action="Update_sell_item.jsp" method="Post">
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                        Statement s = con.createStatement();
                        String i_id = request.getParameter("id");
                        session.setAttribute("id", i_id);
                        PreparedStatement ps = con.prepareStatement("select * from item where Item_Id=?");
                        ps.setString(1, i_id);
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {%>
                <h2 style="font-family:arial;color:#47342c"><b>UPDATE ITEM DETAILS....</b></h2>
                <h4><b>Item Category</b></h4><br>
                <select name="s_category">
                    <%
                        int category = rs.getInt(7);
                        PreparedStatement ps1 = con.prepareStatement("select * from category where Category_id=?");
                        PreparedStatement ps2 = con.prepareStatement("select * from category");
                        ps1.setInt(1, category);
                        ResultSet rs1 = ps1.executeQuery();
                        ResultSet rs2 = ps2.executeQuery();
                        String i_category = "";
                        String s_category = "";
                        if (rs1.next()) {
                            s_category = rs1.getString(2);
                        }%>
                    <br/><option value="<%=s_category%>"><%=s_category%></option>
                    <%while (rs2.next()) {
                            i_category = rs2.getString(2);
                    %>
                    <option value="<%=i_category%>"><%=i_category%></option>
                    <%}%>
                </select><br/><br/>
                <h4><b>Item Title</b></h4><input type="text" name="i_title" value="<%=rs.getString(2)%>" required/><br/><br/>
                <h4><b>Item Description</b></h4><input type="text" name="i_description" value="<%=rs.getString(3)%>" required/><br/><br/>
                <h4><b>Item Price</b></h4><input type="text" name="i_price" value="<%=rs.getString(5)%>" required/><br/><br/>
                <img src="displayItem.jsp?id=<%=i_id%>" width="200px" height="200px"/><br/><br/>
                <a href="Update_sell_item.jsp"><button><b>UPDATE</b></button></a><br/><br/>
            </form>
            <a href="homepg.jsp"><button><b>SELL</b></button></a>
                        <%}
                            } catch (Exception e) {
                                e.printStackTrace();
                            }

                        %>
            </form>
        </div>
    </center>
</body>
</html>
