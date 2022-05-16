<%@page import="newpackage.admin_delete_item"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Items</title>
        <link rel="stylesheet" href="css/style4.css">
    </head>
    <body>
        <style>
            table{
                margin-left: -150px;
            }
        </style>
    <center>
        <div class="entry">
            <img src="img/shopping_girl.jpg" alt="shoppig" style="border-radius:80px;" width="150px" height="150px">
            <br>
            <h2 style="font-family:arial;color:#47342c">Items DataBase:</h2>
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
                    PreparedStatement ps = con.prepareStatement("Select * from student INNER JOIN item ON item.Student_Id=student.Student_Id");
                    ResultSet rs = ps.executeQuery();
            %>
            <table border="1">
                <TR>
                    <TH >Item Id</TH>
                    <TH >Item Category</TH>
                    <TH >Item Price</TH>
                    <TH >Seller Id</TH>
                    <TH>Seller Name</TH>
                    <TH>Seller Email Id</TH>
                </tr>
                <%while (rs.next()) {
                %>
                <TD> <%= rs.getString("Item_Id")%></td>
                <TD> <%= rs.getString("Category_Id")%></TD>
                <TD> <%= rs.getString("Item_Price")%></TD>
                <TD> <%= rs.getString("Student_Id")%></TD>
                <TD> <%= rs.getString("Student_Name")%></TD>
                <TD> <%= rs.getString("Email_Id")%></TD>
                <TD><a href="admin_delete_item.jsp?id=<%=rs.getString("Item_Id")%>"><button type="button" class="delete">Delete</button></a></TD>
                </tr>
                <%}%>
                <br>
                <a href="admin_func.jsp"><button style="width: 150px;"><b>BACK</b></button></a>
                <br>
                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            </form>
        </div>
    </center>
</body>
</html>
