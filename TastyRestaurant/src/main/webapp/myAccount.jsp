<%-- 
    Document   : myAccount
    Created on : Dec 16, 2017, 6:30:16 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DBConnector.OrderDS"%>
<%@page import="DO.OrderDO"%>
<%@page import="java.util.List"%>
<%@page import="DO.MemberDO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="pageAction.js"></script>
    </head>
    <body>
        <%
            if (request.getSession().getAttribute("member") == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please Login first');");
                out.println("location='loginSite.jsp';");
                out.println("</script>");
//                response.sendRedirect("homepage.html");
            } else {
                MemberDO member = (MemberDO) request.getSession().getAttribute("member");
                List<OrderDO> orders = new OrderDS().getOrdersByMemberID(member.getId());

        %>
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

        <!--
            Header
        -->

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
                <div class="tab-content" id="myAccount">
                    <div class="row">
                        <div class="col-lg-3">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a onclick="showMenu('viewMyAccount');" href="#">My Account</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a onclick="showMenu('changeDetails');" href="#">Edit My Details</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a onclick="showMenu('viewMyHistory');"href="#">History</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="Account">Log out</a>
                                    </td>
                                </tr>
                            </table>
                        </div>                        
                        <!--
                        *******************
                        View My Account tab
                        *******************
                        -->                       
                        <div class="tabContent" id="viewMyAccount" style="display: block">
                            <div class="col-lg-9">
                                <table class="table">
                                    <tr>
                                        <th>Full name</th>
                                        <td><%out.println(member.getUsername());%></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>Username</th>
                                        <td><%out.println(member.getName());%></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td><%out.println(member.getEmail());%></td>
                                        <td><button type="" name="changeEmail" onclick="showMenu('changeDetails');">Change Email</button></td>
                                    </tr>
                                    <tr>
                                        <th>Password</th>
                                        <td><%out.println(member.getPassword().replaceAll("\\w", "*"));%></td>
                                        <td><button type="" name="changePassword" onclick="showMenu('changeDetails');">Change Password</button></td>
                                    </tr>
                                    <tr>
                                        <th>Address</th>
                                        <td><%out.println(member.getAddress());%></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>Phone number</th>
                                        <td><%out.println(member.getPhone());%></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>Points</th>
                                        <td><%out.println(member.getPoint());%></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>Credit Card</th>
                                        <td><%out.println(member.getCreditCard());%></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!--
                        *******************
                        Edit My Details tab
                        *******************
                        --> 
                        <div class="tabContent" id="changeDetails">
                            <h3>Edit details</h3>
                            <form method="POST" action="Account?action=changeDetail">
                                <table id="editDetails">
                                    <tr class="rowColSpace">
                                        <td>
                                            <input class="form-control" type="text" name="fullName" value="<%=member.getName()%>" placeholder="Full Name" required />
                                        </td>
                                        <td>
                                            <input class="form-control" type="text" name="address" value="<%=member.getAddress()%>" placeholder="Address" required />
                                        </td>
                                    </tr>
                                    <tr class="rowColSpace">
                                        <td>

                                            <input class="form-control" type="text" name="phone" value="<%=member.getPhone()%>" placeholder="Phone Number" required />

                                        </td>
                                        <td>

                                            <input class="form-control" type="text" name="creditCard" value="<%=member.getCreditCard()%>" placeholder="Credit Card" required />

                                        </td>
                                    </tr>
                                    <tr class="rowColSpace">
                                        <td>
                                            
                                            <input class="form-control" type="email" name="email" value="<%=member.getEmail()%>" placeholder="Email" readonly="readonly" />
                                            
                                        </td>
                                    </tr>
                                    <tr class="rowColSpace">
                                        <td colspan="2">
                                            <h4>Change Password</h4>
                                        </td>
                                    </tr>
                                    <tr class="rowColSpace">
                                        <td colspan="2">
                                            <input class="form-control" type="password" name="inputPresentPassword" id="inputPresentPassword" value="" placeholder="Confirm your present password" />
                                            <input type="hidden" id="presentPassword" name="presentPassword" value="<%=member.getPassword()%>"
                                        </td>
                                    </tr>
                                    <tr class="rowColSpace">
                                        <td>
                                            <input class="form-control" type="password" name="newPassword" id="newPassword" value="" placeholder="New password" />
                                        </td>
                                        <td>
                                            <input class="form-control" type="password" name="confirmPassword" id="confirmPassword" value="" placeholder="Confirm new password" />
                                        </td>
                                    </tr>
                                    <tr class="rowColSpace">
                                        <td>
                                            <button class="btn btn-default" type="submit" onclick="return changeAccountDetail()">Save My Details</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <!--
                        *******************
                        View My order tab
                        *******************
                        --> 
                        <div class="tabContent" id="viewMyHistory">
                            <div class="col-lg-9">
                                <table class="table">
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Bill ID</th>
                                        <th>Table ID</th>
                                        <th>Date</th>
                                        <th>Total Price</th>
                                    </tr>
                                    <%
                                        for (OrderDO order : orders) {
                                            out.print("<tr><td>" + order.getId() + "</td>");
                                            out.print("<td>" + order.getBill().getId() + "</td>");
                                            out.print("<td>" + order.getTable().getId() + "</td>");
                                            out.print("<td>" + order.getDate_time() + "</td>");
                                            out.print("<td>" + order.getTotal_price() + "$</td></tr>");
                                        }
                                    %>
                                </table>
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
        --><%}%>
    </body>
</html>