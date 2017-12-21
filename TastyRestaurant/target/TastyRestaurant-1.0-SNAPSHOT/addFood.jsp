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
            <form method="post" action="Menu?action=addFood">
                <div class="menuBtn">
                    <button class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span>Save</button>
                    <button class="btn btn-edit"><span class="glyphicon glyphicon-floppy-save"></span>Save & Close</button>
                </div>
                <div class="editPane">
                    <table class="form-table">
                        <tr>
                            <td>Food name</td>
                            <td>
                                <input class="form-control" type="text" name="addFoodName" required />
                            </td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td>
                                <input class="form-control" type="text" name="addFoodPrice" required />
                            </td>
                        </tr>
                        <tr>
                            <td>Category</td>
                            <td>
                                <input class="form-control" type="text" name="addFoodCategory" required />
                            </td>
                        </tr>
                        <tr>
                            <td>Image</td>
                            <td>
                                <div class="foodImg">
                                    <div class="foodPreview">
                                        <!--                                        ************************
                                                                                PLACE FOOD IMAGE HERE!!!
                                                                                ************************-->
                                        <img src="" alt="Food Image preview ..."/>
                                    </div>

                                    <div class="btn-inline">
                                        <input class="browseBtn" type="file" value="Browse" onchange="previewImg();" />
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
