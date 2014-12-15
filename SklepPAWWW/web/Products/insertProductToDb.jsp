<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%-- 
    Document   : insertProductToDb
    Created on : 2014-12-01, 20:07:56
    Author     : Mateusz
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <sql:update var="result" dataSource="jdbc/Sklep">
        INSERT INTO product (name, description, price, quantity, categoryID) VALUES (?, ?, ?, ?, ?)

        <sql:param value="${param.name}" />
        <sql:param value="${param.description}" />
        <sql:param value="${param.price}" />
        <sql:param value="${param.quantity}" />
        <sql:param value="${param.category}" />
    </sql:update>
        <c:redirect url="/"/>

</body>
</html>
