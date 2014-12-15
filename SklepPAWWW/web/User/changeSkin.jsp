<%-- 
    Document   : changeSkin
    Created on : 2014-12-15, 22:52:07
    Author     : Mateusz
--%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <c:if test="${param.skin == 0}">
            <sql:update dataSource="jdbc/Sklep">
                UPDATE user
                SET pinkMode = false
                WHERE userID = ?
                <sql:param value="${sessionScope.loggedIn}" />
            </sql:update>
            <c:redirect url="accountSettings.jsp" />
        </c:if>
        <sql:update dataSource="jdbc/Sklep">
            UPDATE user
            SET pinkMode = true
            WHERE userID = ?
            <sql:param value="${sessionScope.loggedIn}" />
        </sql:update>
            <c:redirect url="accountSettings.jsp" />
    </body>
</html>
