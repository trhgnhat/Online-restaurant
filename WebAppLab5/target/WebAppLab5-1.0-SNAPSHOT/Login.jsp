<%-- 
    Document   : Login
    Created on : Nov 23, 2017, 10:57:36 PM
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
        <%@ page session="false" %>
        <h1>Please enter username and password to login</h1><hr>
        <form method="GET" action="HomePage.jsp">
            <p>Username
                <input type="text" name="username">
            </p>
            <p>Password
                <input type="password" name="password">
            </p>
            <p>
                <input type="submit" name="login" value="Login">
            </p>
        </form>
        
    </body>
</html>
