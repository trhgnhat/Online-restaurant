<%-- 
    Document   : restaurantManager
    Created on : Dec 20, 2017, 9:10:13 AM
    Author     : nnta.zip
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="DBConnector.BookingDS"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDate"%>
<%@page import="DO.BookingDO"%>
<%@page import="DO.BookingDO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Management</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="pageAction.js"></script>
        <!--        Date picker-->
        <link rel="stylesheet" href="datepicker/css/bootstrap.css" />
        <link rel="stylesheet" href="datepicker/css/datepicker.css" />
        <script src="datepicker/js/mainJs.js"></script>
        <script src="datepicker/js/bootstrap-datepicker.js"></script>

        <!--        Time picker-->
        <link rel="stylesheet" type="text/css" href="clockpicker-gh-pages/dist/bootstrap-clockpicker.min.css">
        <script type="text/javascript" src="clockpicker-gh-pages/dist/bootstrap-clockpicker.min.js"></script>
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
                        <a class="navbar-brand" href="#">Booking</a>
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
                <button class="btn btn-danger" form="bookingForm" formaction="Manager?action=deleteBooking" onclick="return confirmation('booking', 'bookingCheckBox')"><span class="glyphicon glyphicon-trash"></span>Delete</button>
                <div class="col-xs-12 col-sm-3">
                    <div class="input-group">
                        <input class="datepicker form-control input-small" type="text" id="pickADate" name="pickADate" placeholder="mm/dd/yyyy" value="" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                    <script type="text/javascript">
                        $('.datepicker').datepicker();
                    </script>
                </div>
                <div class="col-xs-12 col-sm-3">
                    <div class="input-group clockpicker">
                        <input class="form-control" type="text" id="pickATime" name="pickATime" value="" placeholder="__ : __" readonly="readonly" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-time"></span>
                        </span>
                    </div>
                    <script type="text/javascript">
                        $('.clockpicker').clockpicker();
                    </script>
                </div>
                <button class="btn btn-primary" form="bookingForm" formaction="Manager?action=searchBooking" onclick="return searchBooking('pickADate', 'pickATime', 'bookingTable')"><span class="glyphicon glyphicon-search"></span>Search</button>
            </div>
            <div class="bookingList" style="margin-top: 20px;">
                <table class="table" id="bookingTable">
                    <tr>
                        <th>
                            <input type="checkbox" id="checkAll" onchange="checkAll(this, 'bookingCheckBox')" />
                        </th>
                        <th></th>
                        <th>Booking ID</th>
                        <th>Username</th>
                        <th>Table ID</th>
                        <th>Time</th>
                        <th>Date</th>
                    </tr>

                    <%
                        List<BookingDO> bookings = new BookingDS().getAllBookings();
                        out.println("<form method=\"POST\" action=\"Manager?action=chooseBooking\" id=\"bookingForm\">");
                        for (BookingDO booking : bookings) {
                            out.println("<tr name='" + booking.getBooked_date().format(DateTimeFormatter.ofPattern("MM/dd/uuuu")) + "' value='" + booking.getBooked_time().format(DateTimeFormatter.ofPattern("HH:mm")) + "'>");
                            out.println("<td>");
                            out.println("<input type=\"checkbox\" name=\"bookingCheckBox\" value=\"" + booking.getId() + "\" />");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<button class=\"btn btn-edit\" name=\"bookingIdBtn\" value=\"" + booking.getId() + "\" onclick=\"return showDetail('" + booking.getId() + "', 'bookingDetailDiv')\">");
                            out.println("<span class=\"glyphicon glyphicon-eye-open\" style=\"padding: 0;\"></span>");
                            out.println("</button>");
                            out.println("</td>");
                            out.println("<td>" + booking.getId() + "</td>");
                            out.println("<td>" + booking.getMember().getUsername() + "</td>");
                            out.println("<td>" + booking.getTable().getId() + "</td>");
                            out.println("<td>" + booking.getBooked_time() + "-" + booking.getExpired_time() + "</td>");
                            out.println("<td>" + booking.getBooked_date() + "</td>");
                            out.println("</tr>");

//                          SHOW DETAIL OF THE CHOSEN TABLE
                            out.println("<tr>");
                            out.println("<td colspan=\"9\">");
                            out.println("<div class=\"bookingDetailDiv\" id=\"" + booking.getId() + "\" style=\"display: none;\">");
                            out.println("<table class=\"table\">");
                            out.println("<tr id=\"bookingDetail\">");
                            out.println("<td colspan=\"3\">Table ID</td>");
                            out.println("<td colspan=\"3\">Number of seat</td>");
                            out.println("<td colspan=\"3\">Table Name</td>");
                            out.println("</tr>");
                            out.println("<tr id=\"bookingDetailElement\">");
                            out.println("<td colspan=\"3\">" + booking.getTable().getId() + "</td>");
                            out.println("<td colspan=\"3\">" + booking.getTable().getSeat() + "</td>");
                            out.println("<td colspan=\"3\">No. " + booking.getTable().getId() + "</td>");
                            out.println("</tr>");

//                          DETAIL OF THE ACCOUNT
                            out.println("<tr id=\"bookingDetail\">");
                            out.println("<td colspan=\"3\">Full Name</td>");
                            out.println("<td>Username</td>");
                            out.println("<td colspan=\"2\">Email</td>");
                            out.println("<td colspan=\"1\">Address</td>");
                            out.println("<td>Phone Number</td>");
                            out.println("<td>Accumulated point</td>");
//                            out.println("<td/>");
                            out.println("</tr>");

                            out.println("<tr id=\"bookingDetailElement\">");
                            out.println("<td colspan=\"3\">" + booking.getMember().getName() + "</td>");
                            out.println("<td><a href=\"#\">" + booking.getMember().getUsername() + "</a></td>");
                            out.println("<td colspan=\"2\">" + booking.getMember().getEmail() + "</td>");
                            out.println("<td colspan=\"1\">" + booking.getMember().getAddress() + "</td>");
                            out.println("<td>" + booking.getMember().getPhone() + "</td>");
                            out.println("<td>" + booking.getMember().getPoint() + "</td>");
                            out.println("</tr>");
                            out.println("</table>");
                            out.println("</div>");
                            out.println("</td>");
                            out.println("</tr>");
                        }

                        out.println(
                                "</form>");
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
