<%-- 
    Document   : TestPrintCookie
    Created on : Nov 16, 2017, 10:04:52 AM
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
        <h1>Print out the Cookies</h1><hr>
        <form method="post" action="PrintCookie">
            <p>Cookie Name:
                <input type="text" name="cookieName">
            </p>
            <p>Cookie Value:
                <input type="text" name="cookieValue">
            </p>
            <button type="submit" value="submit">submit</button>
        </form>
    </body>
</html>
