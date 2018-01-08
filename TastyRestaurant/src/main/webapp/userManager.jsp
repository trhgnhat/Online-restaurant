<%-- 
    Document   : userManager
    Created on : Dec 20, 2017, 9:10:33 AM
    Author     : nnta.zip
--%>

<%@page import="DBConnector.MemberDS"%>
<%@page import="DO.MemberDO"%>
<%@page import="DBConnector.FoodDS"%>
<%@page import="DO.FoodDO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management</title>
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
                        <a class="navbar-brand" href="#">Users</a>
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
            <div class="menuBtn">
                <button class="btn btn-danger" form="foodForm" formaction="Manager?action=deleteFood" onsubmit="return confirmation('food')"><span class="glyphicon glyphicon-trash"></span>Delete</button>
            </div>
            <div class="menuList">
                <table class="table">
                    <tr>
                        <th>
                            <input type="checkbox" id="checkAll" onchange="checkAll(this, 'memberCheckBox')" />
                        </th>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Full name</th>
                        <th>E-mail</th>
                        <th>Address</th>
                        <th>Phone Number</th>
                        <th>Password</th>
                    </tr>
                    
<!--                    **************************
                    ******SHOW MENU LIST******
                    GENERATE THIS <TR> ELEMENT
                    **************************-->
                    <%  List<MemberDO> members = new MemberDS().getAllMembers();
                        out.println("<form method=\"POST\" action=\"Manager?action=chooseFood\" id=\"foodForm\">");
                        for (MemberDO member : members){
                           out.println("<tr>");
                           out.println("<td>");
                           out.println("<input type=\"checkbox\" name=\"memberCheckBox\" value=\"" + member.getId() + "\" />");
                           out.println("</td>");
                           out.println("<td>" + member.getId() + "</td>");
                           out.println("<td>" + member.getUsername() + "</td>");
                           out.println("<td>" + member.getName() + "</td>");
                           out.println("<td>" + member.getEmail() + "</td>");
                           out.println("<td>" + member.getAddress() + "</td>");
                           out.println("<td>" + member.getPhone() + "</td>");
                           out.println("<td>" + member.getPassword() + "</td>");
                           out.println("</tr>");
                        }
                    %>
//                    <%
//                        List<FoodDO> foods = new FoodDS().getAllFoods();
//                        out.println("<form method=\"POST\" action=\"Manager?action=chooseFood\" id=\"foodForm\">");
//                        for (FoodDO food : foods){
//                           out.println("<tr>");
//                           out.println("<td>");
//                           out.println("<input type=\"checkbox\" name=\"foodCheckBox\" value=\"" + food.getId() + "\" />");
//                           out.println("</td>");
//                           out.println("<td>");
//                           out.println("<button class=\"btn btn-edit\" name=\"foodIdBtn\" value=\"" + food.getId() +"\" action=\"Manager?action=editFood\">");
//                           out.println("<span class=\"glyphicon glyphicon-pencil\"></span>");
//                           out.println("</button>");
//                           out.println("</td>");
//                           out.println("<td>" + food.getName() + "</td>");
//                           out.println("<td>" + food.getPrice() + "</td>");
//                           out.println("<td>" + food.getCategory() + "</td>");
//                           out.println("<td>" + food.getId() + "</td>");
//                           out.println("<td>" + food.getId() + "</td>");
//                           out.println("<td>" + food.getId() + "</td>");
//                           out.println("</tr>");
//                        }
//                        out.println("</form>");
//                    %>
                </table>
            </div>
            
<!--            <div class="active" id="dashboard">dashboard</div>
            <div class="tabContent" id="kitchen">kitchen
            
            
            
            </div>
            <div class="tabContent" id="sales">sales</div>
            <div class="tabContent" id="restaurantLocation">restaurant</div>
            <div class="tabContent" id="userManagement">user</div>-->
        </div>
    </body>
</html>
