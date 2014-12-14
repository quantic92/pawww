<%-- 
    Document   : removeFromBasket
    Created on : 2014-12-14, 21:42:06
    Author     : Mateusz
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<sql:update var="items" dataSource="jdbc/Sklep">
    DELETE FROM basket
    WHERE basketID = ?
    <sql:param value="${param.basketID}" />
</sql:update>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <c:redirect url="basket.jsp"></c:redirect>
    </body>
</html>
