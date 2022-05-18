<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Functions</title>
        <link rel="stylesheet" href="css/style4.css">
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("email") == null && session.getAttribute("pass") == null) {
                response.sendRedirect("admin.html");
            }
        %>
    <center>
        <h2>Database of the Security Question</h2>
        <form action="insert_ques.jsp" method="post">
        <br/><input type="text" name="securityquestion" placeholder="Enter Security Question" style="width:280px;" required/><br/>
        <a href="insert_ques.jsp">
            <button name="operation" value="insert" style="width:100px;"><b>INSERT</b></button>
        </a>
        <a href="insert_ques.jsp">
            <button name="operation" value="delete" style="width:100px;"><b>DELETE</b></button>
        </a><br/>
        </form>
        <br/><br/>
        <a href="admin_func.jsp">
            <button style="width:100px;"><b>Back</b></button>
        </a><br/>
    </center>
</body>
</html>
