<%-- 
    Document   : HELP
    Created on : 29 Apr, 2022, 9:39:07 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <style>
            body{
                background-image: url("img/gray\ bg.jpg");
                background-color: #cccccc;
            }
            .itemcontainer{
                align-items: center;
            }
            .logo{
                width:80px;
                height: 80px;
                border-radius: 80px;
            }
            .entry{
                width:70vw;
                margin:90px 200px;
                font-size: large;
                background-color: #ceddd8;
                color: rgb(19, 18, 18);
                padding:20px 30px;
                line-height: 5vh;
            }
            .entry h2{
                color:#52ab98;

            }
            .entry h3{
                color:brown;

            }
        </style>
    <center>
        <div class="imgcontainer">
            <img src="img/BanasthaliBazaar.png" alt="logo" class="logo">
        </div>
        <h1 style="color:#52ab98"><b>BANSTHALI BAZAAR HELP DESK</b></h1>
        <br><a href="homepg.jsp"> Back to Home Page</a>
    </center>
    <div class="entry">

        <article>
            <h2>About Banasthali Bazaar:</h2>
            <p>Banasthali Bazaar is online shopping space for Banasthalites where they
                can post the advertisements to sell and resell their items. The purpose is to
                ease the task of buying and selling/reselling of essentials in 850 acre University campus.
            </p><br>
            <h2>How to use our website</h2>
            <p>Upon entering the website, there are two options-<br> ADMIN LOGIN and STUDENT LOGIN.
                Students must select student login to reach login page.</p><br>
            <ul>
                <li><h3>Student Login:</h3>
                    <p>Student needs to enter login credentials to access functionalities.
                        If not already registered, create account from CREATE ACCOUNT BUTTON.
                        To reset password, click FORGOT PASSWORD.</p></li>

                <li><h3>How to Create Account?</h3>
                    <p>For creating account enter your BANASTHALI.IN email id. An OTP will
                        be sent on mail-id. Enter the OTP.You will be directed to enter the essential
                        information. Fill the form and submit.A message will be displayed upon account creation.</p></li>

                <li><h3>How to Reset Password?</h3>
                    <p>There are two options. One through answering security question and the other
                        through OTP verification. Choose TRY ANOTHER WAY to change password through OTP.</p></li>

                <li><h3>How do I edit my details?</h3>
                    <p>Changed the hostel or contact number? Don't worry...you may go to MY ACCOUNT button
                        on home page to update your items and profile.</p></li>

                <li><h3>How to display Item for sale?</h3>
                    <p>After Login, Click SELL ITEM button on top of home page. Enter the details and
                        click SELL ITEM. To edit details click EDIT ITEM.</p></li>

                <li><h3>How to see item and seller details?</h3>
                    <p>Click on item image to open details about seller and item.</p></li>

                <li><h3>How do I save my favorite Items?</h3>
                    <p>Wanna take time before contacting seller? You have your wishlist! Every Item displayed 
                        could be saved to your wishlist by clicking on the ADD TO WISHLIST displayed at bottom of every
                        item.</p></li>
            </ul>
            <br>
            <center><h2>Need more help?</h2><br><b>Drop a mail at : <a href='banasthalibazaar.project@gmail.com'>banasthalibazaar.project@gmail.com</a></b>
                <br><br><h2>KEEP VISITING...</h2><br><br>
                <a href="homepg.jsp"> Back to Home Page</a>
            </center>
        </article>
    </div>
</body>
</html>
