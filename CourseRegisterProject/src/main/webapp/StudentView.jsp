<%-- 
    Document   : View
    Created on : Nov 24, 2017, 7:41:26 PM
    Author     : Admin
--%>

<%@page import="DO.CourseDO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DO.StudentDO"%>
<%@page import="vn.edu.hcmiu.scse.lab5.courseregisterproject.DatabaseService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Student's Detail</h1>
        <%
            DatabaseService databaseService = new DatabaseService();
            ArrayList<StudentDO> listOfStudents = databaseService.getAllStudents();
            session = request.getSession();
            for (StudentDO student : listOfStudents) {
                if (student.getId().equals(session.getAttribute(student.getId()))) {
                    out.println("<p>Student ID: " + student.getId() + "</p>");
                    out.println("<p>Student Name: " + student.getName() + "</p>");
                    break;

                }
            }
        %>
        <h2>Select Course</h2>
        <form method='POST' action='AddCourseToStudent'>
            Course: 
            <%
                listOfStudents = databaseService.getAllStudents();
                for (StudentDO student : listOfStudents) {
                    if (student.getId().equals(session.getAttribute(student.getId()))) {
                        out.print("<input type='hidden' name='studentID' value='" + student.getId() + "'>");
                        break;
                    }
                }
            %>
            <select name='courseID'>
                <%
                    databaseService = new DatabaseService();
                    ArrayList<CourseDO> listOfCourses = databaseService.getAllCourses();
                    for (CourseDO course : listOfCourses) {
                        out.print("<option value='" + course.getId() + "'>" + course.getName() + "</option>");
                    }

                %>
            </select>
            <input type='submit' value='Add'>
        </form>
        <h2>Registered Course</h2>
        <table>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Action</th>
            </tr>
            <%                listOfStudents = databaseService.getAllStudents();
                for (StudentDO student : listOfStudents) {
                    if (student.getId().equals(session.getAttribute(student.getId()))) {
                        listOfCourses = databaseService.getAttendedCourses(student.getId());
                        for (CourseDO course : listOfCourses) {
                            out.print("<tr>");
                            out.print("<td>" + course.getId() + "</td>");
                            out.print("<td>" + course.getName() + "</td>");
                            out.print("<td>"
                                    + "<form method='POST' action='RemoveCourseOfStudent'>"
                                    + "<input type='hidden' name='studentID' value='" + student.getId() + "'>"
                                    + "<input type='hidden' name='courseID' value='" + course.getId() + "'>"
                                    + "<button type=\"submit\">Remove</button>"
                                    + "</form>"
                                    + "</td>");
                            out.print("</tr>");
                        }
                        break;
                    }
                }
            %>
        </table>
        <a href="index.jsp">homepage</a>
    </body>
</html>
