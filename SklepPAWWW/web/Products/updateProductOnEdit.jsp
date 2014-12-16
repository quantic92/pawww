<%-- 
    Document   : updateProductOnEdit
    Created on : 2014-12-16, 10:15:49
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>

<sql:update var="query" dataSource="jdbc/Sklep">
    UPDATE product
    SET name = ?, price = ?, categoryID = ?, quantity = ?
    WHERE productID = ?
    <sql:param value="${param.name}" />
    <sql:param value="${param.price}" />
    <sql:param value="${param.categ}" />
    <sql:param value="${param.quantity}" />
    <sql:param value="${param.productID}" />
</sql:update>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <c:redirect url="../User/adminPanel.jsp" />
    </body>
</html>
