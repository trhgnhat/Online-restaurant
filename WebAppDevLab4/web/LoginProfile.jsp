<%-- 
    Document   : ExtraProfile
    Created on : Nov 13, 2017, 11:35:19 PM
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
            request.getRequestDispatcher("LoginWelcome.jsp").include(request, response);
        %>
        
        <table align="left">
            <tr>
                <th>Name</th>
                <td>Trương Hoàng Nhật</td>
            </tr>
            <tr>
                <th>ID</th>
                <td>ITITIU15086</td>
            </tr>
        </table>
    </body>
</html>
