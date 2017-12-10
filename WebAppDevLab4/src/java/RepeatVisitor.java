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
public class RepeatVisitor extends HttpServlet {

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
        String title = "This is a Print Cookie example";
        response.setContentType("text/html");
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
                    int count = Integer.parseInt(value);
                    count++;
                    c.setValue(count + "");
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
            response.addCookie(c);
            title = "<p>Welcome Come!!!" + "</p>";
        }
        out.println(ServletUtilities.headWithTitle(title)
                + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                + "<H1 ALIGN=\"CENTER\">" + title
                + "</H1>\n"
                + printcount
        );
        out.println("<form method=\"GET\" action=\"ShowSession\"><button value=\"testrepeatvisitor\">Show Session</button></form>");
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
        String title = "This is a Print Cookie example";
        response.setContentType("text/html");
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
                    int count = Integer.parseInt(value);
                    count++;
                    c.setValue(count + "");
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
            response.addCookie(c);
            title = "<p>Welcome Come!!!" + "</p>";
        }
        out.println(ServletUtilities.headWithTitle(title)
                + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                + "<H1 ALIGN=\"CENTER\">" + title
                + "</H1>\n"
                + printcount
        );
        out.println("<form method=\"GET\" action=\"ShowSession\"><button value=\"testrepeatvisitor\">Show Session</button></form>");
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
