<%-- 
    Document   : register
    Created on : Dec 13, 2017, 2:01:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="pageAction.js"></script>
    </head>
    <body>
        <div class="container">
            <h2>Register</h2>
            <form action="Account?action=register" method="post">
                <table class="registerForm">
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="fullname">Full name</label>  
                                <input type="text" class="form-control" name="fullname" required />
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" name="email" required />
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
                                <label for="address">Address</label>
                                <input type="text" class="form-control" name="address" />
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
                                <label for="phone">Phone number</label>
                                <input type="text" class="form-control" name="phone" required />
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
                        <td></td>
                    </tr>
                    </table>
                    <div class="checkbox">
                        <label><input type="checkbox" name="remember"> I agree to the <a id="termOfService">terms of service</a></label>
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
               
            </form>
        </div>

    </body>
</html>
