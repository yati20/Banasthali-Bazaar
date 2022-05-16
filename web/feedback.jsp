<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERT FEEDBACK</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                
                java.util.Date date = new java.util.Date();
                java.sql.Date sqlDate=new java.sql.Date(date.getTime());
                String name = request.getParameter("Name");
                String feedback = request.getParameter("feedback");
                PreparedStatement ps = con.prepareStatement("insert into Feedback(F_Date,F_Name,Feedback) values(?,?,?)");
                ps.setDate(1, sqlDate);
                ps.setString(2, name);
                ps.setString(3, feedback);
                if (ps.executeUpdate()>0) {
                    %>
        <jsp:include page="homepg.jsp" />
        <%}
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>
       
    </body>
</html>
