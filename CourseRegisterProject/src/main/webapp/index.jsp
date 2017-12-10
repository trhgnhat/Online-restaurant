<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            request.getSession().invalidate();
        %>
        <h1>Course Registration Demo</h1>
        <form action="Student" method="POST">
            Student ID: <input type="text" name="studentID">
            <input type="submit" value="Submit">
        </form><hr>
        <h2>Manager</h2>
        <a href="Student">Student Manager</a><br/>
        <a href="Course">Course Manager</a>
    </body>
</html>
