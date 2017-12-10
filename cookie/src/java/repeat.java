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
 * @author Son
 */
public class repeat extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet repeat</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet repeat at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
                   boolean newbie = true;
                   int count=0;
Cookie[] cookies = request.getCookies();
       if (cookies != null) {
        for(int i=0; i<cookies.length; i++) {
            Cookie c = cookies[i];
              if ((c.getName().equals("repeatVisitor")) && (c.getValue().equals("yes"))) 
// Could omit test and treat cookie name as a flag
{
newbie = false;
break;
}
}
}   
       String title;
if (newbie) {
Cookie returnVisitorCookie =
new Cookie("repeatVisitor", "yes");
returnVisitorCookie.setMaxAge(60*60*24*365); // 1 year
response.addCookie(returnVisitorCookie);
title = "Welcome Aboard";
System.out.println(count);
} else {
    count++;
title = "Welcome Back";
System.out.println(count);
}

PrintWriter out = response.getWriter();
String docType =
"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
"Transitional//EN\">\n"; out.println(docType +
"<HTML>\n" +
"<HEAD><TITLE>" + title + "</TITLE></HEAD>\n" +
"<BODY BGCOLOR=\"#FDF5E6\">\n" +
"<H1 ALIGN=\"CENTER\">" + title + "</H1>\n" + count +
"</BODY></HTML>");
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
//             String firstName = request.getParameter("fname");
//        String lastName = request.getParameter("lname");
//
//      Cookie c = new Cookie("myname", firstName + lastName);
//      c.setMaxAge(60 * 60 * 24 * 7);
//        response.addCookie(c);
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
