<%-- 
    Document   : ExtraWelcome
    Created on : Nov 13, 2017, 8:33:24 PM
    Author     : Admin
--%>

<%@page import="Enscrypt.AES"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Extra Exercise "Keep me Login"</title>
    </head>
    <body>
        <p align="left">Welcome, 
            <%
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies){
                    if(cookie.getName().equals("username")){
                        out.println(AES.decrypt(cookie.getValue()));
                    }
                }  
            %>
        <hr>
        <a href="LoginProfile.jsp">Profile</a>
        <a href="Logout">Logout</a>
        </p>
    </body>
</html>
