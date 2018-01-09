<%-- 
    Document   : addFood
    Created on : Dec 20, 2017, 1:51:27 PM
    Author     : nnta.zip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Food</title>
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
                        <a class="navbar-brand" href="#">Add New Food</a>
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
            <form method="post" action="Manager?action=addFood">
                <div class="menuBtn">
                    <button class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk" onclick="validateFileType();"></span>Save</button>
                    <button class="btn btn-edit"><span class="glyphicon glyphicon-floppy-save"></span>Save & Close</button>
                </div>
                <div class="editPane">
                    <table class="form-table" style="width: 50%;">
                        <tr class="rowSpace">
                            <td>Food name</td>
                            <td>
                                <input class="form-control" type="text" name="addFoodName" required />
                            </td>
                        </tr>
                        <tr class="rowSpace">
                            <td>Price</td>
                            <td>
                                <input class="form-control" type="text" name="addFoodPrice" required />
                            </td>
                        </tr>
                        <tr class="rowSpace">
                            <td>Category</td>
                            <td>
<!--                                <input class="form-control" type="text" name="addFoodCategory" required />-->
                                <select class="form-control" name="addFoodCategory" required>
                                    <option>appetizer</option>
                                    <option>beef</option>
                                    <option>chicken</option>
                                    <option>fish</option>
                                    <option>pork</option>
                                    <option>sea food</option>
                                    <option>italian</option>
                                    <option>asian</option>
                                    <option>hamburger</option>
                                    <option>beverage</option>
                                    <option>dessert</option>
                                    
                                </select>
                            </td>
                        </tr>
                        <tr class="rowSpace">
                            <td style="float: left;padding-top: 10px;">Image</td>
                            <td>
                                <div class="foodImg">
                                    <div class="foodPreview">
                                        <input type="file" accept="image/*" id="filename" onchange="loadFile(event);">
                                        <img id="output" width="255px" height="200px" style="padding: auto;padding-top: 12px;padding-bottom: 12px;"/ >
                                        <script>
                                          var loadFile = function(event) {
                                            var reader = new FileReader();
                                            reader.onload = function(){
                                              var output = document.getElementById('output');
//                                              output.src = reader.result;
                                                output.src = reader.result;
                                            };
                                            reader.readAsDataURL(event.target.files[0]);
                                          };
                                        </script>
                                    </div>

                                    <div class="btn-inline">
                                        <!--                                        <input class="browseBtn" type="file" value="Browse" onchange="previewImg();" />-->
                                        <button class="btn btn-danger"><span class="glyphicon glyphicon-remove-circle"></span>Remove</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
            </form>
            </div>
        </div>
    </body>
</html>
