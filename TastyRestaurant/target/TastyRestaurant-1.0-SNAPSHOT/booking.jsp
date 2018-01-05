<%-- 
    Document   : booking
    Created on : Dec 17, 2017, 11:09:34 PM
    Author     : nnta.zip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Booking</title>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="pageAction.js"></script>
        
<!--        Date picker-->
        <link rel="stylesheet" href="datepicker/css/bootstrap.css" />
        <link rel="stylesheet" href="datepicker/css/datepicker.css" />
        <script src="datepicker/js/mainJs.js"></script>
        <script src="datepicker/js/bootstrap-datepicker.js"></script>

<!--        Time picker-->
        <link rel="stylesheet" type="text/css" href="clockpicker-gh-pages/dist/bootstrap-clockpicker.min.css">
        <script type="text/javascript" src="clockpicker-gh-pages/dist/bootstrap-clockpicker.min.js"></script>
    </head>
    <body>
        <!--
            Header
        -->
        <div class="stay">
            <div class="container">
                <div class="topBar">
                    <%
                        if(request.getSession().getAttribute("member") == null || request.getSession() == null){
                            out.print("<a href=\"login.html\">Log In</a>");
                            out.print("<a href=\"register.jsp\">Sign Up</a>");
                        }
                        else{
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
                <div class="tab-content" id="support">
                    <div class="coverImage">
                        <img src="img/bookingCover.png" alt=""/>
                    </div>
                    <div class="panel panel-default panelFindTable">
                        <div class="panel-heading">
                            <h3>Find a table</h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-xs-12">
                                Please use the form below to find a table to reserve
                            </div>
                            <div class="col-xs-12 col-sm-12">
                                <form>
                                    <div class="form-group">
                                        <div class="col-xs-12 col-sm-3 wrap-none">
                                            <div class="input-group">
                                                <input class="datepicker form-control input-small" type="text" name="pickADate" placeholder="mm/dd/yy" value="" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                            <script>
                                                $(function(){
                                                    $('.datepicker').datepicker(); 
                                                });
                                            </script>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 wrap-none">
                                            <div class="input-group clockpicker">
                                                <input class="form-control" type="text" name="pickATime" value="" placeholder="Click on the clock" disabled />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <script type="text/javascript">
                                            $('.clockpicker').clockpicker();
                                            </script>
                                        </div>     
                                    </div>
                                        <div class="col-xs-12 col-sm-3 wrap-none">
                                            <button class="btn btn-primary btn-block" type="submit">Find me a table</button>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 wrap-none">
                                            <button class="btn btn-default btn-block" type="submit">Reset</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default col-xs-4 col-sm-2" data-btn="btn-primary">
                                        <input id="" name="" value="" type="radio" />No.1
                                    </label>
                                    <label class="btn btn-default col-xs-4 col-sm-2" data-btn="btn-primary">
                                        <input id="" name="" value="" type="radio" />No.2
                                    </label>
                                    <label class="btn btn-default col-xs-4 col-sm-2" data-btn="btn-primary">
                                        <input id="" name="" value="" type="radio" />No.3
                                    </label>
                                    <label class="btn btn-default col-xs-4 col-sm-2" data-btn="btn-primary">
                                        <input id="" name="" value="" type="radio" />No.4
                                    </label>
                                    <label class="btn btn-default col-xs-4 col-sm-2" data-btn="btn-primary">
                                        <input id="" name="" value="" type="radio" />No.5
                                    </label>
                                </div>
                            </div>
                        </div>
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
