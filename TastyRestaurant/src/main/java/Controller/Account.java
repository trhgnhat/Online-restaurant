/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DBConnector.MemberDS;
import DO.MemberDO;
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
public class Account extends HttpServlet {

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
        String action = request.getParameter("action");

        if (action.equals("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username.equals("") || password.equals("")) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please enter Username and Password !');");
                out.println("location='homepage.html';");
                out.println("</script>");
            } else {
                MemberDO member = new MemberDS().getMember(username, password);
                if (member != null) {
                    request.getSession().setAttribute("member", member);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Login Success !');");
                    out.println("location='menu.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Username or Password invalid !');");
                    out.println("location='homepage.html';");
                    out.println("</script>");
                }
            }
        }
        if (action.equals("logout")) {
            request.getSession().invalidate();
        }
        if (action.equals("register")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("fullname");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String credit_card = request.getParameter("credit_card");
            int id = new MemberDS().getAllMembers().size()+1;
            MemberDO member = new MemberDO(id, username, password, name, address, phone, email, 0, credit_card);
            if (new MemberDS().createMember(member) == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Register success!');");
                out.println("location='homepage.html';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + new MemberDS().createMember(member) + "');");
                out.println("location='register.jsp';");
                out.println("</script>");
            }
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
