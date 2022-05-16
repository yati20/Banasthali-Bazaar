<%@page import="newpackage.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Item</title>
        <link rel="stylesheet" href="css/style4.css">
    </head>
    <body>
    <center>
    <div class="entry">
         <img src="img/shopping_girl.jpg" alt="shoppig" style="border-radius:80px;" width="150px" height="150px">
         <br>
        <form action="Insert_item" method="post" enctype="multipart/form-data">
            <h1><b>Insert Item Details</b></h1>
            <select name="s_category" required>
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
                        PreparedStatement ps = con.prepareStatement("select * from Category");
                        ResultSet rs = ps.executeQuery();%>
                <option value="" >Select Item Category</option>    
                <%while (rs.next()) {
                        String i_category = rs.getString(2);
                %>
                <option value="<%=i_category%>"><%=i_category%></option>
                <%}
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
            <input type="text" name="i_name" placeholder="Enter Title For An Item" required/>
            <br>
            <input type="text" title="(Describe in brief :1->Item condition 2-> Number of Hands used that Item)" name="i_description" placeholder="Describe Your Item" required/>
            <br>
            <label class="required">A brief description of your item</label>
            <br>
            <p>Add Image</p>
            <input type="file" name="i_img" required="required"/>
            <br>
            <input type="text" name="i_price" placeholder="Enter Price" required/>
            <br>
            <a href="Insert_item">
                <button style="width:180px;"><b>Add Item</b></button>
            </a>
        </form>
            <br>
        <a href="homepg.jsp">
            <button style="width:180px;"><b>Cancel</b></button>
        </a>
    </div>
    </center>
</body>
</html>
