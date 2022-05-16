package net.codejava.email;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out1 = response.getWriter();
        // reads form fields
        String email = request.getParameter("email");
        HttpSession session=request.getSession();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "");
            Statement s = con.createStatement();
            session.setAttribute("id", email);
            PreparedStatement ps = con.prepareStatement("select * from student where Email_Id=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                boolean flag = EmailUtility.sendEmail(host, port, user, pass, email);
                if (flag == true) {
                    out1.println("<script type=\"text/javascript\">");
                    out1.println("alert('OTP is sent to your email-id');");
                    out1.println("location='enter_otp.html';");
                    out1.println("</script>");
                } else {
                    out1.println("<script type=\"text/javascript\">");
                    out1.println("alert('There is some error');");
                    out1.println("location='student.html';");
                    out1.println("</script>");
                }
            }else {
                    out1.println("<script type=\"text/javascript\">");
                    out1.println("alert('This Id is not Registered');");
                    out1.println("location='index.jsp';");
                    out1.println("</script>");
                }
        } catch (Exception ex) {
            ex.printStackTrace();
            //resultMessage = "There were an error: " + ex.getMessage();
        }
    }
}
