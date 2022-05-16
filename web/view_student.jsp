<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Details</title>
        <link rel="stylesheet" href="css/style3.css">
        <!--        <script type="text/javascript">
                    function disableBack() {
                        window.history.forward();
                    }
                    setTimeout("disableBack()", 0);
                    window.onunload = function () {
                        null
                    };
                </script>-->
    </head>
    <body>
    <center>
        <div class="entry">
            <img src="img/shopping_girl.jpg" alt="shoppig" style="border-radius:80px;" width="150px" height="150px">
            <br>
            <h2 style="font-family:arial;color:#47342c">Student Database:</h2>

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
                    PreparedStatement ps1 = con.prepareStatement("Select * from student ORDER BY Student_Id DESC");
                    ResultSet rs = ps1.executeQuery();
            %>
            <TABLE BORDER="1">
                <TR>
                    <TH >Student_Id</TH>
                    <TH>Student_Name</TH>
                    <TH>Email_Id</TH>
                </tr>
                <%while (rs.next()) {
                        session.setAttribute("email", rs.getString(4));%>
                <TD> <%= rs.getString(1)%></td>
                <TD> <%= rs.getString(2)%></TD>
                <TD> <%= rs.getString(4)%></TD>
                <TD><a href="delete_acc.jsp?id=<%=rs.getString(1)%>"><button type="button" class="delete">Delete</button></a></TD>
                </tr>
                <% }
                %>
                <br>
                <a href="admin_func.jsp"><button style="width: 150px;"><b>BACK</b></button></a>
                <br>
                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

                </div
                </center>
                </body>
                </html>