<%-- 
    Document   : insertProductCategoryToDb
    Created on : 2014-12-14, 18:14:41
    Author     : Mateusz
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <sql:update var="result" dataSource="jdbc/Sklep">
        UPDATE category SET name=? WHERE categoryID=?
        <sql:param value="${param.renameCategory}" />
        <sql:param value="${param.category}" />
    </sql:update>
        <c:redirect url="../User/adminPanel.jsp"/>
    </body>
</html>
