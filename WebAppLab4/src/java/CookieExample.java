
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieExample extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String title = "COOKIE EXAMPLE";
        out.println(ServletUtilities.headWithTitle(title)
                + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                + "<H1 ALIGN=\"CENTER\">" + title
                + "</H1>\n"
        );

// print out cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                String name = c.getName();
                String value = c.getValue();
                out.println("<p>Name: " + name + "</p><p>Content: " + value + "</p>");
            }
        }

// set a cookie
        String name = request.getParameter("cookieName");
        if (name != null) {
            String value = request.getParameter("cookieValue");
            Cookie c = new Cookie(name, value);
            response.addCookie(c);
            out.println("<hr><p>Set a new cookies: </p>");
            out.println("<p>Name: " + name + "</p><p>Content: " + value + "</p>");
        }
        out.println("<form action=\"Ex3.html\"><input type=\"submit\" value=\"Ex3\"></form>");
        out.println("</BODY></HTML>");
    }
}
