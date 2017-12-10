<%-- 
    Document   : account
    Created on : Nov 30, 2017, 9:59:05 AM
    Author     : Admin
--%>

<%@page import="com.mycompany.webapplab6.AccountBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Please provide your account information</h1>
        <form method="POST" action="ShoppingServlet?action=showproducts">
            <table border="0" style="text-align: left">
                <tr>
                    <th>Name: </th>
                    <td><input type="text" name="name" /></td>
                </tr>
                <tr>
                    <th>VISA CARD NUMBER: </th>
                    <td><input type="text" name="visaCard" /></td>
                </tr>
                <tr>
                    <th>Address: </th>
                    <td><input type="text" name="address" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit" name="submit" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
