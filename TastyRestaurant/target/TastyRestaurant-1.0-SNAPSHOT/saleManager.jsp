<%-- 
    Document   : saleManager
    Created on : Dec 20, 2017, 9:09:39 AM
    Author     : nnta.zip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="pageAction.js"></script>
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
                        <a class="navbar-brand" href="#">Sales</a>
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
            <div>
                <button class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>Delete</button>
            </div>
            <div class="orderList">
                <table class="table">
                    <tr>
                        <th>
                            <input type="checkbox" name="" />
                        </th>
                        <th></th>
                        <th>Order ID</th>
                        <th>Username</th>
                        <th>Status</th>
                        <th>Table</th>
                        <th>Total</th>
                        <th>Time</th>
                        <th>Date</th>
                    </tr>
                    
<!--                    **************************
                    ******SHOW MENU LIST******
                    GENERATE THIS <TR> ELEMENT
                    **************************-->
                    
                    <tr>
                        <th>
                            <input type="checkbox" name="" />
                        </th>
                        <td>
                            <a href="editKitchen.jsp">
                                <button class="btn btn-edit">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </button>
                            </a>
                        </td>
                        <td>OrderID here</td>
                        <td>trhgnhat</td>
                        <td>Served</td>
                        <td>no.3</td>
                        <td>7.25</td>
                        <td>17:00</td>
                        <td>12/18/2017</td>
                    </tr>
                    
                </table>
            </div>
        </div>
    </body>
</html>

