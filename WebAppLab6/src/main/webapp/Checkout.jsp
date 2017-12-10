<%-- 
    Document   : Checkout
    Created on : Dec 2, 2017, 7:07:27 PM
    Author     : Admin
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="account" scope="session" class="com.mycompany.webapplab6.AccountBean" />
        <h2>Customer: <jsp:getProperty name="account" property="accountName" /> </h2>
        <h2>VISA Card: <jsp:getProperty name="account" property="accountVISA" /> </h2>
        <h2>Address: <jsp:getProperty name="account" property="accountAddress" /> </h2>
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
                    float total = 0;
                    if (!cart.getCart().isEmpty()) {
                        for (int i = 0; i < cart.getCart().size(); i++) {
                            out.println("<tr><th>" + cart.getProductInCart(i).getProductName() + "</th>");
                            out.println("<th>" + cart.getProductInCart(i).getProductQuantity() + "</th>");
                            out.println("<th>" + new DecimalFormat("##.##").format(cart.getProductInCart(i).getProductPrice() * cart.getProductInCart(i).getProductQuantity()) + "</th>");
                            total += cart.getProductInCart(i).getProductPrice() * cart.getProductInCart(i).getProductQuantity();
                        }
                    }
                    out.println("<tr><th/><th>TOTAL</th><th>$" + new DecimalFormat("##.##").format(total) + "</th></tr>");
                %>
            </tbody>
        </table>
            <a href="ShoppingServlet?action=showproducts">Shop some more!</a>
            <a href="ShoppingServlet?action=logout">Log out</a>
    </body>
</html>
