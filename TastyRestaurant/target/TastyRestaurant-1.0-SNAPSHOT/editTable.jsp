<%-- 
    Document   : editTable
    Created on : Jan 11, 2018, 8:41:59 AM
    Author     : nnta.zip
--%>

<%@page import="DO.TableDO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Table</title>
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
                        <a class="navbar-brand" href="#">Edit Table</a>
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
            <form method="post" action="Manager?action=editTable">
                <div class="menuBtn">
                    <button class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span>Save</button>
                </div>
                <div class="editPane" style="margin-top: 20px;">
                    <table class="form-table" style="width: 50%;">
<!--                        <tr class="rowSpace">
                            <td>Table name</td>
                            <td>
                                <input class="form-control" type="text" name="addFoodName" required />
                            </td>
                        </tr>-->
                        <tr class="rowSpace">
                            <td>Number of seat</td>
                            <td>
                                <input class="form-control" type="number" name="editTableSeat" value="<%=((TableDO) request.getSession().getAttribute("Table")).getSeat()%>" required />
                            </td>
                        </tr>
                        
                    </table>
            </form>
            </div>
        </div>
    </body>
</html>

