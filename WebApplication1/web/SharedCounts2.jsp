<%-- 
    Document   : SharedCounts2
    Created on : Nov 29, 2017, 9:08:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="counter"
                     class="coreservlets.AccessCountBean"
                     scope="application">
            <jsp:setProperty name="counter"
                             property="firstPage"
                             value="SharedCounts2.jsp" />
        </jsp:useBean>
        Of SharedCounts2.jsp (this page), 
        <A HREF="SharedCounts1.jsp">SharedCounts1.jsp</A>, and
        <A HREF="SharedCounts3.jsp">SharedCounts3.jsp</A>, 
            <jsp:getProperty name="counter" property="firstPage" />
        was the first page accessed.
        <P/>
        Collectively, the three pages have been accessed 
        <jsp:getProperty name="counter" property="accessCount" />
        times. 
        <jsp:setProperty name="counter"
                         property="accessCountIncrement"
                         value="1" />
    </body>
</html>
