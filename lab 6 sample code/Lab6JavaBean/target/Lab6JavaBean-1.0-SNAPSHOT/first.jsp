<%-- 
    Document   : first
    Created on : Nov 30, 2017, 8:39:18 AM
    Author     : junnguyen
--%>

<%@page import="vn.edu.hcmiu.lab6.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>First Page</h1>
        
        <jsp:useBean id="product1" scope="request" class="vn.edu.hcmiu.lab6.Product" />
       
        <jsp:setProperty name="product1" property="productId" value="1" />
        <jsp:setProperty name="product1" property="productName" value="Chair" />
        <jsp:setProperty name="product1" property="productDescription" value="A Small Chair" />
        
      
        <h3><jsp:getProperty name="product1" property="productId" /></h3>
        <h3><jsp:getProperty name="product1" property="productName" /></h3>
        <h3><jsp:getProperty name="product1" property="productDescription" /></h3>
        
        
        <% 
            
                RequestDispatcher dispatcher = request.getRequestDispatcher("second.jsp");
                dispatcher.forward(request, response);
            
        %>
        
    </body>
</html>
