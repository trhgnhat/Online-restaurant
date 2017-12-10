<%-- 
    Document   : list
    Created on : Nov 16, 2017, 12:10:36 AM
    Author     : junnguyen
--%>

<%@page import="vn.com.iu.scse.sample.sampleservlet.ApplicationAttributeService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vn.com.iu.scse.sample.sampleservlet.SessionService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Member List!</h3>
        
        <%
//        SessionService service = new SessionService(request.getSession());
//        ArrayList<String> memberList = service.getMemberList();
        
        ApplicationAttributeService service = new ApplicationAttributeService(request.getServletContext());
        ArrayList<String> memberList = service.getMemberList();
        

        for (String member: memberList) {
        %>
            
            <h4><%= member %></h4>
            
        <%
        }   
        %>
        
    </body>
</html>
