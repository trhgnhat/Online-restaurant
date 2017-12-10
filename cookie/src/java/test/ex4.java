/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Son
 */
public class ex4 extends HttpServlet {

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
            out.println("<title>Servlet ex4</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ex4 at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String heading;
        Integer accessCount =
        (Integer)session.getAttribute("accessCount");
        if (accessCount == null) {
        accessCount = new Integer(0);
        heading = "Welcome, Newcomer";
        } else {
        heading = "Welcome Back";
        accessCount = new Integer(accessCount.intValue() + 1);
        }
        // Integer is an immutable data structure. So, you
        // cannot modify the old one in-place. Instead, you
        // have to allocate a new one and redo setAttribute.
        session.setAttribute("accessCount", accessCount);
        PrintWriter out = response.getWriter();
        String title = "Session Tracking Example";
        String docType =
        "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
        "Transitional//EN\">\n";
        out.println(docType +
        "<HTML>\n" +
        "<HEAD><TITLE>" + title + "</TITLE></HEAD>\n" +
        "<BODY BGCOLOR=\"#FDF5E6\">\n" +
        "<CENTER>\n" +
        "<H1>" + heading + "</H1>\n" +
        "<H2>Information on Your Session:</H2>\n" +
        "<TABLE BORDER=1>\n" +
        "<TR BGCOLOR=\"#FFAD00\">\n" +
        " <TH>Info Type<TH>Value\n" +
        "<TR>\n" +
        " <TD>ID\n" +
        " <TD>" + session.getId() + "\n" +
        "<TR>\n" +
        " <TD>Creation Time\n" +
        " <TD>" +
        new Date(session.getCreationTime()) + "\n" +
        "<TR>\n" +
        " <TD>Time of Last Access\n" +
        " <TD>" +
        new Date(session.getLastAccessedTime()) + "\n" +
        "<TR>\n" +
        " <TD>Number of Previous Accesses\n" +
        " <TD>" + accessCount + "\n" +
        "</TABLE>\n" +
        "</CENTER></BODY></HTML>");
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
        processRequest(request, response);
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
