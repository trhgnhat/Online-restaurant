<%-- 
    Document   : menu
    Created on : Dec 12, 2017, 11:34:38 PM
    Author     : nnta.zip
--%>

<%@page import="DBConnector.FoodDS"%>
<%@page import="DO.FoodDO"%>
<%@page import="java.util.List"%>
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
        <script>
            function showFood(category) {
                var tabContents = document.getElementsByClassName("tabContent");
                var category = document.getElementById(category);
                var isVisible = category.style.display == "block";

                //hide all
                for (var i = 0; i < tabContents.length; i++) {
                    tabContents[i].style.display = "none";
                }

                //toggle current
                category.style.display = isVisible ? "none" : "block";
                return false;
            }
        </script>
    </head>
    <body>
        <%

        %>
        <!--
            Header
        -->
        <div class="stay">
            <div class="container">
                <div class="topBar">
                    <a href="#">Log In</a>
                    <a href="#">Sign up</a>
                </div>
            </div>
        </div>
        <div class="header">
            <div class="container">
                <div class="welcomeBar">
                    <ul class="headBar">
                        <li class=" headBarHome"><a href="homepage.html">Tasty Restaurant</a></li>
                        <li class=" headBarElement"><a href="menu.jsp">
                                <span class="glyphicon glyphicon-cutlery"></span>Menu</a></li>
                        <li class=" headBarElement"><a href="booking.jsp">
                                <span class="glyphicon glyphicon-calendar"></span>Booking</a></li>
                        <li class=" headBarElement"><a href="offers.html">
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
                                            <li><a onclick="showMenu('beef');" href="#">Beef</a>
                                            </li>
                                            <li><a onclick="showMenu('chicken');" href="#">Chicken</a>
                                            </li>
                                            <li><a onclick="showMenu('fish');" href="#">Fish</a>
                                            </li>
                                            <li><a onclick="showMenu('pork');" href="#">Pork</a>
                                            </li>
                                            <li><a onclick="showMenu('seafood');" href="#">Sea food</a>
                                            </li>
                                            <li><a onclick="showMenu('italianDish');" href="#">Italian dishes</a>
                                            </li>
                                            <li><a onclick="showMenu('asianDish');" href="#">Asian dishes</a>
                                            </li>
                                            <li><a onclick="showMenu('hamburger');" href="#">Hamburger</a>
                                        </ul>
                                    </li>      
                                    <li class="borderSideBar"><a onclick="showMenu('beverage');" href="#">Beverage</a>
                                    </li>
                                    <li class="borderSideBar"><a onclick="showMenu('dessert');" href="#">Dessert</a>
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
                        <div class="column2">
                            <div class="tab-content">
                                <div class="tabContent" id="beef">
                                    <%   
                                        List<FoodDO> foods = new FoodDS().getFoodsByCategory("beef");
                                        for(FoodDO food : foods){
                                            out.println("<div class=\"col-lg-5\" id=\"productStandard\">");
                                            out.println("<div class=\"panel panel-default\">");
                                            out.println("<div class=\"panel-body\">");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-xs-3 foodPicture\">");
                                            out.println("<div class=\"foodPic\">");
                                            out.println("<img src=\"img/appetizerExample.jpg\" alt=\"\"/>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("<div class=\"col-xs-9\" foodDetail>");
                                            out.println("<div class=\"foodName\">");
                                            out.println("<p>" + food.getName() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"foodPrice\">");
                                            out.println("<p>Price: $" + food.getPrice() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"addBtn\">");
                                            out.println("<button class=\"addFood btn-block\">ADD</button>");
                                            out.println("</div>");
                                            out.println(" </div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                    %>
                                </div>
                                <div class="tabContent" id="chicken">
                                    <%
                                        foods = new FoodDS().getFoodsByCategory("chicken");
                                        for(FoodDO food : foods){
                                            out.println("<div class=\"col-lg-5\" id=\"productStandard\">");
                                            out.println("<div class=\"panel panel-default\">");
                                            out.println("<div class=\"panel-body\">");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-xs-3 foodPicture\">");
                                            out.println("<div class=\"foodPic\">");
                                            out.println("<img src=\"img/appetizerExample.jpg\" alt=\"\"/>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("<div class=\"col-xs-9\" foodDetail>");
                                            out.println("<div class=\"foodName\">");
                                            out.println("<p>" + food.getName() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"foodPrice\">");
                                            out.println("<p>Price: $" + food.getPrice() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"addBtn\">");
                                            out.println("<button class=\"addFood btn-block\">ADD</button>");
                                            out.println("</div>");
                                            out.println(" </div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                        %>
                                </div>
                                <div class="tabContent" id="fish">
                                    <%
                                        foods = new FoodDS().getFoodsByCategory("fish");
                                        for(FoodDO food : foods){
                                            out.println("<div class=\"col-lg-5\" id=\"productStandard\">");
                                            out.println("<div class=\"panel panel-default\">");
                                            out.println("<div class=\"panel-body\">");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-xs-3 foodPicture\">");
                                            out.println("<div class=\"foodPic\">");
                                            out.println("<img src=\"img/appetizerExample.jpg\" alt=\"\"/>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("<div class=\"col-xs-9\" foodDetail>");
                                            out.println("<div class=\"foodName\">");
                                            out.println("<p>" + food.getName() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"foodPrice\">");
                                            out.println("<p>Price: $" + food.getPrice() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"addBtn\">");
                                            out.println("<button class=\"addFood btn-block\">ADD</button>");
                                            out.println("</div>");
                                            out.println(" </div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                        %>
                                </div>
                                <div class="tabContent" id="pork">
                                   <%
                                        foods = new FoodDS().getFoodsByCategory("pork");
                                        for(FoodDO food : foods){
                                            out.println("<div class=\"col-lg-5\" id=\"productStandard\">");
                                            out.println("<div class=\"panel panel-default\">");
                                            out.println("<div class=\"panel-body\">");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-xs-3 foodPicture\">");
                                            out.println("<div class=\"foodPic\">");
                                            out.println("<img src=\"img/appetizerExample.jpg\" alt=\"\"/>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("<div class=\"col-xs-9\" foodDetail>");
                                            out.println("<div class=\"foodName\">");
                                            out.println("<p>" + food.getName() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"foodPrice\">");
                                            out.println("<p>Price: $" + food.getPrice() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"addBtn\">");
                                            out.println("<button class=\"addFood btn-block\">ADD</button>");
                                            out.println("</div>");
                                            out.println(" </div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                        %>
                                </div>
                                <div class="tabContent" id="seafood">
                                    <%
                                        foods = new FoodDS().getFoodsByCategory("seafood");
                                        for(FoodDO food : foods){
                                            out.println("<div class=\"col-lg-5\" id=\"productStandard\">");
                                            out.println("<div class=\"panel panel-default\">");
                                            out.println("<div class=\"panel-body\">");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-xs-3 foodPicture\">");
                                            out.println("<div class=\"foodPic\">");
                                            out.println("<img src=\"img/appetizerExample.jpg\" alt=\"\"/>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("<div class=\"col-xs-9\" foodDetail>");
                                            out.println("<div class=\"foodName\">");
                                            out.println("<p>" + food.getName() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"foodPrice\">");
                                            out.println("<p>Price: $" + food.getPrice() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"addBtn\">");
                                            out.println("<button class=\"addFood btn-block\">ADD</button>");
                                            out.println("</div>");
                                            out.println(" </div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                        %>
                                </div>
                                <div class="tabContent" id="italianDish">
                                    <%
                                        foods = new FoodDS().getFoodsByCategory("italian");
                                        for(FoodDO food : foods){
                                            out.println("<div class=\"col-lg-5\" id=\"productStandard\">");
                                            out.println("<div class=\"panel panel-default\">");
                                            out.println("<div class=\"panel-body\">");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-xs-3 foodPicture\">");
                                            out.println("<div class=\"foodPic\">");
                                            out.println("<img src=\"img/appetizerExample.jpg\" alt=\"\"/>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("<div class=\"col-xs-9\" foodDetail>");
                                            out.println("<div class=\"foodName\">");
                                            out.println("<p>" + food.getName() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"foodPrice\">");
                                            out.println("<p>Price: $" + food.getPrice() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"addBtn\">");
                                            out.println("<button class=\"addFood btn-block\">ADD</button>");
                                            out.println("</div>");
                                            out.println(" </div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                        %>
                                </div>
                                <div class="tabContent" id="asianDish">
                                    <%
                                        foods = new FoodDS().getFoodsByCategory("asian");
                                        for(FoodDO food : foods){
                                            out.println("<div class=\"col-lg-5\" id=\"productStandard\">");
                                            out.println("<div class=\"panel panel-default\">");
                                            out.println("<div class=\"panel-body\">");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-xs-3 foodPicture\">");
                                            out.println("<div class=\"foodPic\">");
                                            out.println("<img src=\"img/appetizerExample.jpg\" alt=\"\"/>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("<div class=\"col-xs-9\" foodDetail>");
                                            out.println("<div class=\"foodName\">");
                                            out.println("<p>" + food.getName() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"foodPrice\">");
                                            out.println("<p>Price: $" + food.getPrice() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"addBtn\">");
                                            out.println("<button class=\"addFood btn-block\">ADD</button>");
                                            out.println("</div>");
                                            out.println(" </div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                        %>
                                </div>
                                <div class="tabContent" id="hamburger">
                                    <%
                                        foods = new FoodDS().getFoodsByCategory("hamburger");
                                        for(FoodDO food : foods){
                                            out.println("<div class=\"col-lg-5\" id=\"productStandard\">");
                                            out.println("<div class=\"panel panel-default\">");
                                            out.println("<div class=\"panel-body\">");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-xs-3 foodPicture\">");
                                            out.println("<div class=\"foodPic\">");
                                            out.println("<img src=\"img/appetizerExample.jpg\" alt=\"\"/>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("<div class=\"col-xs-9\" foodDetail>");
                                            out.println("<div class=\"foodName\">");
                                            out.println("<p>" + food.getName() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"foodPrice\">");
                                            out.println("<p>Price: $" + food.getPrice() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"addBtn\">");
                                            out.println("<button class=\"addFood btn-block\">ADD</button>");
                                            out.println("</div>");
                                            out.println(" </div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                        %>
                                </div>
                                <div class="tabContent" id="beverage">
                                    <%
                                        foods = new FoodDS().getFoodsByCategory("beverage");
                                        for(FoodDO food : foods){
                                            out.println("<div class=\"col-lg-5\" id=\"productStandard\">");
                                            out.println("<div class=\"panel panel-default\">");
                                            out.println("<div class=\"panel-body\">");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-xs-3 foodPicture\">");
                                            out.println("<div class=\"foodPic\">");
                                            out.println("<img src=\"img/appetizerExample.jpg\" alt=\"\"/>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("<div class=\"col-xs-9\" foodDetail>");
                                            out.println("<div class=\"foodName\">");
                                            out.println("<p>" + food.getName() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"foodPrice\">");
                                            out.println("<p>Price: $" + food.getPrice() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"addBtn\">");
                                            out.println("<button class=\"addFood btn-block\">ADD</button>");
                                            out.println("</div>");
                                            out.println(" </div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                        %>
                                </div>
                                <div class="tabContent" id="dessert">
                                    <%
                                        foods = new FoodDS().getFoodsByCategory("dessert");
                                        for(FoodDO food : foods){
                                            out.println("<div class=\"col-lg-5\" id=\"productStandard\">");
                                            out.println("<div class=\"panel panel-default\">");
                                            out.println("<div class=\"panel-body\">");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-xs-3 foodPicture\">");
                                            out.println("<div class=\"foodPic\">");
                                            out.println("<img src=\"img/appetizerExample.jpg\" alt=\"\"/>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("<div class=\"col-xs-9\" foodDetail>");
                                            out.println("<div class=\"foodName\">");
                                            out.println("<p>" + food.getName() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"foodPrice\">");
                                            out.println("<p>Price: $" + food.getPrice() + "</p>");
                                            out.println("</div>");
                                            out.println("<div class=\"addBtn\">");
                                            out.println("<button class=\"addFood btn-block\">ADD</button>");
                                            out.println("</div>");
                                            out.println(" </div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                        %>
                                </div>
                            </div>
                        </div>
                        <!--
                            End Product
                        -->

                        <!--
                            Vertical Banner
                        -->
                        <%
                            if (request.getSession().getAttribute("member") == null) {
                        %>
                        <div class="column3">
                            <a href="#">
                                <img class="img-rounded" src="img/exampleBanner-vertical.png" alt=""/>
                            </a>
                        </div>
                        <%
                        } else {
                        %>
                        <div class="column3">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>#</th>
                                        <th class="text-center">Price</th>
                                        <th class="text-center">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="col-md-9"><em>Baked Rodopa Sheep Feta</em></h4></td>
                                        <td class="col-md-1" style="text-align: center"> 2 </td>
                                        <td class="col-md-1 text-center">$13</td>
                                        <td class="col-md-1 text-center">$26</td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-9"><em>Lebanese Cabbage Salad</em></h4></td>
                                        <td class="col-md-1" style="text-align: center"> 1 </td>
                                        <td class="col-md-1 text-center">$8</td>
                                        <td class="col-md-1 text-center">$8</td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-9"><em>Baked Tart with Thyme and Garlic</em></h4></td>
                                        <td class="col-md-1" style="text-align: center"> 3 </td>
                                        <td class="col-md-1 text-center">$16</td>
                                        <td class="col-md-1 text-center">$48</td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td class="text-right">
                                            <p>
                                                <strong>Subtotal: </strong>
                                            </p>
                                            <p>
                                                <strong>Tax: </strong>
                                            </p></td>
                                        <td class="text-center">
                                            <p>
                                                <strong>$6.94</strong>
                                            </p>
                                            <p>
                                                <strong>$6.94</strong>
                                            </p></td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td class="text-right"><h4><strong>Total: </strong></h4></td>
                                        <td class="text-center text-danger"><h4><strong>$31.53</strong></h4></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <%
                            }
                        %>

                        <!--
                            End Vertical Banner
                        -->
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
