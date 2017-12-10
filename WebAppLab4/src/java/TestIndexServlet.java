
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
public class TestIndexServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (request.getSession(true).getAttribute("username") == null) {
            request.getRequestDispatcher("LoginTest.html").include(request, response);        
             
        }
        else{
            request.getRequestDispatcher("ExtraWelcome.jsp").include(request, response);
        }
        //request.getRequestDispatcher("TestIndex.jsp").include(request, response);
        //RequestDispatcher rs = request.getRequestDispatcher("LoginTest.html");
        //rs.include(request, response);
        response.sendRedirect("LoginTest.html");
    }

}
