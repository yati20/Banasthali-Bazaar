<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Functions</title>
        <link rel="stylesheet" href="css/style4.css">
    </head>
    <body>
        <div class="entry">
            <div class="imgcontainer">
                <img src="img/BanasthaliBazaar.png" alt="logo" class="logo">
            </div>
            <%
                response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setHeader("Expires", "0");

                if (session.getAttribute("email") == null && session.getAttribute("pass") == null) {
                    response.sendRedirect("admin.html");
                }
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    Statement s = con.createStatement();
                    response.setHeader("Cache-Control", "no-cache,no-store");
                    String email_id = session.getAttribute("email_id").toString();
                    String pass=session.getAttribute("pass").toString();
                    PreparedStatement ps = con.prepareStatement("select * from Admin where Email_Id=?");
                    ps.setString(1, email_id);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        String name = rs.getString(2);
            %>
            <h1 style="color:#52ab98"><b><%out.println("HELLO " + name);%></b></h1><br/>
                    <%}%>

            <a href="admin_view_item.jsp">
                <button>VIEW ITEMS</button>
            </a>
            <a href="view_student.jsp" >
                <button>VIEW STUDENTS</button>
            </a><br/>
            <a href="add_hostel.jsp" >
                <button>ADD / DELETE HOSTEL</button>
            </a><br/>
            <a href="add_security_ques.jsp" >
                <button>ADD / DELETE SECURITY QUESTION</button>
            </a><br/>
            <a href="add_category.jsp" >
                <button>ADD / DELETE ITEM CATEGORY</button>
            </a><br/>
            <%
                session.setAttribute("email", email_id);
                session.setAttribute("pass", pass);
            %>
            <a href="logoutProcess.jsp">
                <button><b>LOG OUT</b></button>
            </a>
            <h2 style="font-family:arial;color:#47342c"><b>FEEDBACK OF STUDENTS:</b></h2><br/>
            <%} catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM Feedback ORDER BY F_date DESC ");
                    ResultSet rs = ps.executeQuery();%>
            <TABLE BORDER="2" style="width: 35vw;height:20vh;">
                <TR>
                    <TH>Date</TH>
                    <TH>Name</TH>
                    <TH>Feedback</TH>
                </tr>
                <%while (rs.next()) {%>
                <TD> <%= rs.getDate(1)%></td>
                <TD> <%= rs.getString(2)%></TD>
                <TD> <%= rs.getString(3)%></TD>
                </tr>
                <%}
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
    </body>
</html>
