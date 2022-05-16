<%@page import="newpackage.check_alreadyAccount"%>
<%@page import="newpackage.check_pwd"%>
<%@page import="newpackage.check_EmailId"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In Page</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                String email_id = request.getParameter("email_id");
                String password = request.getParameter("password");
                check_EmailId obj = new check_EmailId();
                check_pwd obj1 = new check_pwd();
                boolean flag = obj.check_email(email_id);
                boolean flag1 = obj1.check_email(email_id, password);
                check_alreadyAccount obj2 = new check_alreadyAccount();
                boolean flag2 = obj2.check_email(email_id);
                if (flag2 == false) {
                    if (flag == true) {
                        if (flag1 == true) {
                            PreparedStatement ps = con.prepareStatement("select * from Student where Email_id=? and password=?");
                            ps.setString(1, email_id);
                            ps.setString(2, password);
                            ResultSet rs = ps.executeQuery();
                            if (rs.next()) {
                                session.setAttribute("email", email_id);
                                session.setAttribute("pass", password);
                                response.sendRedirect("homepg.jsp");
                            } else {%>
        <script type="text/javascript">
            alert("There is some Error!!");
        </script>
        <jsp:include page="student.html" />
        <%}
        } else {%>
        <script type="text/javascript">
            alert("Password is incorrect");
        </script>
        <jsp:include page="student.html" />
        <% }
        } else {%>
        <script type="text/javascript">
            alert("Only Bansthali Id is Allowed");
        </script>
        <jsp:include page="student.html" />
        <%}
        } else {%>
        <script type="text/javascript">
            alert("You do not have an account");
        </script>
        <jsp:include page="student.html" />
        <%}
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>
    </body>
</html>