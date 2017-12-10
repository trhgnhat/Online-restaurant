<%-- 
    Document   : ExtraWelcome
    Created on : Nov 13, 2017, 8:33:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Extra Exercise</title>
    </head>
    <body>
        <p align="left">Welcome, 
            <%
                out.println(request.getSession(false).getAttribute("username"));
            %>
        
        <a href="ExtraProfile.jsp">Profile</a>
        <a href="ExtraLogout">Logout</a>
        </p>
    </body>
</html>
