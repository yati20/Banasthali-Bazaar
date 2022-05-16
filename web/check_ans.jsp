<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify answer</title>
        <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
    <div class="entry">
        <form action="check_pwd.jsp" method="POST">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    Statement s = con.createStatement();
                    String ans = request.getParameter("ans");
                    session.setAttribute("ans",ans);
                    String email_id = session.getAttribute("id").toString();
                    session.setAttribute("email_id", email_id);
                    PreparedStatement ps = con.prepareStatement("select * from student where Email_Id=? and Answer=?");
                    ps.setString(1, email_id);
                    ps.setString(2, ans);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {%>
            <h1><b>CREATE NEW PASSWORD</b></h1>
            <br>
            <h2><b>Enter new password    </b></h2>
            <br>
            <input type="password" name="new_pwd" placeholder="Enter new password">
            <br>
            <h2><b>Confirm new password    </b></h2>
            <input type="password" name="confirm_pwd" placeholder="Enter new password">
            <br>
            <a href="check_pwd.jsp">
                <button style="width:150px;"><b>Submit</b></button>
            </a>
        </form>
        
        <a href="check_email.jsp?email_id=<%=email_id%>">
            <button style="width:150px;"><b>Cancel</b></button>
        </a>   

        <%} else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('THE ANSWER IS NOT CORRECT');");
                    out.println("location='forgotPassword.html';");
                    out.println("</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</center>
</body>
</html>
