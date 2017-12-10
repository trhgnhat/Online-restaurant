package Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */

public class GetInfo extends HttpServlet {


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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetThreeParam</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1 align=\"center\">Reading Personal Information</h1>");
            out.println("<table align=\"center\">"
                    + "<tr>"
                        +"<th>ID</th>"
                        +"<th>" + request.getParameter("id") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>Name</th>"
                        +"<th>" + request.getParameter("name") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>Email</th>"
                        +"<th>" + request.getParameter("email") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>Gender</th>"
                        +"<th>" + request.getParameter("gender") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>Major</th>"
                        +"<th>" + request.getParameter("major") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>Interesting Field</th>"
                        +"<th>" + request.getParameter("interestingfield") + "</th>"
                    + "</tr>"            
                    + "</table>");
            out.println("<form action=\"RegisterForm.jsp\"><input type=\"submit\" value=\"Ex3\"></form>");
            out.println("</body>");
            out.println("</html>");
        }
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetThreeParam</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1 align=\"center\">Reading Personal Information</h1>");
            out.println("<table align=\"center\">"
                    + "<tr>"
                        +"<th>ID</th>"
                        +"<th>" + request.getParameter("id") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>Name</th>"
                        +"<th>" + request.getParameter("name") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>Email</th>"
                        +"<th>" + request.getParameter("email") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>Gender</th>"
                        +"<th>" + request.getParameter("gender") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>Major</th>"
                        +"<th>" + request.getParameter("major") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>Interesting Field</th>"
                        +"<th>" + request.getParameter("interestingfield") + "</th>"
                    + "</tr>"            
                    + "</table>");
            out.println("<form action=\"RegisterForm.jsp\"><input type=\"submit\" value=\"Ex3\"></form>");
            out.println("</body>");
            out.println("</html>");
        }
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
