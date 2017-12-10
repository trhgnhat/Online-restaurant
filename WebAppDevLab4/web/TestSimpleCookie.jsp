<%-- 
    Document   : TestSimpleCookie
    Created on : Nov 16, 2017, 9:40:46 AM
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
        <h1>Test Simple Cookie</h1>
        <form method="post" action="SimpleCookie">
            <button type="submit" value="submit">submit</button>
        </form>
    </body>
</html>
