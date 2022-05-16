<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify E-mail</title>
         <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
    <center>
    <div class="entry">
         <div class="imgcontainer">
            <img src="img/BanasthaliBazaar.png" alt="logo" class="logos">
            
          </div>
        <form action="check_ans.jsp" method="POST">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    Statement s = con.createStatement();
                    String email_id = request.getParameter("email_id");
                    session.setAttribute("id", email_id);
                    String question = "";
                    PreparedStatement ps = con.prepareStatement("select * from student where Email_Id=?");
                    ps.setString(1, email_id);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        PreparedStatement ps1 = con.prepareStatement("select * from securityquestion where Security_Question_Id in(select Security_Question_Id from student where Email_id=?)");
                        ps1.setString(1, email_id);
                        ResultSet rs1 = ps1.executeQuery();
                        if (rs1.next()) {
                            question = rs1.getString(2);
                        }%>

            <h1 style="font-family:'calibri';font-size:200%;color:#52ab98;"><b><%=question%></b></h1>
            <input type="text" name="ans" placeholder="Enter Answer">
            <br/><br/>
            <a href="check_ans.jsp">
                <button style="width:150px;"><b>Next</b></button>
            </a>
        </form>
            <br/>
            <h3><a href="index.jsp?id=<%=email_id%>"><button style="width:150px;"><b>Try Another Way</b></button></a></h3>
            <br/>
        <a href="student.html">
            <b>Cancel</b>
        </a>
        <%} else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('THIS EMAIL ID IS NOT REGISTERED');");
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
