<%-- 
    Document   : Info
    Created on : Nov 24, 2017, 12:08:40 AM
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
        <%
            out.println("Hello " + request.getParameter("fullname") + "!<br>");
            out.println("Gender: " + request.getParameter("gender") + "<br>");
            String[] courses = request.getParameterValues("course");
            if(courses != null){
                out.print("The course: ");
                for(String course : courses){
                    out.println(course + "<br>");
                }
            }
            else{
                out.println("<b>none</b>");
            }
        %>
    </body>
</html>
