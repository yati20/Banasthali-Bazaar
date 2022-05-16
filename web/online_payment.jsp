
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Options</title>
        <link rel="stylesheet" href="css/style3.css">
    </head>
    <body>
        <style>
            .extra{
                display: inline-block;
                margin:16px;
            }
            
        </style>
    <center>
        <%
            String id=request.getParameter("id");
        %>
        <h1><b>Proceed to Buy an item</b></h1>
        <br/>
        <div class="extra">
        <img src ="img/google.png" width="100px" height="150px"/>
        <img src ="img/Paytm.png" width="100px" height="150px"/>
        <img src ="img/phonePay.png" width="100px" height="150px"/>
        </div>
        <br><a href="https://pay.google.com/intl/en_in/about/?gclid=Cj0KCQjw_4-SBhCgARIsAAlegrUdOdwwSa3GHTEa1_WkI2w23rvZxmHak0r4TLryf1Tt07QMzBL-S2gaAl9wEALw_wcB&gclsrc=aw.ds" ><button style="width:150px;"><b>Google Pay</b></button></a>
       
        <a href="https://paytm.com/"><button style="width:150px;"><b>Paytm</b></button></a>
        
        <a href="https://www.phonepe.com/"><button style="width:150px;"><b>Phone pe</b></button></a>
        <br/><br/><br/>
        <button style="width:180px;" onclick="history.back()"><b>BACK</b></button>
       
    </center>
    </body>
</html>
