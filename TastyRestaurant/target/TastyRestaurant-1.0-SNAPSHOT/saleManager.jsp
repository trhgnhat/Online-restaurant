<%-- 
    Document   : saleManager
    Created on : Dec 20, 2017, 9:09:39 AM
    Author     : nnta.zip
--%>

<%@page import="DO.FoodDO"%>
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
        <title>Sales Management</title>
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
                <button class="btn btn-danger" form="orderForm" formaction="Manager?action=deleteOrder" onclick="return confirmation('order', 'orderCheckBox')"><span class="glyphicon glyphicon-trash"></span>Delete</button>
                <select id="orderTime" style='float: right' onchange="chooseOrderTime(this, 'orderTable')">
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

                    <%
                        List<OrderDO> orders = new OrderDS().getAllOrders();
                        out.println("<form method=\"POST\" action=\"Manager?action=chooseOrder\" id=\"orderForm\">");
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
                            out.println("<button class=\"btn btn-edit\" name=\"orderIdBtn\" value=\"" + order.getId() + "\" onclick=\"return showDetail('" + order.getId() + "', 'orderDetailDiv')\">");
                            out.println("<span class=\"glyphicon glyphicon-eye-open\"></span>");
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

//                          SHOW DETAIL OF THE CHOSEN ORDER
                            out.println("<tr>");
                            out.println("<td colspan=\"9\">");
                            out.println("<div class=\"orderDetailDiv\" id=\"" + order.getId() + "\" style=\"display: none;\">");
                            out.println("<table class=\"table\">");
                            out.println("<tr id=\"orderDetail\">");
                            out.println("<td colspan=\"4\">Dishes</td>");
                            out.println("<td>Quantity</td>");
                            out.println("<td colspan=\"2\">Price ($)</td>");
                            out.println("<td colspan=\"2\">Sub Total ($)</td>");
                            out.println("<td/>");
                            out.println("</tr>");

//                          DETAIL OF THE CONTAINED BILL
                            for (int i = 0; i < order.getBill().getFood().size(); i++) {
                                out.println("<tr id=\"orderDetailElement\">");
                                out.println("<td colspan=\"4\">" + order.getBill().getFood().get(i).getName() + "</td>");
                                out.println("<td>" + order.getBill().getQuantity().get(i) + "</td>");
                                out.println("<td colspan=\"2\">" + order.getBill().getPrice().get(i) + "</td>");
                                out.println("<td colspan=\"2\">" + order.getBill().getQuantity().get(i)*order.getBill().getPrice().get(i) + "</td>");
                                out.println("<td/>");
                                out.println("</tr>");
                            }

//                          DETAIL OF THE ACCOUNT
                            out.println("<tr id=\"orderDetail\">");
                            out.println("<td colspan=\"3\">Full Name</td>");
                            out.println("<td>Username</td>");
                            out.println("<td colspan=\"2\">Email</td>");
                            out.println("<td colspan=\"1\">Address</td>");
                            out.println("<td>Phone Number</td>");
                            out.println("<td>Accumulated point</td>");
                            out.println("<td/>");
                            out.println("</tr>");

                            out.println("<tr id=\"orderDetailElement\">");
                            out.println("<td colspan=\"3\">" + order.getMember().getName() + "</td>");
                            out.println("<td><a href=\"#\">" + order.getMember().getUsername() + "</a></td>");
                            out.println("<td colspan=\"2\">" + order.getMember().getEmail() + "</td>");
                            out.println("<td colspan=\"1\">" + order.getMember().getAddress() + "</td>");
                            out.println("<td>" + order.getMember().getPhone() + "</td>");
                            out.println("<td>" + order.getMember().getPoint() + "</td>");
                            out.println("</tr>");
                            out.println("</table>");
                            out.println("</div>");
                            out.println("</td>");
                            out.println("</tr>");
                        }
                        out.println("</form>");
                    %>
                </table>
            </div>
        </div>
    </body>
</html>

