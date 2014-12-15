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
<c:set var="date" value="<%=new Date()%>" />
<sql:update var="new" dataSource="jdbc/Sklep">
    INSERT INTO zamowienie (userID, date, orderType, paymentType, stateType) VALUES (?, ?, ?, ?, ?)
    <sql:param value="${sessionScope.loggedIn}" />
    <sql:param value="${date}" />
    <sql:param value="${param.orderType}"/>
    <sql:param value="${param.paymentType}"/>
    <sql:param value="nowe"/>
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
    <sql:update dataSource="jdbc/Sklep">
        INSERT INTO OrderProduct (productID, orderID) VALUES (?, ?)
        <sql:param value="${item.productID}"></sql:param>
        <sql:param value="${zamowienie.rows[0].orderID}"/>
    </sql:update> 
    <sql:query var="currentProduct" dataSource="jdbc/Sklep">
        SELECT * FROM product
        WHERE productID = ?
        <sql:param value="${item.productID}" />
    </sql:query>
    <sql:update var="item" dataSource="jdbc/Sklep">
        UPDATE product
        SET quantity = ?
        WHERE productID = ?
        <sql:param value="${currentProduct.rows[0].quantity - item.quantity}" />
        <sql:param value="${currentProduct.rows[0].productID}"/>
    </sql:update>    

</c:forEach>


<sql:update var="item" dataSource="jdbc/Sklep">
    DELETE FROM basket
    WHERE userID = ?
    <sql:param value="${sessionScope.loggedIn}"></sql:param>
</sql:update> 

<jsp:include page="../masterpage.jsp" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main">    
    <form action="/SklepPAWWW/" method="POST">
        <h1>Zamówienie zostalo przekazane do realizacji</h1>
        
        <h3>Dane do przelewu:</h3>
        
        <p>PS3-shop
            </br>    
                    </br>

        Tytuł: Hajs sie zgadza
        </br>
        </br>
        Koszt: ${param.total} PLN!</p>
        <input type="submit" value="Powrót na stronę główną"/>
    </form>
    </body>
</div>
</html>
<jsp:include page="../masterpage2.jsp" />
