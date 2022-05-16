<%@page import="net.codejava.email.EmailUtility"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create account</title>
        <link rel="stylesheet" href="css/style4.css">

    </head>
    <body>
    <center>
        <div class="entry">
            <form action="insertAccount.jsp" method="post">
                <%
                    String email = session.getAttribute("id").toString();
                    session.setAttribute("s_email",email);
                    String enter_otp = request.getParameter("otp");
                    String send_otp = EmailUtility.otp;
                 
                    if (enter_otp.equals(send_otp)) {%>
                <h2><b>Create Your Account at Banasthali Bazaar</b></h2>
                E-mail Id: <%=email%><br><br>
                <input type="text" name="s_name" placeholder="Enter Your Name" required/><br/><br/>
                <input type="password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" name="s_password"  maxlength="8" placeholder="Create Password" required/>
                <br/><br/>
                <h5>(Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters)</h5><br/><br/>
                
                <select name="s_question" required>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                            Statement s = con.createStatement();
                            ResultSet rs = s.executeQuery("select * from securityquestion");%>
                    <option value="">Select Your Security Question</option>        
                    <%while (rs.next()) {
                            String s_question = rs.getString(2);
                    %>
                    <option value="<%=s_question%>"><%=s_question%></option>
                    <%}
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
                <br/><br/>
                <input type="text" name="s_ans" placeholder="Enter Your Answer" required/><br/><br/>
                <select name="hostel" required>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                            Statement ss = conn.createStatement();
                            ResultSet rss = ss.executeQuery("select * from hostel");%>
                    <option value="" disabled selected hidden>Select Your Hostel</option>        
                    <%while (rss.next()) {
                            String hostel = rss.getString(2);
                    %>
                    <option value="<%=hostel%>"><%=hostel%></option>
                    <%}
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
                <br/><br/>
                <input type="text" name="s_room" placeholder="Enter Your Room Number" required/><br/><br/>
                <input type="text" name="s_contact" placeholder="Enter Your Contact Number" required/><br/><br/>
                <h5>(Prefer to enter your Whatsapp number)</h5>
                <a href="insertAccount.jsp"><button style="width:150px;"><b>CREATE ACCOUNT</b></button></a><br/><br/>
            </form>
            <a href="student.html"><button style="width:150px;"><b>CANCEL</b></button></a><br/><br/><br/>
            <%} else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Your have entered the wrong otp');");
                    out.println("location='createAccount_enter_id.jsp';");
                    out.println("</script>");
                }%>

        </div>
    </center>
</body>
</html>
