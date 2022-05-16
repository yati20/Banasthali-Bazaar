<%@page import="newpackage.check_alreadyAccount"%>
<%@page import="newpackage.check_EmailId"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="newpackage.Id_Increment"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Details Of Student in Database</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                String name = request.getParameter("s_name");
                String email_id = session.getAttribute("s_email").toString();
                check_EmailId obj = new check_EmailId();
                boolean flag = obj.check_email(email_id);
                if (flag == true) {
                    check_alreadyAccount obj2 = new check_alreadyAccount();
                    boolean flag2 = obj2.check_email(email_id);
                    if (flag2 == true) {
                        String password = request.getParameter("s_password");
                        session.setAttribute("email", email_id);
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
                        // out.println("hello");
                        ResultSet rs2 = ps2.executeQuery();
                        int hostel_id = 0;
                        if (rs2.next()) {
                            hostel_id = Integer.parseInt(rs2.getString(1));
                        }
                        String s_room = request.getParameter("s_room");
                        String s_contact = request.getParameter("s_contact");
                        Id_Increment obj1 = new Id_Increment();
                        String s_id = obj1.ID();
                        PreparedStatement ps3 = con.prepareStatement("insert into student(Student_Id,Student_Name,Password,Email_Id,Security_Question_Id,Answer,Hostel_Id,Room_No,Contact_No) values(?,?,?,?,?,?,?,?,?)");
                        ps3.setString(1, s_id);
                        ps3.setString(2, name);
                        ps3.setString(3, password);
                        ps3.setString(4, email_id);
                        ps3.setInt(5, question);
                        ps3.setString(6, answer);
                        ps3.setInt(7, hostel_id);
                        ps3.setString(8, s_room);
                        ps3.setString(9, s_contact);
                        if (ps3.executeUpdate() > 0) {
        %>
        <script type="text/javascript">
            alert("Your Account is Created!!!");
        </script>
        <jsp:include page="student.html" />
        <%}else {%>
        <script type="text/javascript">
            alert("Sorry !! There is some error");
        </script>
        <jsp:include page="createAccount.jsp" />
        <%}}else {%>
        <script type="text/javascript">
            alert("You Already have an Account");
        </script>
        <jsp:include page="student.html" />
        <%}
        } else {%>
        <script type="text/javascript">
            alert("Only Bansthali Id is Allowed");
        </script>
        <jsp:include page="student.html" />
        <%}
            }catch (Exception e) {
                e.printStackTrace();
            }

        %>

    </body>
</html>
