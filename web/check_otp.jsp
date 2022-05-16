<%@page import="net.codejava.email.EmailUtility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checking OTP</title>
        <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
    <center>
        <form action="check_pwd_1.jsp" method="POST">
            <%
                String email=session.getAttribute("id").toString();
                out.println(email);
                session.setAttribute("email_id",email);
                String enter_otp = request.getParameter("otp");
                String send_otp = EmailUtility.otp;
                if (enter_otp.equals(send_otp)) {%>
            <h1><b>CREATE NEW PASSWORD</b></h1>
            <br/>
            <h2><b>Enter new password    </b></h2><br>
            <input type="password" name="new_pwd"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" placeholder="Enter new password">
            <h5>(Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters)</h5>
            <h2><b>Confirm new password    </b></h2><br>
            <input type="password" name="confirm_pwd" placeholder="Enter new password">
            <br/>
            <button style="width:150px;"><b>Submit</b></button>
        </form>
            <br/>
        <a href="index.jsp">
            <button style="width:150px;"><b>Cancel</b></button>
        </a>   
        <%} else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('You have entered the wrong OTP');");
                out.println("location='index.jsp';");
                out.println("</script>");
            }

        %>
    </center>
</body>
</html>
