<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 2014-12-01, 18:54:27
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <div id="logowanie">
        <c:if test="${sessionScope.loggedIn==null}"> 

            <a href="User/register.jsp">Zarejestruj</a>
            <form action="User/login.jsp" method="POST">
                <input type="text" name="login" value="login" size="1" />
                <input type="password" name="password" value="password" size="1" />
                <input type="submit"  />
            </form>
        </c:if>
        <c:if test="${sessionScope.loggedIn!=null}"> 
            <sql:query var="login" dataSource="jdbc/Sklep">
                SELECT * FROM user WHERE userID = ?

                <sql:param value="${sessionScope.loggedIn}" />
            </sql:query>
            Logged as ${login.rows[0].name}
            <form action="User/login.jsp" name="strona">
                <input type="submit" value="wyloguj" />
            </form>
            <form action="User/accountSettings.jsp" name="strona">
                <input type="submit" value="ustawienia konta" />
            </form>
        </c:if>
    </div>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <sql:query var="users" dataSource="jdbc/Sklep">
            SELECT name, price FROM product
        </sql:query>

        <table border="1">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${users.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                    </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${users.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
