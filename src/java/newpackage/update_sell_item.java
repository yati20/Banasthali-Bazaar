package newpackage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "update_sell_item", urlPatterns = {"/update_sell_item"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class update_sell_item extends HttpServlet {
    PrintWriter out1;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out1 = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement s = con.createStatement();
            HttpSession session=request.getSession();
            String i_id = session.getAttribute("i_id").toString();
            out1.println(i_id);
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
                out1.println("<script type=\"text/javascript\">");
                out1.println("alert('Item Updated Successfully');");
                out1.println("location='homepg.jsp';");
                out1.println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
