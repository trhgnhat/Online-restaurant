<%-- 
    Document   : ShowInfo
    Created on : Oct 12, 2017, 9:19:59 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information</title>
        <link rel="icon" href="hcmiu_logo.png" type="image" sizes="16x16">
        <style type="text/css">
            ol{
                color: red;
                font-family: "Arial", sans-serif;
                font-style: italic;
            }
            ul{
                color: blue;
                font-family: "Times New Roman", serif;
            }
            table, th, td {
                border: 1px solid black;
                background-color: pink;
                color: red;
                
            }
            table{
                border-collapse: collapse;
                width: 80%;
                height: 100%;
            }
            iframe{
                border: none;
            }
            a{
                color: blue;
                text-decoration: none;
            }
            a:hover{
                color: red;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h1>Your Information</h1>
        <p><%
            String name = request.getParameter("name");
            out.println("Name: " + name);
        %></p>
        <p><%
            String id = request.getParameter("id");
            out.println("ID: " + id);
        %></p>
        <p><%
            String school = request.getParameter("school");
            out.println("School: " + school);
        %></p>
        <p><%
            String department = request.getParameter("department");
            out.println("Department: " + department);
        %></p>
        <table>
            <caption><p style="color:red">Subjects</p></caption>
            <tr>
                <th>Subject</th>
                <th>Credits</th>
            </tr>
            <tr>
                <th>Web Application</th>
                <th>3</th>
            </tr>
            <tr>
                <th>Computer Network</th>
                <th>3</th>
            </tr>
        </table>
        <p>Plan:</p>
        <ul type="circle">
            <li>3rd year
                <ol type=="A">
                    <li>Operating System</li>
                    <li>Artificial Intelligent</li>
                </ol>
            </li>
            <li>4th year
                <ol type="1">
                    <li>Thesis</li>
                    <li>Graduate</li>
                </ol>
            </li>
        </ul>
        <p><iframe src="hcmiu_logo.png" height="300" width="400"></iframe></p>
        <p><a href="index.html">back</a></p>
        <form method='post' action="Test.jsp">
            <select name='test'>
                <option value='test 1'>Test 1</option>
                <option value='test 2'>Test 2</option>
            </select>
            <button type="submit" name="test" value="Test 1">Test 1</button>
        </form>
        
    </body>
</html>
