<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Deleted</title>
        <script type="text/javascript">
            function disableBack() {
                window.history.forward();
            }
            setTimeout("disableBack()", 0);
            window.onunload = function () {
                null
            };
        </script>
    </head>
    <body>
        
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                String id = request.getParameter("id");
                int i = 0;
                PreparedStatement ps = con.prepareStatement("delete from item where Item_Id= ?");
                ps.setString(1, id);
                i = ps.executeUpdate();
                if (i == 1) {%>
        <jsp:include page="view_item.jsp" /> 
        
                    <%} else {%>
        <script type="text/javascript">
            alert("THERE IS SOME ERROR");
        </script>
        <jsp:include page="index.html" /> 
        <% }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        
        
    </body>
</html>
