<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>

        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                String email_id = request.getParameter("email_id");
                session.setAttribute("email_id", email_id);
                String password = request.getParameter("password");
                session.setAttribute("pass",password);
                PreparedStatement ps = con.prepareStatement("select * from Admin where Email_Id=? and password=?");
                ps.setString(1, email_id);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    session.setAttribute("email", email_id);
                    session.setAttribute("pass", password);
                    response.sendRedirect("admin_func.jsp");
                } else {%>
        <script type="text/javascript">
            alert("Email_Id OR PASSWORD ARE INCORRECT");
        </script>
        <jsp:include page="admin.html" />
        <%}
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>

    </body>
</html>