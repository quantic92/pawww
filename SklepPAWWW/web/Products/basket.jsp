<%-- 
    Document   : basket
    Created on : 2014-12-14, 20:46:59
    Author     : Mateusz
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../masterpage.jsp" />
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
        <div id="main">
            <h1>Produkty w koszyku:</h1>    
        <c:forEach var="basketItem" items="${items.rows}">
            <form name="show" action="removeFromBasket.jsp" method="POST">
                <a href="showProduct.jsp?id=${basketItem.productID}">${basketItem.name}</a> Ilosc: ${basketItem.quantity}
                <input type="hidden" value="${basketItem.basketID}" name="basketID" />
                <input type="submit" value="Usun" />
            </form>
        </c:forEach>

        <form action="orderCheckout.jsp" method="POST">
            <input type="submit" value="Zamów" />
        </form>
        </div> 
        
    </body>
</html>
<jsp:include page="../masterpage2.jsp" />