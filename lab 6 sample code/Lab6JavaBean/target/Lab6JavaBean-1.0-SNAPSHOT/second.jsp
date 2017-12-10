<%-- 
    Document   : second
    Created on : Nov 30, 2017, 8:39:25 AM
    Author     : junnguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Second Page</h1>
        
        
        <jsp:useBean id="product2" scope="session" class="vn.edu.hcmiu.lab6.Product" />
       
        
        <h3><jsp:getProperty name="product2" property="productId" /></h3>
        <h3><jsp:getProperty name="product2" property="productName" /></h3>
        <h3><jsp:getProperty name="product2" property="productDescription" /></h3>
    </body>
</html>
