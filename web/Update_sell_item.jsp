<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Item Details</title>
        <link rel="stylesheet" href="css/style4.css">
    </head>
    <body>
    <div class="entry">
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                Statement s = con.createStatement();
                String i_id = session.getAttribute("id").toString();
                PreparedStatement ps = con.prepareStatement("select * from item where Item_Id=?");
                ps.setString(1, i_id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String category = request.getParameter("s_category");
                    PreparedStatement ps1 = con.prepareStatement("select Category_Id from category where Category_Name=?");
                    ps1.setString(1, category);
                    ResultSet rs1 = ps1.executeQuery();
                    int category_id = 0;
                    if (rs1.next()) {
                        category_id = Integer.parseInt(rs1.getString(1));
                    }
                    String title = request.getParameter("i_title");
                    String description = request.getParameter("i_description");
                    int price = Integer.parseInt(request.getParameter("i_price"));
                    PreparedStatement ps2 = con.prepareStatement("update item set Item_Name=? , Item_Description=? , Item_Price=? , Category_Id=? where Item_Id=? ");
                    ps2.setString(1, title);
                    ps2.setString(2, description);
                    ps2.setInt(3, price);
                    ps2.setInt(4, category_id);
                    ps2.setString(5, i_id);
                    if (ps2.executeUpdate() > 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Item Updated Successfully');");
                out.println("location='homepg.jsp';");
                out.println("</script>");
            }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</body>
</html>
