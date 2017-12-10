
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
public class ExtraCheckInfo extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if ((request.getParameter("username").equals("trhgnhat")) && (request.getParameter("password").equals("123456"))) {
            HttpSession session = request.getSession(); //Session Creation is rejected
            session.setAttribute("username", request.getParameter("username"));
            session.setAttribute("password", request.getParameter("password"));
            response.sendRedirect("ExtraInfo");
        } else {
            //out.println("<p>Username or Password incorrect");
            Cookie cookie = new Cookie ("checklogin", "fail");
            response.addCookie(cookie);
            response.sendRedirect("ExtraEx.jsp");
        }
    }

}
