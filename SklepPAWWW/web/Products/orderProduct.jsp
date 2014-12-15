<%-- 
    Document   : orderProduct
    Created on : 2014-12-14, 22:25:11
    Author     : Mateusz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.Date" %>
<c:set var="date" value="<%=new Date() %>" />
<sql:update var="new" dataSource="jdbc/Sklep">
    INSERT INTO zamowienie (userID, date) VALUES (?, ?)
    <sql:param value="${sessionScope.loggedIn}" />
    <sql:param value="${date}" />
</sql:update>

<sql:query var="basket" dataSource="jdbc/Sklep">
    SELECT * FROM basket
    WHERE userID = ?
    <sql:param value="${sessionScope.loggedIn}" />
</sql:query>

    <sql:query var="zamowienie" dataSource="jdbc/Sklep">
        SELECT * FROM zamowienie
        WHERE userID = ?
        <sql:param value="${sessionScope.loggedIn}" />
    </sql:query>
    
<c:forEach var="item" items="${basket.rows}">
    <sql:update var="item" dataSource="jdbc/Sklep">
       INSERT INTO OrderProduct (productID, orderID) VALUES (?, ?)
       <sql:param value="${item.productID}"></sql:param>
       <sql:param value="${zamowienie.rows[0].orderID}"/>
    </sql:update> 
</c:forEach>
       

    <sql:update var="item" dataSource="jdbc/Sklep">
       DELETE FROM basket
       WHERE userID = ?
       <sql:param value="${sessionScope.loggedIn}"></sql:param>
    </sql:update> 


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Zamówienie zostalo przekazane do realizacji

        TU WSTAW JAKIES DANE FIRMY JAK MA PRZELEW WYGLADAC CZY COS NIE WIEM :D
    </body>
</html>
