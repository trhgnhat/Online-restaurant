<%-- 
    Document   : HomePage
    Created on : Nov 23, 2017, 10:27:29 PM
    Author     : Admin
--%>

<%@page import="java.lang.Integer"%>
<%@page import="com.mycompany.webapplab5.DatabaseService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page session="false" %>
        <h1>Login Success !!!</h1>
        <%
            DatabaseService ds = new DatabaseService();
            if (ds.checkAccount(request.getParameter("username"), request.getParameter("password")) == false) {
                response.sendRedirect("index.html");
            } else {
                Cookie[] cookies = request.getCookies();
                boolean newbie = true;
                int accessCount = 0;
                if (cookies == null) {
                    Cookie cookie = new Cookie(request.getParameter("username"), "0");
                    response.addCookie(cookie);
                } else {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals(request.getParameter("username"))) {
                            accessCount = Integer.parseInt(cookie.getValue());
                            accessCount++;
                            cookie.setValue(accessCount + "");
                            response.addCookie(cookie);
                            newbie = false;
                        }
                    }
                }
                if (newbie) {
                    out.println("<h2>Welcome aboard</h2>");
                } else {
                    out.println("<h2>Welcome again</h2>");
                }
                out.println("<p>Count: " + accessCount + "</p>");
            }
        %>
        <form method ="POST" action="Info.jsp">
            <p>Full name 
                <input type="text" name="fullname">
            </p>
            <p>Gender 
                <input type="radio" name="gender" value="Male">Male
                <input type="radio" name="gender" value="Female">Female
            </p>
            <p>Course: 
            <p><input type="checkbox" name="course" value="Object Oriented Programming">Object Oriented Programming</p>
            <p><input type="checkbox" name="course" value="Web Application Development">Web Application Development</p>
            <p><input type="checkbox" name="course" value="Software Engineering">Software Engineering</p>
        </p>
        <p>
            <input type="submit" value="Show Info">
        </p>
    </form>
</body>
</html>
