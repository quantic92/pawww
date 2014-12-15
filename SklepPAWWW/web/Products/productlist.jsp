<%-- 
    Document   : productlist
    Created on : 2014-12-13, 20:34:45
    Author     : QuAntic
--%>
<jsp:include page="../masterpage.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="products" dataSource="jdbc/Sklep">
    SELECT * FROM product
    WHERE categoryID = ?
    <sql:param value="${param.id}"></sql:param>
</sql:query>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main">
            <h1>Kategoria / Podkategoria ...</h1>
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
<jsp:include page="../masterpage2.jsp" />