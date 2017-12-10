/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class SimpleCookie extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String title = "This is a Cookie example";
        response.setContentType("text/html");
        Cookie cookie = new Cookie("Cookie", "123456");
        //cookie.setPath(System.getProperty("user.dir"));
        //cookie.setDomain(URL.gethost());
        response.addCookie(cookie);
        if (cookie != null) {
            out.println(ServletUtilities.headWithTitle(title)
                    + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                    + "<H1 ALIGN=\"CENTER\">"
                    + title
                    + "</H1>\n"
                    + "Name: "
                    + cookie.getName()
                    + "<br>Value: "
                    + cookie.getValue()
                    + "<br>Path: "
                    + cookie.getPath()
                    + "<br>Domain: "
                    + cookie.getDomain()
            );
        } else {
            out.println(ServletUtilities.headWithTitle(title)
                    + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                    + "<H1 ALIGN=\"CENTER\">"
                    + title
                    + "</H1>\n"
                    + "There is no cookie"
            );
        }
        out.println("<form action=\"TestPrintCookie.jsp\" method=\"GET<button type=\"submit\" value=\"testprintcookie\">Test Print Cookie</button></form>");
        out.println("</BODY></HTML>");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String title = "This is a Cookie example";
        response.setContentType("text/html");
        Cookie cookie = new Cookie("Cookie", "123456");
        //cookie.setPath(System.getProperty("user.dir"));
        //cookie.setDomain(URL.gethost());
        response.addCookie(cookie);
        if (cookie != null) {
            out.println(ServletUtilities.headWithTitle(title)
                    + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                    + "<H1 ALIGN=\"CENTER\">"
                    + title
                    + "</H1>\n"
                    + "Name: "
                    + cookie.getName()
                    + "<br>Value: "
                    + cookie.getValue()
                    + "<br>Path: "
                    + cookie.getPath()
                    + "<br>Domain: "
                    + cookie.getDomain()
                    + "</body></html>"
            );
        } else {
            out.println(ServletUtilities.headWithTitle(title)
                    + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                    + "<H1 ALIGN=\"CENTER\">"
                    + title
                    + "</H1>\n"
                    + "There is no cookie"
                    + "</body></html>"
            );
        }
        out.println("<form action=\"TestPrintCookie.jsp\" method=\"GET\"><button type=\"submit\" value=\"testprintcookie\">Test Print Cookie</button></form>");
        out.println("</BODY></HTML>");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
