<%-- 
    Document   : tableManager
    Created on : Jan 9, 2018, 10:18:50 AM
    Author     : nnta.zip
--%>

<%@page import="DBConnector.TableDS"%>
<%@page import="DO.TableDO"%>
<%@page import="DBConnector.FoodDS"%>
<%@page import="DO.FoodDO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table Management</title>
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
                        <a class="navbar-brand" href="#">Table Management</a>
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
                <a href="addTable.jsp">
                    <button class="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span>New
                    </button>
                </a>
                <button class="btn btn-danger" form="tableForm" formaction="Manager?action=deleteTable" onclick="return confirmation('table', 'tableCheckBox')"><span class="glyphicon glyphicon-trash"></span>Delete</button>
            </div>
            <div class="menuList">
                <table class="table">
                    <tr>
                        <th>
                            <input type="checkbox" id="checkAll" onchange="checkAll(this, 'tableCheckBox')" />
                        </th>
                        <th></th>
                        <th>Table</th>
                        <th>Number of seat</th>
                        <th>Status</th>
                        <th>Change Status</th>
                        <th></th>
                    </tr>
                    
<!--                    **************************
                    ******SHOW MENU LIST******
                    GENERATE THIS <TR> ELEMENT
                    **************************-->
                    <%
                        List<TableDO> tables = new TableDS().getAllTables();
                        out.println("<form method=\"POST\" action=\"Manager?action=chooseTable\" id=\"tableForm\">");
                        for (TableDO table : tables){
                           out.println("<tr>");
                           out.println("<td>");
                           out.println("<input type=\"checkbox\" name=\"tableCheckBox\" value=\"" + table.getId() + "\" />");
                           out.println("</td>");
                           out.println("<td>");
                           out.println("<button class=\"btn btn-edit\" name=\"tableIdBtn\" value=\"" + table.getId() + "\" action=\"Manager?action=editTable\">");
                           out.println("<span class=\"glyphicon glyphicon-pencil\" style=\"padding: 0;\"></span>");
                           out.println("</button>");
                           out.println("</td>");
                           out.println("<td>" + table.getId() + "</td>");
                           out.println("<td>" + table.getSeat() + "</td>");
                           out.println("<td name=\"tableStatus\" id=\"tableStatus" + table.getId() + "\">" + ((table.getStatus() == 0) ? "Available" : "Busy") + "</td>");
                           out.println("<td>");     
                           out.println("<label class=\"switch\">");
                           out.println("<input type=\"checkbox\" id=\"changeStatus" + table.getId() + "\" name='changeStatus' onchange=\"changeTableStatus('tableForm' ,'changeTableStatus', 'tableId', '" + table.getId() + "', 'POST')\" " + ((table.getStatus() == 0) ? "" : "checked") + "/>");
                           out.println("<span class=\"slider round\"></span>");
                           out.println("</label></td>");
                        }
                        out.println("</form>");
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
