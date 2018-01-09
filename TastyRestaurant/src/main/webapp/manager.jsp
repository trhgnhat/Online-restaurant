<%-- 
    Document   : manager
    Created on : Dec 18, 2017, 8:19:48 PM
    Author     : nnta.zip
--%>

<%@page import="DBConnector.BookingDS"%>
<%@page import="DBConnector.MemberDS"%>
<%@page import="DO.OrderDO"%>
<%@page import="DBConnector.OrderDS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager</title>
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
    <body>
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
                        <a class="navbar-brand" href="#">Dashboard</a>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span></a></li>
                        <li><a href="Manager"><span class="glyphicon glyphicon-log-out"></span></a></li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="col-lg-10">
            <div class="row mini-statistics">
                <div class="col-xs-12 col-sm-6 col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row" id="rowDash">
                                <div class="col-xs-4 stat-icon-red">
                                    <span class="glyphicon glyphicon-export"></span>
                                </div>
                                <div class="col-xs-8 stat-content">
                                    <span class="dashboardItemRed"><%
                                        float total = 0;
                                        for (OrderDO order : new OrderDS().getAllOrders()) {
                                            total += order.getTotal_price();
                                        }
                                        out.print("$ " + total);%>
                                        <!--                                **************************    
                                                                        ADD THE TOTAL INCOMES HERE
                                                                        **************************-->
                                    </span>
                                    <span class="dashboardItemRed" id="dashboardDescript">Total Sales</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row" id="rowDash">
                                <div class="col-xs-4 stat-icon-blue">
                                    <span class="glyphicon glyphicon-user"></span>
                                </div>
                                <div class="col-xs-8 stat-content">
                                    <span class="dashboardItemBlue"> <%= new MemberDS().getAllMembers().size()%>
                                        <!--                                **************************    
                                                                        ADD THE TOTAL MEMBERS HERE
                                                                        **************************-->
                                    </span>
                                    <span class="dashboardItemBlue" id="dashboardDescript">Total Members</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row" id="rowDash">
                                <div class="col-xs-4 stat-icon-green">
                                    <span class="glyphicon glyphicon-shopping-cart"></span>
                                </div>
                                <div class="col-xs-8 stat-content">
                                    <span class="dashboardItemGreen"> <%= new OrderDS().getAllOrders().size()%>
                                        <!--                                **************************    
                                                                        ADD THE TOTAL MEMBERS HERE
                                                                        **************************-->
                                    </span>
                                    <span class="dashboardItemGreen" id="dashboardDescript">Total Orders</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row" id="rowDash">
                                <div class="col-xs-4 stat-icon-indigo">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </div>
                                <div class="col-xs-8 stat-content">
                                    <span class="dashboardItemIndigo"> <%= new BookingDS().getAllBookings().size()%>
                                        <!--                                **************************    
                                                                        ADD THE TOTAL MEMBERS HERE
                                                                        **************************-->
                                    </span>
                                    <span class="dashboardItemIndigo" id="dashboardDescript">Total Reservations</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
