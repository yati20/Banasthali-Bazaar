<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Password</title>
         <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
        <div class="entry">
        <form>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    Statement s = con.createStatement();
                    String new_pwd = request.getParameter("new_pwd");
                    String confirm_pwd = request.getParameter("confirm_pwd");
                    String email_id = session.getAttribute("email_id").toString();
                    if (new_pwd.equals(confirm_pwd)) {
                        PreparedStatement ps = con.prepareStatement("update student set Password=? where Email_Id=?");
                        ps.setString(1, new_pwd);
                        ps.setString(2, email_id);
                        if (ps.executeUpdate() > 0) {
                           // out.println("HELLO....2");
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('YOUR PASSWORD IS UPDATED');");
                            out.println("location='student.html';");
                            out.println("</script>");
                        }else{
                            //out.println("HELLO....3");
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('THERE IS SOME ERROR');");
                            out.println("location='student.html';");
                            out.println("</script>");
                        }
                    } else {out.println("<script type=\"text/javascript\">");
                            out.println("alert('YOUR NEW AND CONFIRM PASSWORD ARE NOT MATCHING');");
                            out.println("location='check_otp.jsp';");
                            out.println("</script>");}

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </form>
        </div>
    </body>
</html>
