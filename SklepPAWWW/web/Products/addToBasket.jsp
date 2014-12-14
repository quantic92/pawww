<%-- 
    Document   : addToBasket
    Created on : 2014-12-14, 19:12:12
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                    <sql:update var="result" dataSource="jdbc/Sklep">
        INSERT INTO basket (userID, productID, quantity) VALUES (?, ?, ?)
        <sql:param value="${sessionScope.loggedIn}" />
        <sql:param value="${param.product}" />
        <sql:param value="${param.quantity}" />
    </sql:update>
        <c:redirect url="../index.jsp"/>
    </body>
</html>
