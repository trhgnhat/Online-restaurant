<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Tasty Restaurant</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="pageAction.js"></script>
    </head>
    <body onload="checkTerm()">

        <!--
            Header
        -->
        <div class="stay">
            <div class="container">
                <div class="topBar">
                    <%
                        if (request.getSession().getAttribute("member") == null || request.getSession() == null) {
                            out.print("<a href=\"loginSite.jsp\">Log In</a>");
                            out.print("<a href=\"register.jsp\">Sign Up</a>");
                        } else {
                            out.print("<a href=\"Account\">Log Out</a>");
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="header">
            <div class="container">
                <div class="welcomeBar">
                    <ul class="headBar">
                        <li class=" headBarHome"><a href="homepage.jsp">Tasty Restaurant</a></li>
                        <li class=" headBarElement"><a href="menu.jsp">
                                <span class="glyphicon glyphicon-cutlery"></span>Menu</a></li>
                        <li class=" headBarElement"><a href="booking.jsp">
                                <span class="glyphicon glyphicon-calendar"></span>Booking</a></li>
                        <li class=" headBarElement"><a href="offer.jsp">
                                <span class="glyphicon glyphicon-tags"></span>Offers</a></li> 
                        <li class=" headBarElement"><a href="myAccount.jsp">
                                <span class="glyphicon glyphicon-user"></span>My Account</a></li>
                        <!--                        <li class=" headBarElement"><a href="support.html">
                                                        <span class="glyphicon glyphicon-earphone"></span>Support</a></li>-->
                    </ul>
                </div> 
            </div>
        </div>

        <!--    
            Main
        -->

        <div class="main-container">
            <div class="container">
                <div class="tab-content" id="homepage">
                    <!--
                        Slide show
                    -->
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="img-rounded" src="img/bg-1.jpg" alt="Chicken - Special Dishes">
                            </div>
                            <div class="item">
                                <img class="img-rounded" src="img/bg-2.jpg" alt="Fish - Special Dishes">
                            </div>
                            <div class="item">
                                <img class="img-rounded" src="img/bg-3.jpg" alt="Steamed Beef - Special Dishes">
                            </div>
                            <div class="item">
                                <img class="img-rounded" src="img/bg-4.jpg" alt="Beef - Special Dishes">
                            </div>
                            <div class="item">
                                <img class="img-rounded" src="img/bg-5.jpg" alt="Asian Style Fish - Special Dishes">
                            </div>
                        </div>
                    </div> <!-- Carousel -->

                    <!-- ******************
                        Login form
                    ******************* -->
                    <div id="introduction" style="display: <%=(request.getSession().getAttribute("member") != null) ? "none" : "block"%>">
                        <div align="center" class="panel">
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
                                    <button type="submit" class="btn btn-default">SIGN IN</button>
                                </form>
                                <div class="forgotPassword">
                                    <a href="#"><p>FORGOT PASSWORD?</p></a>
                                </div>
                                <hr>
                                <div class="signUp">
                                    <h2>I'm a new customer.</h2>
                                    <a href="register.jsp">Create an account</a>
                                </div>
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
                                                    <input type="password" class="form-control" name="password" id="password" required />
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
                                                    <input type="password" class="form-control" name="rePassword" id="rePassword" required />
                                                </div>
                                            </td>
                                            <td>
                                                <div class="checkbox">
                                                    <label><input type="checkbox" id="termOfService"> I agree to the<a id="termOfService">terms of service</a></label>
                                                </div>
                                                <button type="submit" class="btn btn-default" id="registerBtn" onclick="return checkConfirmationPassword('password', 'rePassword')">Register</button>
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

                    <!--
                        Display news
                    -->

                    <div class="row">
                        <div class="col-xs-4">
                            <a href="#">
                                <img class="img-rounded" src="img/new1.jpg" alt=""/>
                            </a>
                        </div>
                        <div class="col-xs-4">
                            <a href="#">
                                <img class="img-rounded" src="img/new2.jpg" alt=""/>
                            </a>
                        </div>
                        <div class="col-xs-4">
                            <a href="#">
                                <img class="img-rounded" src="img/new3.jpg" alt=""/>
                            </a>
                        </div>
                    </div>
                    <hr>

                    <!--
                        Banner Decoration
                    -->
                    <div class="banner">
                        <p>How does our Tasty work?</p>
                        <a href="#">
                            <!--                            
                                                    ******************
                                                    !!! LOGIN SITE !!!
                                                    ******************
                            -->
                            <img class="img-rounded" src="img/exampleBanner.png" alt=""/> 
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!--
            Footer
        -->

        <div class="footer">
            <div class="jumbotron">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <p class="footTitle">Menu</p>
                            <ul class="list-unstyled">
                                <li><a href="#">Appetizer</a>
                                </li>
                                <li>Main Dishes
                                    <ul class="list-unstyled" id="tabElement">
                                        <li><a href="#">Beef</a>
                                        </li>
                                        <li><a href="#">Chicken</a>
                                        </li>
                                        <li><a href="#">Fish</a>
                                        </li>
                                        <li><a href="#">Pork</a>
                                        </li>
                                        <li><a href="#">Sea food</a>
                                        </li>
                                        <li><a href="#">Italian dishes</a>
                                        </li>
                                        <li><a href="#">Asian dishes</a>
                                        </li>
                                        <li><a href="#">Hamburger</a>
                                    </ul>
                                </li>      
                                <li><a href="#">Beverage</a>
                                </li>
                                <li><a href="#">Dessert</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-sm-4">
                            <p class="footTitle">Support</p>
                            <ul class="list-unstyled">
                                <li><a href="#">Terms & Conditions</a>
                                </li> 
                                <li><a href="#">Privacy Policy</a>
                                </li>
                                <li><a href="#">Web Ordering Policy</a>
                                </li>
                                <li><a href="#">Contact us</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-sm-4">
                            <p class="footTitle">Follow us</p>
                            <div class="col-sm-1">
                                <img src="img/footer-icon.png" alt=""/>
                            </div>
                            <div class="col-sm-3">
                                <ul class="list-unstyled" id="followUs">
                                    <li><a href="#">Facebook</a>
                                    </li> 
                                    <li><a href="#">Youtube</a>
                                    </li>
                                    <li><a href="#">Instagram</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--
                        End footer row
                    -->
                </div>
            </div>
            <!--
                End jumbotron
            -->
        </div>
        <!--
            End Footer
        --> 
    </body>
</html>
