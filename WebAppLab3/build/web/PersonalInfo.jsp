<%-- 
    Document   : PersonalInfo
    Created on : Oct 26, 2017, 9:03:39 AM
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
        <h1 align="center">Personal Information</h1> 
        <hr>
        <form method="post" action="GetInfo">
            <table style="text-align: left">
                <tr>
                    <th>ID</th>
                    <th>
                        <input type="text" name="id">
                    </th>
                </tr>
                <tr>
                    <th>Name</th>
                    <th>
                        <input type="text" name="name">
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
                    <th>Major</th>
                    <th>
                        <select name="major">
                            <option value="Bussiness Administration">Bussiness Administration</option>
                            <option value="Information Technology">Information Technology</option>
                        </select>
                    </th>
                </tr>
                <tr>
                    <th>Interesting Field</th>
                    <th>
                        <textarea type="textarea" name="interestingfield"></textarea>
                    </th>
                </tr>
                <tr>
                    <th>
                        <input type="submit" value="Insert">
                    </th>
                    <th>
                        <input type="reset" value="Cancel">
                    </th>
                </tr>
            </table>
        </form>
    </body>
</html>
