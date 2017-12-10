/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import DO.StudentDO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import vn.edu.hcmiu.scse.lab5.courseregisterproject.DatabaseService;

/**
 *
 * @author Admin
 */
public class Student extends HttpServlet {

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
        String studentID = request.getParameter("studentID");
        DatabaseService databaseService = new DatabaseService();
        ArrayList<StudentDO> listOfStudents = databaseService.getAllStudents();
        HttpSession session = request.getSession();
        boolean check = false;
        for (StudentDO student : listOfStudents) {
            if(student.getId().equals(studentID)){              
                session.setAttribute(student.getId(), studentID);
                check = true;
                response.sendRedirect("StudentView.jsp");
                //request.getRequestDispatcher("StudentView.jsp").forward(request, response);               
            }           
        }
        if (check == false){
            response.sendRedirect("index.jsp");
        }
        //request.getRequestDispatcher("index.html").forward(request, response);
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
