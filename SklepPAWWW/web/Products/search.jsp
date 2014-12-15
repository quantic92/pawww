<%-- 
    Document   : search
    Created on : 2014-12-15, 23:03:54
    Author     : Mateusz
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<sql:query var="products" dataSource="jdbc/Sklep">
    SELECT * FROM product
    WHERE name LIKE '%${param.search_query}%' OR description LIKE '%${param.search_query}%' 
</sql:query>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main">
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
        <div/>
    </body>
</html>
