/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/SetCookies"})
public class SetCookies extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        for (int i = 0; i < 3; i++) {
            Cookie cookie = new Cookie("Session-Cookie-" + i,
                    "Cookie-Value-S" + i);
            response.addCookie(cookie);
            cookie = new Cookie("Hello" + i,
                    "Cookie-Value-P" + i);
            cookie.setMaxAge(20);
            response.addCookie(cookie);
        }
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String title = "Active Cookies";
        out.println(ServletUtilities.headWithTitle(title)
                + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                + "<H1 ALIGN=\"CENTER\">" + title
                + "</H1>\n"
                + "<form method=\"GET\" action=\"ShowCookies\">"
                + "<button type=\"submit\">HIT</buton>"
                + "</form>");
        out.println("</TABLE></BODY></HTML>");
    }
}
