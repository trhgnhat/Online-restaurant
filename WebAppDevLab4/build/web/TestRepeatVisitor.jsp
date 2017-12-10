<%-- 
    Document   : TestRepeatVisitor
    Created on : Nov 16, 2017, 10:49:05 AM
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
        <%
            String button = request.getParameter("submit");
            if (button != null) {
                Cookie[] cookie = request.getCookies();
                for (int i = 0; i < cookie.length; i++) {
                    cookie[i].setValue("0");
                    response.addCookie(cookie[i]);
                }
            }
            button = null;
        %>
        <h1>Test Repeat Visitor</h1>
        <form method="GET" action="RepeatVisitor">
            <p>Your Name:
                <input type="text" name="name">
            </p>
            <button type="submit" value="submit">submit</button>
        </form>
    </body>
</html>
