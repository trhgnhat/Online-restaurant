<%-- 
    Document   : kitchenManager
    Created on : Dec 20, 2017, 9:07:47 AM
    Author     : nnta.zip
--%>

<%@page import="DBConnector.FoodDS"%>
<%@page import="DO.FoodDO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kitchen Management</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="pageAction.js"></script>
        <%
            if (request.getSession().getAttribute("isLoggedIn") != "TRUE") {
                out.println("<script type=\"text/javascript\">");
                out.println("location='managerLogin.jsp';");
                out.println("</script>");
            }
        %>
    </head>
    <body style="background-color:#f1f1f1;">
        <div class="col-lg-2" id="sideBar">
            <div class="logo">
               <a href="homepage.html"><img src="img/tastyText.png" alt=""/></a>
            </div>
            <ul>
                <li><a href="manager.jsp"><span class="glyphicon glyphicon-dashboard"></span>Dashboard</a></li>
                <li><a href="kitchenManager.jsp"><span class="glyphicon glyphicon-cutlery"></span>Kitchen</a></li>
                <li><a href="saleManager.jsp"><span class="glyphicon glyphicon-stats"></span>Sales</a></li>
                <li><a href="restaurantManager.jsp"><span class="glyphicon glyphicon-calendar"></span>Reservation</a></li>
                <li><a href="tableManager.jsp"><span class="glyphicon glyphicon-list-alt"></span>Table</a></li>
                <li><a href="userManager.jsp"><span class="glyphicon glyphicon-user"></span>Users</a></li>
            </ul>
        </div>
        <div class="col-lg-10">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">Kitchen</a>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-log-out"></span></a></li>
                    </ul>
                </div>
            </nav>
        </div>
        
        <div class="col-lg-10" style="background-color:#ffffff;padding-top: 20px;">
            <div class="menuBtn">
                <a href="addFood.jsp">
                    <button class="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span>New
                    </button>
                </a>
                <button class="btn btn-danger" form="foodForm" formaction="Manager?action=deleteFood" onsubmit="return confirmation('food', 'foodCheckBox')"><span class="glyphicon glyphicon-trash"></span>Delete</button>
            </div>
            <div class="menuList">
                <table class="table">
                    <tr>
                        <th>
                            <input type="checkbox" id="checkAll" onchange="checkAll(this, 'foodCheckBox')" />
                        </th>
                        <th></th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>ID</th>
                    </tr>
                    
<!--                    **************************
                    ******SHOW MENU LIST******
                    GENERATE THIS <TR> ELEMENT
                    **************************-->
                    <%
                        List<FoodDO> foods = new FoodDS().getAllFoods();
                        out.println("<form method=\"POST\" action=\"Manager?action=chooseFood\" id=\"foodForm\">");
                        for (FoodDO food : foods){
                           out.println("<tr>");
                           out.println("<td>");
                           out.println("<input type=\"checkbox\" name=\"foodCheckBox\" value=\"" + food.getId() + "\" />");
                           out.println("</td>");
                           out.println("<td>");
                           out.println("<button class=\"btn btn-edit\" name=\"foodIdBtn\" value=\"" + food.getId() +"\" action=\"Manager?action=editFood\">");
                           out.println("<span class=\"glyphicon glyphicon-pencil\" style=\"padding: 0;\"></span>");
                           out.println("</button>");
                           out.println("</td>");
                           out.println("<td>" + food.getName() + "</td>");
                           out.println("<td>" + food.getPrice() + "</td>");
                           out.println("<td>" + food.getCategory() + "</td>");
                           out.println("<td>" + food.getId() + "</td>");
                           out.println("</tr>");
                        }
                        out.println("</form>");
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
