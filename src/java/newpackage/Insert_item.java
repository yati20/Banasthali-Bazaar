package newpackage;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Insert_item", urlPatterns = {"/Insert_item"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class Insert_item extends HttpServlet {
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
            HttpSession session = request.getSession();
            String s_id = Track_S_Id.s_id;
            String category = request.getParameter("s_category");
            PreparedStatement ps1 = con.prepareStatement("select Category_Id from category where Category_Name=?");
            ps1.setString(1, category);
            ResultSet rs1 = ps1.executeQuery();
            int category_id = 0;
            if (rs1.next()) {
                category_id = Integer.parseInt(rs1.getString(1));
            }
            String title = request.getParameter("i_name");
            String description = request.getParameter("i_description");
            Part part = request.getPart("i_img");
            int price = Integer.parseInt(request.getParameter("i_price"));
            Item_Id obj = new Item_Id();
            String i_id = obj.ID();
            if (part != null) {
                PreparedStatement ps2 = con.prepareStatement("insert into item(Item_Id,Item_Name,Item_Description,Item_Img,Item_Price,Student_Id,Category_Id) values(?,?,?,?,?,?,?)");
                ps2.setString(1, i_id);
                ps2.setString(2, title);
                ps2.setString(3, description);
                InputStream is = part.getInputStream();
                ps2.setBlob(4, is);
                ps2.setInt(5, price);
                ps2.setString(6, s_id);
                ps2.setInt(7, category_id);
                if (ps2.executeUpdate() > 0) {
                    session.setAttribute("id",i_id);
                    response.sendRedirect("view_sell_item.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}