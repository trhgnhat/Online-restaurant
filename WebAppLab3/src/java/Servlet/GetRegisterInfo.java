package Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class GetRegisterInfo extends HttpServlet {
    

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
            out.println("<style>");
            out.println("table {" +
                            "border-collapse: collapse;" +
                        "}\n" +
                        "table, td, th {" +
                            "border: 1px solid black;" +
                        "}\n");
            out.println("</style>");
            out.println("</head>");
            out.println("<body style=\"background-color: pink\">");
            out.println("<h1 align=\"center\">Reading Personal Information</h1>");
            out.println("<table align=\"center\" style=\"text-align: left\">"
                    + "<tr>"
                        +"<th>Full Name</th>"
                        +"<th>" + request.getParameter("name") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>ID</th>"
                        +"<th>" + request.getParameter("id") + "</th>"
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
                        +"<th>Field</th>"
                        +"<th>" + request.getParameter("field") + "</th>"
                    + "</tr>");
            out.println("<tr>"
                        + "<th>Subjects</th>"
                        +"<th>");
            String subjects[] = request.getParameterValues("subject");
            if (subjects != null){
                for (int i = 0; i<subjects.length; i++){
                    out.println(subjects[i]+"<br>");
                }
            }
            out.println("</th><tr>");
            out.println("<tr>"
                            +"<th>Comments</th>"
                            +"<th>" + request.getParameter("Comments") + "</th>"
                        + "</tr>"            
                        + "</table>");
            out.println("<form action=\"index.html\"><input type=\"submit\" value=\"Again\"></form>");
            String message = "Name: " + request.getParameter("name") 
                    + "\n ID: " + request.getParameter("id") 
                    + "\nGender" + request.getParameter("gender")
                    + "\nField: " + request.getParameter("field")
                    + "\nSubjects: ";
            if (subjects != null){
                for (int i = 0; i<subjects.length-1; i++){                
                    message += subjects[i] + ", ";
                }
                message += subjects[subjects.length] + ".";
            }
            if(SendEmail.sendEmail("trhgnhat.79@gmail.com", "Crazy123", "Register Information", message, new String[]{request.getParameter("email")})){
                System.out.println("message sent successfully....");
            }
            else{
                System.out.println("Message sent unsuccessfully!!!!");
            }
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
            out.println("<style>");
            out.println("table {" +
                            "border-collapse: collapse;" +
                        "}\n" +
                        "table, td, th {" +
                            "border: 1px solid black;" +
                        "}\n");
            out.println("</style>");
            out.println("</head>");
            out.println("<body style=\"background-color: pink\">");
            out.println("<h1 align=\"center\">Reading Personal Information</h1>");
            out.println("<table align=\"center\" style=\"text-align: left\">"
                    + "<tr>"
                        +"<th>Full Name</th>"
                        +"<th>" + request.getParameter("name") + "</th>"
                    + "</tr>"
                    + "<tr>"
                        +"<th>ID</th>"
                        +"<th>" + request.getParameter("id") + "</th>"
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
                        +"<th>Field</th>"
                        +"<th>" + request.getParameter("field") + "</th>"
                    + "</tr>");
            out.println("<tr>"
                        + "<th>Subjects</th>"
                        +"<th>");
            String subjects[] = request.getParameterValues("subject");
            if (subjects != null){
                for (int i = 0; i<subjects.length; i++){
                    out.println(subjects[i]+"<br>");
                }
            }
            out.println("</th><tr>");
            out.println("<tr>"
                            +"<th>Comments</th>"
                            +"<th>" + request.getParameter("Comments") + "</th>"
                        + "</tr>"            
                        + "</table>");
            out.println("<form action=\"index.html\"><input type=\"submit\" value=\"Again\"></form>");
            String message = "Name: " + request.getParameter("name") 
                    + "\n ID: " + request.getParameter("id") 
                    + "\nGender" + request.getParameter("gender")
                    + "\nField: " + request.getParameter("field")
                    + "\nSubjects: ";
            if (subjects != null){
                for (int i = 0; i<subjects.length-1; i++){                
                    message += subjects[i] + ", ";
                }
                message += subjects[subjects.length] + ".";
            }
            if(SendEmail.sendEmail("trhgnhat.79@gmail.com", "Crazy123", "Register Information", message, new String[]{request.getParameter("email")})){
                System.out.println("message sent successfully....");
            }
            else{
                System.out.println("Message sent unsuccessfully!!!!");
            }
            SendEmail sender = new SendEmail("Register Information", message, new String[]{request.getParameter("email")});
            sender.main(null);
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
    public static boolean sendEmail(String from, String password, String subject, String message, String[] to){  
        String host = "smtp.gmail.com";
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", password);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, null);
     //compose the message  
      try{  
         MimeMessage mimeMessage = new MimeMessage(session);  
         // get email address
         InternetAddress[] toAddress = new InternetAddress[to.length];
         for (int i=0; i<to.length;i++){
             toAddress[i] = new InternetAddress(to[i]);
             
         }
            for (InternetAddress toAddres : toAddress) {
                mimeMessage.addRecipient(Message.RecipientType.TO, toAddres);
            }
         mimeMessage.setSubject(subject);  
         mimeMessage.setText(message);
         // send email
         Transport transport = session.getTransport("smtp");
         transport.connect(host, from, password);
         transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
         transport.close();
         return true;
      }catch (MessagingException mex) 
      {
          mex.printStackTrace();
      }
      
      return false;
    }
}
