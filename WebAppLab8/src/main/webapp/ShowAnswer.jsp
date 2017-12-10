<%-- 
    Document   : ShowAnswer
    Created on : Dec 9, 2017, 12:53:53 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Your Answer is</h3>
        <p>Your name: <% out.println(request.getParameter("name")); %></p>
        <p>Your gender: <% out.println(request.getParameter("gender")); %></p>
    </body>
</html>
