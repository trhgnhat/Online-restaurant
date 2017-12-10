
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex3Cookies extends HttpServlet {

    private static int count;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String title = "COOKIE EXAMPLE";
        String printcount = "";
// Check if user are newbie or oldie
        boolean newbie = true;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                String name = c.getName();
                String value = c.getValue();
                //If the user is an oldie
                if (name.equals(request.getParameter("name"))) {
                    count = Integer.parseInt(value);
                    count++;
                    c.setValue(count + "");
                    c.setMaxAge(3600);
                    response.addCookie(c);
                    newbie = false;
                    title = "<p>Welcome Back, " + cookies[i].getName() + "</p>";
                    printcount = "<p ALIGN=\"CENTER\">Count: " + cookies[i].getValue() + "</p>";
                    break;
                }
            }

        }

// If the user is a newbie
        if (newbie) {
            Cookie c = new Cookie(request.getParameter("name"), "0");
            c.setMaxAge(3600);
            response.addCookie(c);
            title = "<p>Welcome Come!!!" + "</p>";
        }
        out.println(ServletUtilities.headWithTitle(title)
                + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                + "<H1 ALIGN=\"CENTER\">" + title
                + "</H1>\n"
                + printcount
        );
        out.println("</BODY></HTML>");
    }
}
