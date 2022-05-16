
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged Out</title>
        <link rel="stylesheet" href="css/style3.css">
        
    </head>
    <body>
        <div class="entry">
            <%
                session.removeAttribute("email");
                session.removeAttribute("pass");
                session.invalidate();
                response.sendRedirect("index.html");

            %>

        </div>

    </body>
</html>
