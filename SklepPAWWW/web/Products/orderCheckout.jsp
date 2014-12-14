<%-- 
    Document   : orderCheckout
    Created on : 2014-12-14, 21:55:03
    Author     : Mateusz
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<sql:query var="klient" dataSource="jdbc/Sklep">
    SELECT * FROM user
    WHERE userID = ?
    <sql:param value="${sessionScope.loggedIn}"/>
</sql:query>

<sql:query var="products" dataSource="jdbc/Sklep">
    SELECT p.name, p.price, b.quantity FROM basket b, product p
    WHERE b.productID = p.productID AND b.userID = ?
    <sql:param value="${sessionScope.loggedIn}"/>
</sql:query>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>

    <body>
        Imie: ${klient.rows[0].name}
        NAzwisko: ${klient.rows[0].lastName}
        Adres: ${klient.rows[0].address}
        Miasto: ${klient.rows[0].city}
        <c:set var="total" value="0" />
        <form action="orderProduct.jsp" method="POST">
        <c:forEach var="product" items="${products.rows}" >
            <fmt:formatNumber var="sum" value="${product.price * product.quantity}" pattern="0.00"/>
            <p>Nazwa: ${product.name}, ilosc: ${product.quantity}, Cena jednostkowa: ${product.price} Suma: ${sum} </p>
            <c:set var="total" value="${total + (product.price * product.quantity)}" />
        </c:forEach>
            <fmt:formatNumber var="totalRounded" value="${total}" pattern="0.00"/>
            Total price: ${totalRounded}
            <input type="submit" value="Kup" />
        </form>
    </body>
</html>
