<%-- 
    Document   : RegisterPage
    Created on : Dec 7, 2017, 9:10:08 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function myFunction(x) {
                document.getElementById(x).focus();
            }
            function checkInfo() {
                if (document.getElementById("fullName").value === ""){
                    alert("Full name is empty");
                }
                else if (document.getElementById("email").value === ""){
                    alert("Email is empty");
                }
                else if (document.getElementById("userName").value === ""){
                    alert("Username is empty");
                }
                else if (document.getElementById("password").value === ""){
                    alert("Password is empty");
                }
                else if (document.getElementById("reEnterPassword").value !== document.getElementById("password").value){
                    alert("Re-enter Password incorrect");
                }
                else{
                    setCookie("fullName", document.getElementById("fullName").value, 1);
                    setCookie("email", document.getElementById("email").value, 1);
                    setCookie("userName", document.getElementById("userName").value, 1);
                    setCookie("password", document.getElementById("password").value, 1);
                    return true;
                }
                return false;
            }
            // Save an account on cookie
            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
            }
            
        </script>
    </head>
    <body>
        <h3>Register to become a member of the website</h3>
        <form id="registerForm" onsubmit="return checkInfo()" method="POST" action="MultipleChoices.jsp" >
            <table border="0">
                <tr>
                    <td>Full name:</td>
                    <td><input type="text" id="fullName" onload="myFunction(this.id)" value=""/></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" id="email" onload="myFunction(this.id)" value=""/></td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" id="userName" value=""/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" id="password" value=""/></td>
                </tr>
                <tr>
                    <td>Re-enter password:</td>
                    <td><input type="password" id="reEnterPassword" value=""/></td>
                </tr>
            </table>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
