<%-- 
    Document   : RegisterForm
    Created on : Oct 26, 2017, 10:32:16 AM
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
        <h1 align="center">Register Form</h1> 
        <hr>
        <form method="post" action="GetRegisterInfo">
            <table style="text-align: left">
                <tr>
                    <th>Full Name</th>
                    <th>
                        <input type="text" name="name">
                    </th>
                </tr>
                <tr>
                    <th>ID</th>
                    <th>
                        <input type="text" name="id">
                    </th>
                </tr>
                <tr>
                    <th>Email</th>
                    <th>
                        <input type="email" name="email">
                    </th>
                </tr>
                <tr>
                    <th>Gender</th>
                    <th>
                        <input type="radio" name="gender" value="male">Male
                        <input type="radio" name="gender" value="female">Female
                    </th>
                </tr>
                <tr>
                    <th>Field</th>
                    <th>
                        <select name="field">
                            <option value="Bussiness Administration">Bussiness Administration</option>
                            <option value="Information Technology">Information Technology</option>
                        </select>
                    </th>
                </tr>
                <tr>
                    <th>List of subjects</th>
                    <th>
                        <input type="checkbox" name="subject" value="Computer Network">Conputer Network <br>
                        <input type="checkbox" name="subject" value="Web Application">Web Application <br>
                        <input type="checkbox" name="subject" value="Software Engineering">Software Engineering <br>
                    </th>
                </tr>
                <tr>
                    <th>Comments</th>
                    <th>
                        <textarea type="textarea" name="comments"></textarea>
                    </th>
                </tr>
                <tr>
                    <th>
                        <input type="submit" value="Submit">
                    </th>
                    <th>
                        <input type="reset" value="Reset">
                    </th>
                </tr>
            </table>
        </form>
    </body>
</html>
