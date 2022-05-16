package net.codejava.email;

import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import newpackage.check_EmailId;
import newpackage.check_alreadyAccount;

@WebServlet(name = "check_createAccount_id", urlPatterns = {"/check_createAccount_id"})
public class check_createAccount_id extends HttpServlet {

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out1 = response.getWriter();
        // reads form fields
        try {
            String email = request.getParameter("email");
            check_EmailId obj = new check_EmailId();
            boolean flag1 = obj.check_email(email);
            if (flag1 == true) {
                check_alreadyAccount obj1 = new check_alreadyAccount();
                boolean flag2 = obj1.check_email(email);
                if (flag2 == true) {
                    HttpSession session = request.getSession();
                    session.setAttribute("id", email);
                    boolean flag = EmailUtility.sendEmail(host, port, user, pass, email);
                    if (flag == true) {
                        out1.println("<script type=\"text/javascript\">");
                        out1.println("alert('OTP is sent to your registered email-id');");
                        out1.println("location='createAccount_enter_otp.html';");
                        out1.println("</script>");
                    } else {
                        out1.println("<script type=\"text/javascript\">");
                        out1.println("alert('There is some error');");
                        out1.println("location='createAccount_enter_id.jsp';");
                        out1.println("</script>");
                    }
                } else {
                    out1.println("<script type=\"text/javascript\">");
                    out1.println("alert('You Already have an Account');");
                    out1.println("location='student.html';");
                    out1.println("</script>");
                }
            } else {
                out1.println("<script type=\"text/javascript\">");
                out1.println("alert('Only Banasthali Id is allowed');");
                out1.println("location='createAccount_enter_id.jsp';");
                out1.println("</script>");
            }
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }
}