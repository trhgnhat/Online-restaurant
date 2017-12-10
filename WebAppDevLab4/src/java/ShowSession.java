/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ShowSession extends HttpServlet {

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
        response.setContentType("text/html");
        String title = "SESSION EXAMPLE";
        String heading = "";
        HttpSession session = request.getSession(true);
        Integer accessCount = (Integer) session.getAttribute("Access");
        if (accessCount != null) {
            accessCount = (Integer) session.getAttribute("Access") + 1;
            heading = "Welcome back";

        } else {
            heading = "Welcome, newcomer";
            accessCount = 0;
        }
        session.setAttribute("Access", accessCount);
        out.println(ServletUtilities.headWithTitle(title)
                + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                + "<H1 ALIGN=\"CENTER\">" + heading
                + "</H1>\n"
                + "<TABLE ALIGN=\"CENTER\" BORDER=1>"
                + "<TR>"
                + "<TH>Info Type"
                + "<TH>Value"
                + "<TR>"
                + "<TD>Session ID"
                + "<TD>" + session.getId()
                + "<TR>"
                + "<TD>Creation Time"
                + "<TD>" + new Date(session.getCreationTime())
                + "<TR>"
                + "<TD>Creation Time"
                + "<TD>" + new Date(session.getLastAccessedTime())
                + "<TR>"
                + "<TD>Access Time"
                + "<TD>" + session.getAttribute("Access")
                + "</TABLE>"
        );
        //out.println("<h3>Note: In order to prepare for \"Keep Me Login\" exercise. After hit the button below, all available Cookies and Sessions will be remove.</h3>");
        out.println("<form method=\"GET\" action=\"LoginCheckCookie\"><button name=\"submit\" type=\"submit\" value=\"keepmelogin\">Keep Me Login</button></form>");
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
        response.setContentType("text/html");
        String title = "SESSION EXAMPLE";
        String heading = "";
        HttpSession session = request.getSession(true);
        Integer accessCount = (Integer) session.getAttribute("Access");
        if (accessCount != null) {
            accessCount = (Integer) session.getAttribute("Access") + 1;
            heading = "Welcome back";
        } else {
            heading = "Welcome, newcomer";
            accessCount = 0;
        }
        session.setAttribute("Access", accessCount);
        out.println(ServletUtilities.headWithTitle(title)
                + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                + "<H1 ALIGN=\"CENTER\">" + heading
                + "</H1>\n"
                + "<TABLE ALIGN=\"CENTER\" BORDER=1>"
                + "<TR>"
                + "<TH>Info Type"
                + "<TH>Value"
                + "<TR>"
                + "<TD>Session ID"
                + "<TD>" + session.getId()
                + "<TR>"
                + "<TD>Creation Time"
                + "<TD>" + new Date(session.getCreationTime())
                + "<TR>"
                + "<TD>Creation Time"
                + "<TD>" + new Date(session.getLastAccessedTime())
                + "<TR>"
                + "<TD>Access Time"
                + "<TD>" + session.getAttribute("Access")
                + "</TABLE>"
        );
        //out.println("<h3>Note: In order to prepare for \"Keep Me Login\" exercise. After hit the below button, all available Cookies and Sessions will be removed.</h3>");
        out.println("<form method=\"GET\" action=\"LoginCheckCookie\"><button name=\"submit\" type=\"submit\" value=\"keepmelogin\">Keep Me Login</button></form>");
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
