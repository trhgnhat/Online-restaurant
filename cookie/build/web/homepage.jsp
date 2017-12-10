<%-- 
    Document   : homepage
    Created on : 16-Nov-2017, 23:37:36
    Author     : Son
--%>
<%@page import="test.AESencrp"%>
<%@page import="test.checkloginck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           checkloginck check = new checkloginck();
            check.checkhomepage(request, response);
               
        %>
        <h1>Hello World!</h1>
       
        
    </body>
</html>
