<%-- 
    Document   : Feedback_1
    Created on : 29 Apr, 2022, 9:36:21 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SEND FEEDBACK</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("email") == null && session.getAttribute("pass") == null) {
                response.sendRedirect("student.html");
            }
        %>
        <div>
            <img src="img/BanasthaliBazaar.png" alt="logo" class="logos">
        </div>
        <div class="feedbackform">
            <form action="feedback.jsp">
                <h2  style="font-family:'Arial';font-size:250%;color: #52ab98;"><b>Any Message For Us ?</b></h2>
                <br>
                <input type="text" name="Name" placeholder="Enter Name" />
                <br>
                <br>
                <textarea rows="8" cols="42" name="feedback" placeholder="Enter Your Feedback" required></textarea>
                <br>
                <a href="feedback.jsp">
                    <button style="width:150px;"><b>SUBMIT</b></button>
                </a>
            </form>
            <br>
            <a href="homepg.jsp">
                <button style="width:150px;"><b>CANCEL</b></button>
            </a>
        </div>
    </body>
</html>
