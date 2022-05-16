<%@page import="newpackage.Track_S_Id"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        
            <%

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    Statement s = con.createStatement();
                    String s_id = session.getAttribute("st_id").toString();
                    String name = request.getParameter("s_name");
                    String email_id = request.getParameter("s_email");
                    String s_question = request.getParameter("s_question");
                    PreparedStatement ps1 = con.prepareStatement("select Security_Question_Id from securityquestion where Security_Question=?");
                    ps1.setString(1, s_question);
                    ResultSet rs1 = ps1.executeQuery();
                    int question = 0;
                    if (rs1.next()) {
                        question = Integer.parseInt(rs1.getString(1));
                    }
                    String answer = request.getParameter("s_ans");
                    String s_hostel = request.getParameter("hostel");
                    PreparedStatement ps2 = con.prepareStatement("select Hostel_Id from hostel where Hostel_Name=?");
                    ps2.setString(1, s_hostel);
                    ResultSet rs2 = ps2.executeQuery();
                    int hostel_id = 0;
                    if (rs2.next()) {
                        hostel_id = Integer.parseInt(rs2.getString(1));
                    }
                    String s_room = request.getParameter("s_room");
                    String s_contact = request.getParameter("s_contact");
                    PreparedStatement ps = con.prepareStatement("update Student set Student_Name=? , Email_Id=? , Security_Question_Id=? , Answer=? , Hostel_Id=? , Room_No=? , Contact_No=? where Student_Id=?");
                    ps.setString(1, name);
                    ps.setString(2, email_id);
                    ps.setInt(3, question);
                    ps.setString(4, answer);
                    ps.setInt(5, hostel_id);
                    ps.setString(6, s_room);
                    ps.setString(7, s_contact);
                    ps.setString(8, s_id);
                    int c=ps.executeUpdate();
                    if (c > 0) {%>
            <script type="text/javascript">
                alert("Your account has been updated");
            </script>
            <jsp:include page="profile.jsp" /> 
            <%} else {%>
            <script type="text/javascript">
                alert("There is some error");
            </script>
            <jsp:include page="account.jsp" /> 
                    <%}
                } catch (Exception e) {
                    e.printStackTrace();
                }


            %>
        
    </center>
</body>
</html>
