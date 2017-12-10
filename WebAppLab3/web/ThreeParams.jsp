<%-- 
    Document   : ThreeParams
    Created on : Oct 26, 2017, 8:47:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: pink">
        <h1>Collect Three Parameters</h1>
        <form method="GET" action="GetThreeParam">
            <table style="text-align: left">
                <tr>
                    <th>First Parameter</th>
                    <th>
                        <input type="text" name="firstparam">
                    </th>
                </tr>
                <tr>
                    <th>Second Parameter</th>
                    <th>
                        <input type="text" name="secondparam">
                    </th>
                </tr>
                <tr>
                    <th>Third Parameter</th>
                    <th>
                        <input type="text" name="thirdparam">
                    </th>
                </tr>
                <tr>
                    <th></th>
                    <th>
                        <input type="submit" value="Submit">
                    </th>
                </tr>
            </table>
        </form>
    </body>
</html>
