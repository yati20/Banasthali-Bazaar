package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LogOut", urlPatterns = {"/LogOut"})
public class LogOut extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        session.removeAttribute("email");
        session.removeAttribute("pass");
        session.invalidate();
        request.getSession(false);
        response.sendRedirect(request.getContextPath() + "/index.html");
    }

}
