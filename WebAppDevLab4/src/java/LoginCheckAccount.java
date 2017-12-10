
import Enscrypt.AES;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class LoginCheckAccount extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            if ((request.getParameter("username").equals("admin")) && (request.getParameter("password").equals("123456"))) {

                response.addCookie(new Cookie("username", AES.encrypt(request.getParameter("username"))));
                response.addCookie(new Cookie("password", AES.encrypt(request.getParameter("password"))));

                response.addCookie(new Cookie("isLoggedIn", AES.encrypt("yes")));
            } else {
                response.addCookie(new Cookie("isLoggedIn", AES.encrypt("no")));
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginCheckAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("LoginCheckCookie");

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            if ((request.getParameter("username").equals("admin")) && (request.getParameter("password").equals("123456"))) {

                response.addCookie(new Cookie("username", AES.encrypt(request.getParameter("username"))));
                response.addCookie(new Cookie("password", AES.encrypt(request.getParameter("password"))));

                response.addCookie(new Cookie("isLoggedIn", AES.encrypt("yes")));
            } else {
                response.addCookie(new Cookie("isLoggedIn", AES.encrypt("no")));
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginCheckAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("LoginCheckCookie");
    }
}
