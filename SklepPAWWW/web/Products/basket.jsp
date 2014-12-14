<%-- 
    Document   : basket
    Created on : 2014-12-14, 20:46:59
    Author     : Mateusz
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<sql:query var="items" dataSource="jdbc/Sklep">
    SELECT name, p.productID, b.quantity, b.basketID FROM product p, basket b
    WHERE b.productID = p.productID AND b.userID = ?
    <sql:param value="${sessionScope.loggedIn}" />
</sql:query>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:forEach var="basketItem" items="${items.rows}">
            <form name="show" action="removeFromBasket.jsp" method="POST">
                <p><a href="showProduct.jsp?id=${basketItem.productID}">${basketItem.name}</a> Ilosc: ${basketItem.quantity}</p>
                <input type="hidden" value="${basketItem.basketID}" name="basketID" />
                <input type="submit" value="Usun" />
            </form>
        </c:forEach>

        <form action="orderCheckout.jsp" method="POST">
            <input type="submit" value="Zamów" />
        </form>
        
        
    </body>
</html>
