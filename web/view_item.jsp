<%@page import="newpackage.Track_S_Id"%>
<%@page import="java.sql.*"%>
<%@page import="newpackage.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Items</title>
        <link rel="stylesheet" href="css/style4.css">

    </head>
    <body>
    <center>
        <div class="entry">
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
                session.setAttribute("st_id", s_id);%>
            <h1>Hello <%=Track_S_Id.name%></h1><br/><br/>
            <h2>Your Items are...</h2>
            <%PreparedStatement ps = con.prepareStatement("select * from item where Student_Id=?");
                ps.setString(1, s_id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    PreparedStatement ps1 = con.prepareStatement("Select * from item where Student_Id=? ORDER BY Item_Id DESC");
                    ps1.setString(1, s_id);
                    ResultSet rs1 = ps1.executeQuery();%>
            <TABLE BORDER="1">
                <TR>
                    <TH >Item Title</TH>
                    <TH>Item Description</TH>
                    <TH>Item Price</TH>
                </tr>
                <%while (rs1.next()) {%>
                <TD> <%= rs1.getString(2)%></td>
                <TD> <%= rs1.getString(3)%></TD>
                <TD> <%= rs1.getString(5)%></TD>
                <TD><a href="item.jsp?id=<%=rs1.getString(1)%>"><button type="button" class="edit">Edit</button></a></TD>
                <TD><a href="delete_item.jsp?id=<%=rs1.getString(1)%>"><button type="button" class="edit">Delete</button></a></TD>
                </tr>

                <%}
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('You have no items');");
                            out.println("location='profile.jsp';");
                            out.println("</script>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                </br><a href="profile.jsp"><button style="width:150px;"><b>BACK</b></button></a>
        </div>
    </center>
</body>
</html>
