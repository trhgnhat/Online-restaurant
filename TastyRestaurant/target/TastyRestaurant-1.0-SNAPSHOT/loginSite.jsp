<%-- 
    Document   : loginSite
    Created on : Jan 6, 2018, 12:55:33 AM
    Author     : nnta.zip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="pageAction.js"></script>
        <title>Login</title>
        
        <style>
            body{
                background-image: url("img/loginCover.jpg");
            }
        </style>
        
    </head>
    <body>
        <div align="center" class="panel panel-loginSite">
            <div class="panel-heading">
                <h2>Sign In to Start</h2>
            </div>
            <div id="logInForm" class="panel-body">
                <form class="login" method="post" action="Account?action=login">
                    <div class="form-group">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username" />
                    </div>
                    <div class="form-group">  
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" />
                    </div>
                    <br>
                    <div class="checkbox">
                        <label><input type="checkbox" id="rememberMe"> Remember me</label>
                    </div>
                    <button type="submit" class="btn btn-default btn-block">SIGN IN</button>
                </form>
                <div class="forgotPassword">
                    <a href="#"><p>FORGOT PASSWORD?</p></a>
                </div>
                <hr>
                <div class="signUp">
                    <a onclick="openRegisterForm()">
                        <h2>I'm a new customer.</h2>
                        <h3>Create an account</h3>
                    </a>
                </div>
            </div>
        </div>

        <!--
    Register form
        -->
        <div id="registerForm" class="overlay">
            <a href="javascript:void(0)" class="closebtn" onclick="closeRegisterForm()">&times;</a>
            <div class="overlay-content">
                <div class="container">
                    <h2>Register</h2>
                    <form action="Account?action=register" method="post">
                        <table class="registerForm" align="center">
                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="fullname">Full name</label>  
                                        <input type="text" class="form-control" name="fullname" required />
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <input type="text" class="form-control" name="address" />
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" class="form-control" name="username" required />
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <label for="phone">Phone number</label>
                                        <input type="text" class="form-control" name="phone" required />
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" name="password" required />
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" name="email" />
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="rePassword">Re-enter password</label>
                                        <input type="password" class="form-control" name="rePassword" required />
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label><input type="checkbox" name="remember"> I agree to the<a id="termOfService">terms of service</a></label>
                                    </div>
                                    <button type="submit" class="btn btn-default">Submit</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <!--
            Register form
        -->

    </body>
</html>
