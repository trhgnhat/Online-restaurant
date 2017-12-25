<%-- 
    Document   : restaurantManager
    Created on : Dec 20, 2017, 9:10:13 AM
    Author     : nnta.zip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Tasty</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css" type="text/css"/>
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
    <body>
        <div class="col-lg-2" id="sideBar">
            <div class="logo">
               
            </div>
            <ul>
                <li><a href="manager.jsp"><span class="glyphicon glyphicon-dashboard"></span>Dashboard</a></li>
                <li><a href="kitchenManager.jsp"><span class="glyphicon glyphicon-cutlery"></span>Kitchen</a></li>
                <li><a href="saleManager.jsp"><span class="glyphicon glyphicon-stats"></span>Sales</a></li>
                <li><a href="restaurantManager.jsp"><span class="glyphicon glyphicon-map-marker"></span>Restaurant</a></li>
                <li><a href="userManager.jsp"><span class="glyphicon glyphicon-user"></span>Users</a></li>
            </ul>
        </div>
        <div class="col-lg-10">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">About Tasty</a>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-log-out"></span></a></li>
                    </ul>
                </div>
            </nav>
        </div>
        
        <div class="col-lg-10">
<!--            <div class="active" id="dashboard">dashboard</div>
            <div class="tabContent" id="kitchen">kitchen
            
            
            
            </div>
            <div class="tabContent" id="sales">sales</div>
            <div class="tabContent" id="restaurantLocation">restaurant</div>
            <div class="tabContent" id="userManagement">user</div>-->
        </div>
    </body>
</html>
