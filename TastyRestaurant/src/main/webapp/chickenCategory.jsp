<%-- 
    Document   : chickenCategory
    Created on : Dec 12, 2017, 11:18:07 PM
    Author     : nnta.zip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Menu</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="pageAction.js"></script>
    </head>
    <body>
        <!--
            Header
        -->
        
        <div class="header">
            <div class="container">
                <div class="welcomeBar">
                    <ul class="headBar">
                        <li class=" headBarHome"><a href="homepage.html">Tasty Restaurant</a></li>
                        <li class=" headBarElement"><a href="menu.jsp">
                                <span class="glyphicon glyphicon-cutlery"></span>Menu</a></li>
                        <li class=" headBarElement"><a href="offers.html">
                                <span class="glyphicon glyphicon-tags"></span>Offers</a></li>
                        <li class=" headBarElement"><a href="myAccount.html">
                                <span class="glyphicon glyphicon-user"></span>My Account</a></li>
                        <li class=" headBarElement"><a href="support.html">
                                <span class="glyphicon glyphicon-earphone"></span>Support</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <!--    
            Main
        -->

        <div class="main-container">
            <div class="container">
                <div class="tab-content" id="menu"> 

                    <!--
                       Sidebar menu
                    -->
                    <div class="row">
                        <div class="column1">
                            <div class="sideBarMenu">
                                <p class="footTitle">Menu</p>
                                <ul class="list-unstyled">
                                    <li class="borderSideBar"><a href="menu.jsp">Appetizer</a>
                                    </li>
                                    <li class="borderSideBar">Main Dishes
                                        <ul style="circle" id="foodCategories">
                                            <li><a href="beefCategory.jsp">Beef</a>
                                            </li>
                                            <li><a href="chickenCategory.jsp">Chicken</a>
                                            </li>
                                            <li><a href="fishCategory.jsp">Fish</a>
                                            </li>
                                            <li><a href="porkCategory.jsp">Pork</a>
                                            </li>
                                            <li><a href="seaFoodCategory.jsp">Sea food</a>
                                            </li>
                                            <li><a href="italianCategory.jsp">Italian dishes</a>
                                            </li>
                                            <li><a href="asianCategory.jsp">Asian dishes</a>
                                            </li>
                                            <li><a href="hamburgerCategory.jsp">Hamburger</a>
                                        </ul>
                                    </li>      
                                    <li class="borderSideBar"><a href="beverageCategory.jsp">Beverage</a>
                                    </li>
                                    <li class="borderSideBar"><a href="dessertCategory.jsp">Dessert</a>
                                    </li>
                                </ul>
                            </div>    
                        </div>
                        <!--
                        End Sidebar menu
                        -->

                        <!--
                            Product
                        -->
                        <div class="col-lg-5">
                            <div class="tab-content" id="chickenMenu">
                                <h1>eat chicken</h1>
                            </div>
                        </div>
                        <!--
                            End Product
                        -->

                        <!--
                            Vertical Banner
                        -->
                        <div class="column3">
                            <a href="#">
                                <img class="img-rounded" src="img/exampleBanner-vertical.png" alt=""/>
                            </a>
                        </div>
                        <!--
                            End Vertical Banner
                        -->
                    </div>
                    <!--
                       End Sidebar menu
                    -->
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
