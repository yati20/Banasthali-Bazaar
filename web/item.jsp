<%@page import="newpackage.Track_I_Id"%>
<%@page import="newpackage.DB"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*"%>
<%@page import="newpackage.Track_S_Id"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items</title>
         <link rel="stylesheet" href="css/style4.css">
    </head>
    <body>
    <center>
        <div class="entry">
        <form action="Update_item" method="Post" enctype="multipart/form-data">
        <%
            String s_id=Track_S_Id.s_id;
            String i_id=request.getParameter("id");
            session.setAttribute("i_id",i_id);
            Track_I_Id.Item_Id(s_id);
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                PreparedStatement ps = con.prepareStatement("select * from item where Item_Id=?");
                ps.setString(1, i_id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int category = rs.getInt("Category_Id");
                    
        %>
        <h3><b>UPDATE YOUR ITEM DETAILS...</b></h3>
        <p>Item Category</p>
        <select name="s_category">
            <%
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
            <option value="<%=s_category%>"><%=s_category%></option>
            <%while (rs2.next()) {
                    i_category = rs2.getString(2);
            %>
            <option value="<%=i_category%>"><%=i_category%></option>
            <%}%>
        </select>
        <p>Item Title</p><input type="text" name="i_title" value="<%=rs.getString(2)%>" required/><br/>
        <p>Item Description</p><input type="text" name="i_description" value="<%=rs.getString(3)%>" required/><br/>
        <p>Item Price</p><input type="text" name="i_price" value="<%=rs.getString(5)%>" required/><br/>
        <img src="displayItem.jsp?id=<%=i_id%>" width="200px" height="150px"/>
        <br><a href="Update_item"><button style="width:160px;"><b>UPDATE</b></button></a>
        </form>
        <a href="view_item.jsp"><button  style="width:160px;"><b>CANCEL</b></button></a>
        
        <%}
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        
    </div>
    </center>
</body>
</html>
