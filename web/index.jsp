<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Send an e-mail</title>
         <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
        <center>
            <div class="entry">
                <div class="imgcontainer">
            <img src="img/BanasthaliBazaar.png" alt="logo" class="logos">
            
          </div>
            <form action="EmailSendingServlet" method="post">
                <h2><b>Enter Registered Email-Id</b></h2> <br/>
                <input type="email" name="email" placeholder="Enter your E-mail address"required>
                <br/>
                <button style="width:160px;"><b>NEXT</b></button>
            </form>
            <a href="student.html" ><button style="width:160px;"><b>BACK</b></button></a>
            </div>
        </center>
    </body>
</html>