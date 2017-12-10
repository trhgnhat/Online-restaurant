package Servlet;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {
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
    static String message;
    static String subject;
    static String[] to;
    public SendEmail(String message, String subject, String[] to){
        SendEmail.message = message;
        SendEmail.subject = subject;
        SendEmail.to = to;
    }
    public static String[] getTo(){
        return to;
    }
    public static String getMessage(){
        return message;
    }
    public static String getSubject(){
        return subject;
    }
    public static void main(String[] agrs){
        
        if (sendEmail("trhgnhat.97@gmail.com", "Crazy123", getSubject(), getMessage(), getTo())){
            System.out.println("message sent successfully...."); 
        }
        else
        {
            System.out.println("Message sent unsuccessfully!!!!");
        }
    }
}