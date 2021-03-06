<%-- 
    Document   : menu
    Created on : Dec 12, 2017, 11:34:38 PM
    Author     : nnta.zip
--%>

<%@page import="DO.BillDO"%>
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
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="pageAction.js"></script>
    </head>
    <body>
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
                <div class="tab-content" id="menu"> 

                    <!--
                       Sidebar menu
                    -->
                    <div class="row">
                        <div class="column1">
                            <div class="sideBarMenu">
                                <p class="footTitle">Menu</p>
                                <ul class="list-unstyled">
                                    <li class="borderSideBar"><a onclick="showMenu('appetizer');" href="#">Appetizer</a>
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
                            <!--                            <div class="tab-content">-->
                            <div class="tabContent" style="display: block" id="appetizer">
                                <%                                    
                                    List<FoodDO> foods = new FoodDS().getFoodsByCategory("appetizer");
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
                                        out.println("</div>");
                                        out.println(" </div>");
                                        out.println("</div>");
                                        out.println("</div>");
                                        out.println("</div>");
                                        out.println("</div>");
                                    }
                                %>
                            </div>
                            <div class="tabContent" id="beef">
                                <%
                                    foods = new FoodDS().getFoodsByCategory("beef");
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
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
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
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
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
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
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
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
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + food.getId() + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + food.getPrice() + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
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
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
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
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
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
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
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
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
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
                                    for (FoodDO food : foods) {
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
                                        out.println("<form method='POST' action='Transaction?action=addFood'>");
                                        out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                        out.println("<input type='hidden' name='quantity' value='1'>");
                                        out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                        out.println("<button class=\"addFood btn-block\">ADD</button>");
                                        out.println("</form>");
                                        out.println("</div>");
                                        out.println(" </div>");
                                        out.println("</div>");
                                        out.println("</div>");
                                        out.println("</div>");
                                        out.println("</div>");
                                    }
                                %>
                                <div class="tab-content">
                                    <div class="tabContent" id="appetizer">
                                        <%
                                            foods = new FoodDS().getFoodsByCategory("appetizer");
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
                                                out.println("</div>");
                                                out.println(" </div>");
                                                out.println("</div>");
                                                out.println("</div>");
                                                out.println("</div>");
                                                out.println("</div>");
                                            }
                                        %>
                                    </div>
                                    <div class="tabContent" id="beef">
                                        <%
                                            foods = new FoodDS().getFoodsByCategory("beef");
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
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
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
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
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
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
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
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
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + food.getId() + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + food.getPrice() + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
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
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
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
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
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
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
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
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
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
                                            for (FoodDO food : foods) {
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
                                                out.println("<form method='POST' action='Transaction?action=addFood'>");
                                                out.println("<input type='hidden' name='foodID' value='" + Integer.toString(food.getId()) + "'>");
                                                out.println("<input type='hidden' name='quantity' value='1'>");
                                                out.println("<input type='hidden' name='price' value='" + Float.toString(food.getPrice()) + "'>");
                                                out.println("<button class=\"addFood btn-block\">ADD</button>");
                                                out.println("</form>");
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
                            <form action="Transaction?action=order" method="POST">
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
                                        <%
                                            session = request.getSession();
                                            BillDO bill = (BillDO) session.getAttribute("bill");
                                            float total = 0;
                                            for (int i = 0; i < bill.getFood().size(); i++) {
                                        %>
                                        <tr>
                                            <td class="col-md-5"><em><%out.println(bill.getFood().get(i).getName());%></em></h4></td>
                                            <td class="col-md-1" style="text-align: center"><%out.println(bill.getQuantity().get(i));%></td>
                                            <td class="col-md-1 text-center">$<%out.println(bill.getFood().get(i).getPrice());%></td>
                                            <td class="col-md-1 text-center">$<%out.println(bill.getPrice().get(i));%></td>
                                        </tr>        

                                        <%
                                                total += bill.getPrice().get(i);
                                            }
                                        %>                                    
                                        <tr>
                                            <td>   </td>
                                            <td>   </td>
                                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
                                            <td class="text-center text-danger"><h4><strong>$<%out.println(total);%></strong></h4></td>

                                        </tr>
                                        <tr>
                                            <td><input type="text" name="tableID" placeholder="Table ID" required /></td>
                                            <td>   </td>
                                            <td colspan="2">
                                                <button>Order</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
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

        <div class="footer" style="display: block">
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
