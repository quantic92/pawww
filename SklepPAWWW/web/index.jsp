<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 2014-12-01, 18:54:27
    Author     : Mateusz
--%>
<jsp:include page="/masterpage.jsp" />
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
        <sql:query var="products" dataSource="jdbc/Sklep">
            SELECT productID, name, price FROM product
        </sql:query>

        <table border="1">
            <!-- column data -->
            <c:forEach var="row" items="${products.rows}">
                <tr>
                    <td><a href="Products/showproduct.jsp?id=${row.productID}"><c:out value="${row.name}"/></a></td>
                    <td><c:out value="${row.price}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
<jsp:include page="/masterpage2.jsp" />
