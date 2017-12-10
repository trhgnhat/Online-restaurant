/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ShowCookies extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String title = "Active Cookies";
        out.println(ServletUtilities.headWithTitle(title)
                + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                + "<H1 ALIGN=\"CENTER\">" + title
                + "</H1>\n"
                + "<TABLE BORDER=1 ALIGN=\"CENTER\">\n"
                + "<TR BGCOLOR=\"#FFAD00\">\n"
                + " <TH>Cookie Name\n"
                + " <TH>Cookie Value");
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            Cookie cookie;
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                out.println("<TR>\n"
                        + " <TD>" + cookie.getName() + "\n"
                        + " <TD>" + cookie.getValue());
            }
        }
        out.println("</TABLE></BODY></HTML>");
        
    }
}
