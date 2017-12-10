<%-- 
    Document   : ExtraEx
    Created on : Nov 16, 2017, 11:00:37 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Extra Exercise</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Login</h1><hr>
        <%
            Cookie[] cookies = request.getCookies();
            if (cookies!=null){
                for (int i = 0; i < cookies.length; i++) {
                    if(cookies[i].getName().equals("checklogin")){
                        if(cookies[i].getValue().equals("fail")){
                            out.print("<p style=\"font-color: red\">Username or password incorrect</p>");
                            cookies[i].setMaxAge(0);
                            response.addCookie(cookies[i]);
                        }
                    }
                }
            }
        %>
        <form method="GET" action="ExtraCheckInfo">
            <table>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"></td>
                </tr>
            </table>
            <button type="submit" name="Login">Login</button>
        </form>
    </body>
</html>

