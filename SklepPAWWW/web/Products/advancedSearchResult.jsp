<%-- 
    Document   : advancedSearchResult
    Created on : 2014-12-15, 23:42:49
    Author     : Mateusz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:choose>
    <c:when test="${not empty param.name && not empty param.description}">
        <sql:query var="products" dataSource="jdbc/Sklep">
            SELECT *  FROM product p
            WHERE name LIKE '%${param.name}%'
            AND description LIKE '%${param.description}%'
            AND (price BETWEEN ${param.pricefrom} AND ${param.priceto})
            AND (quantity BETWEEN ${param.quantityfrom} AND ${param.quantityto})
        </sql:query>
    </c:when>
    <c:when test="${not empty param.name && empty param.description}">
        <sql:query var="products" dataSource="jdbc/Sklep">
            SELECT *  FROM product p
            WHERE name LIKE '%${param.name}%'
            AND (price BETWEEN ${param.pricefrom} AND ${param.priceto})
            AND (quantity BETWEEN ${param.quantityfrom} AND ${param.quantityto})
        </sql:query>
    </c:when>
    <c:when test="${empty param.name && not empty param.description}">
        <sql:query var="products" dataSource="jdbc/Sklep">
            SELECT *  FROM product p
            AND description LIKE '%${param.description}%'
            AND (price BETWEEN ${param.pricefrom} AND ${param.priceto})
            AND (quantity BETWEEN ${param.quantityfrom} AND ${param.quantityto})
        </sql:query>
    </c:when>
    <c:otherwise>
        <sql:query var="products" dataSource="jdbc/Sklep">
            SELECT *  FROM product p
            AND (price BETWEEN ${param.pricefrom} AND ${param.priceto})
            AND (quantity BETWEEN ${param.quantityfrom} AND ${param.quantityto})
        </sql:query>
    </c:otherwise>
</c:choose>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="productlist">
            <c:forEach var="row" items="${products.rows}">
                <div id="smallimg">
                    <img  src="${row.imagePath}" style="height:120px;width:120px;" />
                </div>
                <div id="product">
                    <a href="/SklepPAWWW/Products/showproduct.jsp?id=${row.productID}"><c:out value="${row.name}"/></a>
                    <br/>
                    <br/>
                    <span id="defaultContent_Label1">Cena:</span>
                    <br />
                    <span id="defaultContent_Label2">${row.price}</span>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
