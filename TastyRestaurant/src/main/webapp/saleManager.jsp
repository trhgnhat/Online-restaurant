<%-- 
    Document   : saleManager
    Created on : Dec 20, 2017, 9:09:39 AM
    Author     : nnta.zip
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="DBConnector.OrderDS"%>
<%@page import="DO.OrderDO"%>
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
                <button class="btn btn-danger" form="orderForm" formaction="Manager?action=deleteOrder"><span class="glyphicon glyphicon-trash"></span>Delete</button>
                <select id="orderTime" style='float: right' onchange="chooseOrderTime(this)">
                    <option value="all">All</option>
                    <option value="lastDay">Last Day</option>
                    <option value="lastWeek">Last Week</option>
                    <option value="lastMonth">Last Month</option>
                </select>
            </div>
            <div class="orderList">
                <table class="table" id="orderTable">
                    <tr>
                        <th>
                            <input type="checkbox" id="checkAll" onchange="checkAll(this, 'orderCheckBox')" />
                        </th>
                        <th></th>
                        <th>Order ID</th>
                        <th>Username</th>
                        <th>Bill ID</th>
                        <th>Table</th>
                        <th>Total</th>
                        <th>Time</th>
                        <th>Date</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="orderCheckbox" value="" />
                        </td>
                        <td>
                            <a href="#" onclick="showOrderDetail('1')">View details</a>
                        </td>
                        <td>
                            orderID
                        </td>
                        <td>
                            username
                        </td>
                        <td>
                            billID
                        </td>
                        <td>
                            tableNo
                        </td>
                        <td>
                            total
                        </td>
                        <td>
                            time
                        </td>
                        <td>
                            date
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <div class="orderDetailDiv" id="1" style="display: none;">
                                <table class="table">
                                    <tr id="orderDetail">
                                        <td colspan="3">Dishes</td>
                                        <td>Quantity</td>
                                        <td colspan="2">Price ($)</td>
                                        <td colspan="2">Sub Total ($)</td>
                                        <td>Total ($)</td>
                                    </tr>
                                    <tr id="orderDetailElement">
                                        <td colspan="3">Chicken</td>
                                        <td>2</td>
                                        <td colspan="2">6.00</td>
                                        <td colspan="2">12.00</td>
                                        <td rowspan="2" align="center">Modify rowspan = number of dishes</td>
                                    </tr>
                                    <tr id="orderDetailElement">
                                        <td colspan="3">Beef</td>
                                        <td>1</td>
                                        <td colspan="2">9.00</td>
                                        <td colspan="2">9.00</td> 
                                    </tr>
                                    <tr id="orderDetail">
                                        <td colspan="3">Full Name</td>
                                        <td>Username</td>
                                        <td colspan="2">Email</td>
                                        <td colspan="1">Address</td>
                                        <td>Phone Number</td>
                                        <td>Accumulated point</td>
                                    </tr>
                                    <tr id="orderDetailElement">
                                        <td colspan="3">Anh Nguyen</td>
                                        <td><a href="#">nnta.zip</a></td>
                                        <td colspan="2">nnta@gmail.com</td>
                                        <td colspan="1">HCMC</td>
                                        <td>1234</td>
                                        <td>100</td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    
<!--                    
                    DISPLAY ORDER DETAIL WITH PANEL - MODIFY LATER
                    <tr>
                        <td>
                            <input type="checkbox" name="orderCheckbox" value="" />
                        </td>
                        <td>
                            <a href="#" onclick="showOrderDetail('2')">View details</a>
                        </td>
                        <td>
                            orderID
                        </td>
                        <td>
                            username
                        </td>
                        <td>
                            billID
                        </td>
                        <td>
                            tableNo
                        </td>
                        <td>
                            total
                        </td>
                        <td>
                            time
                        </td>
                        <td>
                            date
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <div  class="orderDetailDiv" id="2" style="display: none;">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Member's information</h4>
                                    </div>
                                    <div class="panel-body">

                                    </div>
                                    <div class="panel-heading">
                                        <h4>Receipt</h4>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table">
                                            <tr id="orderDetail">
                                        <td colspan="3">Dishes</td>
                                        <td>Quantity</td>
                                        <td colspan="2">Price ($)</td>
                                        <td colspan="2">Sub Total ($)</td>
                                        <td>Total ($)</td>
                                        <td>Full Name</td>
                                        <td>Username</td>
                                        <td>E-mail</td>
                                        <td>Address</td>
                                        <td>Phone Number</td>
                                        <td>Accumulated Point</td>
                                    </tr>
                                    <tr id="orderDetailElement">
                                        <td colspan="3">Chicken</td>
                                        <td>2</td>
                                        <td colspan="2">6.00</td>
                                        <td colspan="2">12.00</td>
                                        <td rowspan="2" align="center">Modify rowspan = number of dishes</td>
                                    </tr>
                                    <tr id="orderDetailElement">
                                        <td colspan="3">Beef</td>
                                        <td>1</td>
                                        <td colspan="2">9.00</td>
                                        <td colspan="2">9.00</td> 
                                    </tr>
                                    <tr id="orderDetail">
                                        <td colspan="3">Full Name</td>
                                        <td>Username</td>
                                        <td colspan="2">Email</td>
                                        <td colspan="1">Address</td>
                                        <td>Phone Number</td>
                                        <td>Accumulated point</td>
                                    </tr>
                                    <tr id="orderDetailElement">
                                        <td colspan="3">Anh Nguyen</td>
                                        <td><a href="#">nnta.zip</a></td>
                                        <td colspan="2">nnta@gmail.com</td>
                                        <td colspan="1">HCMC</td>
                                        <td>1234</td>
                                        <td>100</td>
                                    </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>-->


<!--                    **************************
                    ******SHOW MENU LIST******
                    GENERATE THIS <TR> ELEMENT
                    **************************-->
                    

                    <!--                    **************************
                                        ******SHOW MENU LIST******
                                        GENERATE THIS <TR> ELEMENT
                                        **************************-->

                    <%
                        List<OrderDO> orders = new OrderDS().getAllOrders();
                        out.println("<form method=\"POST\" action=\"Manager?action=chooseOrder\" id=\"orderForm\" onsubmit=\"return confirmation('order')\">");
                        for (OrderDO order : orders) {
                            int yeargap = LocalDate.now().getYear() - order.getDate_time().toLocalDate().getYear();
                            int daygap = LocalDate.now().getDayOfYear() - order.getDate_time().toLocalDate().getDayOfYear();
                            if (yeargap == 0) {
                                if (daygap <= 30) {
                                    if (daygap <= 7) {
                                        if (daygap <= 1) {
                                            out.println("<tr name='lastDay'>");
                                        } else {
                                            out.println("<tr name='lastWeek'>");
                                        }
                                    } else {
                                        out.println("<tr name='lastMonth'>");
                                    }
                                } else {
                                    out.println("<tr name='otherTime'>");
                                }
                            } else {
                                daygap += 365;
                                if (daygap <= 30) {
                                    if (daygap <= 7) {
                                        if (daygap <= 1) {
                                            out.println("<tr name='lastDay'>");
                                        } else {
                                            out.println("<tr name='lastWeek'>");
                                        }
                                    } else {
                                        out.println("<tr name='lastMonth'>");
                                    }
                                } else {
                                    out.println("<tr name='otherTime'>");
                                }
                            }

                            out.println("<td>");
                            out.println("<input type=\"checkbox\" name=\"orderCheckBox\" value=\"" + order.getId() + "\" />");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<button class=\"btn btn-edit\" name=\"orderIdBtn\" value=\"" + order.getId() + "\" action=\"Manager?action=editOrder\">");
                            out.println("<span class=\"glyphicon glyphicon-pencil\"></span>");
                            out.println("</button>");
                            out.println("</td>");
                            out.println("<td>" + order.getId() + "</td>");
                            out.println("<td>" + order.getMember().getUsername() + "</td>");
                            out.println("<td>" + order.getBill().getId() + "</td>");
                            out.println("<td>" + order.getTable().getId() + "</td>");
                            out.println("<td>" + order.getTotal_price() + "</td>");
                            out.println("<td>" + order.getDate_time().toLocalTime() + "</td>");
                            out.println("<td>" + order.getDate_time().toLocalDate() + "</td>");
                            out.println("</tr>");
                        }
                        out.println("</form>");
                    %>
                </table>
            </div>
        </div>
    </body>
</html>

