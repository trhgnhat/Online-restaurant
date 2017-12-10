<%-- 
    Document   : products
    Created on : Nov 30, 2017, 10:10:57 AM
    Author     : Admin
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mycompany.webapplab6.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="account" scope="session" class="com.mycompany.webapplab6.AccountBean" />
        <h1 align="center">Hi <jsp:getProperty name="account" property="accountName" /> </h1>
        <h3 align="center">Please select our product and its quantity</h3>
        <hr>
        <form method="POST" action="ShoppingServlet?action=addcart" align="center">
            Product: 
            <select name="product">
                <option value="Product 1|1.1">Product 1 | 1.1</option>
                <option value="Product 2|2.2">Product 2 | 2.2</option>
                <option value="Product 3|3.3">Product 3 | 3.3</option>
                <option value="Product 4|4.4">Product 4 | 4.4</option>
                <option value="Product 5|5.5">Product 5 | 5.5</option>
            </select>
            Quantity: 
            <input type="text" name="productQuantity" />
            <input type="submit" value="Add To Cart" name="submit" />
        </form>
        <hr>
        <table border="0">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <jsp:useBean id = "cart" scope = "session" class="com.mycompany.webapplab6.Cart" />
                <%
                    if (!cart.getCart().isEmpty()) {
                        for (int i = 0; i < cart.getCart().size(); i++) {
                            out.println("<tr><th>" + cart.getProductInCart(i).getProductName() + "</th>");
                            out.println("<th>" + cart.getProductInCart(i).getProductQuantity() + "</th>");
                            out.println("<th>" + new DecimalFormat("##.##").format(cart.getProductInCart(i).getProductPrice() * cart.getProductInCart(i).getProductQuantity()) + "</th>");
                            out.println("<th><form method=\"POST\" action=\"ShoppingServlet?action=deleteproduct\"><button type=\"submit\" value=\"" + cart.getProductInCart(i).getProductName() + "\" name=\"productName\" />Delete</button></form></th></tr>");
                        }
                    }
                %>
            </tbody>
        </table>
            <form method="POST" action="ShoppingServlet?action=checkout" align="center">
                <input type="submit" value="Checkout" name="submit" />
            </form>
    </body>
</html>
