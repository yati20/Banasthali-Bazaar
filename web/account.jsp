<%@page import="newpackage.DB"%>
<%@page import="java.sql.*"%>
<%@page import="newpackage.Track_S_Id"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Account</title>
        <link rel="stylesheet" href="css/style4.css">
    </head>
    <body>
    <div class="entry">
        <form action="edit.jsp" method="post">
            <%
                String s_id = Track_S_Id.s_id;
                session.setAttribute("st_id", s_id);
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    Statement s = con.createStatement();
                    PreparedStatement ps = con.prepareStatement("select * from student where Student_Id=?");
                    ps.setString(1, s_id);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {%>
            <h3 style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-size:220%;color:#422113;"><b>Update Your Account</b></h3>
            <p>Student Name</p><input type="text" name="s_name" value="<%=rs.getString(2)%>" required/><br/>
            <p>Student Email-Id</p><input type="email" name="s_email" value="<%=rs.getString(4)%>" required/><br/>
            <p>Security Question</p>
            <select name="s_question">
                <%
                    String question_id = rs.getString(5);
                    PreparedStatement ps4 = con.prepareStatement("select * from securityquestion where Security_Question_id=?");
                    PreparedStatement ps5 = con.prepareStatement("select * from securityquestion");
                    ps4.setString(1, question_id);
                    ResultSet rs4 = ps4.executeQuery();
                    ResultSet rs5 = ps5.executeQuery();
                    String question = "";
                    String s_question = "";
                    if (rs4.next()) {
                        s_question = rs4.getString(2);
                    }%>
                <option value="<%=s_question%>"><%=s_question%></option>
                <%while (rs5.next()) {
                        question = rs5.getString(2);
                %>
                <option value="<%=question%>"><%=question%></option>
                <%}%>
            </select>
             <p>Security Answer</p><input type="text" name="s_ans" value="<%=rs.getString(6)%>" required/><br/>
             <p>Hostel Name</p>
            <select name="hostel">
                <%
                    String hostel_id = rs.getString(7);
                    PreparedStatement ps2 = con.prepareStatement("select * from hostel where Hostel_id=?");
                    PreparedStatement ps3 = con.prepareStatement("select * from hostel");
                    ps2.setString(1, hostel_id);
                    ResultSet rs2 = ps2.executeQuery();
                    ResultSet rs3 = ps3.executeQuery();
                    String hostel = "";
                    String s_hostel = "";
                    if (rs2.next()) {
                        s_hostel = rs2.getString(2);
                    }%>
                <option value="<%=s_hostel%>"><%=s_hostel%></option>
                <%while (rs3.next()) {
                        hostel = rs3.getString(2);
                %>
                <option value="<%=hostel%>"><%=hostel%></option>
                <%}%>
            </select>
            <p>Room Number</p><input type="text" name="s_room" value="<%=rs.getString(8)%>" required/><br/>
            <p>Contact Number</p><input type="text" name="s_contact" value="<%=rs.getString(9)%>" required/><br/>
            <a href="edit.jsp">
                <button><b>UPDATE</b></button>
            </a>
        </form>
        <a href="profile.jsp">
            <button><b>CANCEL</b></button>
        </a>
        <%}
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

    </div>
</body>
</html>
