package net.codejava.email;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadImage extends HttpServlet {

    PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        String c_name = request.getParameter("c_name");
        out.println(c_name);
        String operation = request.getParameter("operation");
        out.println(operation);
        Part part = request.getPart("image");
        if (part != null) {
            out.println("Hello....1");
            try {
                if (operation.equals("insert")) {
                    out.println("Hello....2");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    Statement s = con.createStatement();
                    out.println("Connected Successfully");
                    PreparedStatement ps = con.prepareStatement("insert into category(Category_Name,Category_Img) values(?,?)");
                    InputStream is = part.getInputStream();
                    ps.setString(1, c_name);
                    ps.setBlob(2, is);
                    result = ps.executeUpdate();
                    if (result > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Inserted');");
                        out.println("location='add_category.jsp';");
                        out.println("</script>");
                    }
                } else {
                    out.println("Hello....3");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
                    Statement s = con.createStatement();
                    out.println("Connected Successfully");
                    PreparedStatement ps2 = con.prepareStatement("delete from category where Category_Name=?");
                    ps2.setString(1, c_name);
                    result = ps2.executeUpdate();
                    if (result > 0) {
                        out.println("Hello....4");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Deleted');");
                        out.println("location='add_category.jsp';");
                        out.println("</script>");
                    }
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

}
