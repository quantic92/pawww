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
<jsp:include page="../masterpage.jsp" />
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
        <div id="main">
            <form>
            <h1>Dane klienta:</h1>    
        <p>Imie: ${klient.rows[0].name}</p>
        <p>Nazwisko: ${klient.rows[0].lastName}</p>
        <p>Adres: ${klient.rows[0].address}</p>
        <p>Miasto: ${klient.rows[0].city}</p>
        <c:set var="total" value="0" />
            </form>
        
        <form action="orderProduct.jsp" method="POST">
        <h1>Zamówienie</h1>
        <c:forEach var="product" items="${products.rows}" >
            <fmt:formatNumber var="sum" value="${product.price * product.quantity}" pattern="0.00"/>
            <p>Nazwa: ${product.name}</p><p>Ilość: ${product.quantity}</br> Cena jednostkowa: ${product.price}</br> Suma: ${sum} </p>
            <c:set var="total" value="${total + (product.price * product.quantity)}" />
        </c:forEach>
            <fmt:formatNumber var="totalRounded" value="${total}" pattern="0.00"/>
            <h3>Łączna cena: ${totalRounded} PLN</h3>
            
            <h1>Wybór dostawy i płatności:</h1>
            <h3>Rodzaj dostawy:</h3>
            <select name="orderType" id="orderType">
                <option value="kurier" selected="true">Kurier</option>
                <option value="paczkomat">Paczkomat</option>
                <option value="osobisty">Odbiór osobisty</option>
            </select>
            <h3>Rodzaj płatności:</h3>
            <select name="paymentType" id="orderType">
                <option value="bankowy" selected="true">Przelew bankowy</option>
                <option value="gotowka">Płatność gotówką</option>
                <option value="elektroniczny">Przelew elektroniczny</option>
            </select>
            </br>
            </br>
            <input type="submit" value="Zamawiam!" />
        </form>
        </div>    
    </body>
</html>
<jsp:include page="../masterpage2.jsp" />