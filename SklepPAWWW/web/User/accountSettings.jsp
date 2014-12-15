<%-- 
    Document   : accountSettings
    Created on : 2014-12-08, 20:27:34
    Author     : Mateusz
--%>
<jsp:include page="../masterpage.jsp" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<sql:query var="user" dataSource="jdbc/Sklep">
    SELECT * FROM user
    WHERE userID=?  
    <sql:param value="${sessionScope.loggedIn}"/>
</sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        
        <div id="main">
            <c:if test="${user.rows[0].isAdmin == true}">
            <h1> Panel administratora: </h1>
            <form action="adminPanel.jsp" method="POST">
                <input type="submit" value="Wejdz">
            </form>
            </c:if>
            <h1> Aktualizuj dane: </h1>
            <form action="updateUserData.jsp" method="POST">
                <div class="wierszdanych">
                    <br>Imię:
                    <input size="5" type="text" name="name" value="${user.rows[0].name}" />
                </div>
                <div class="wierszdanych">
                    <br>Nazwisko:
                    <input size="7" type="text" name="lastName" value="${user.rows[0].lastName}" />
                </div>
                <div class="wierszdanych">
                    <br>Email:
                    <input size="7" type="text" name="email" value="${user.rows[0].email}" />
                </div>
                <div class="wierszdanych">
                    <br>Adres:
                    <input type="text" name="address" value="${user.rows[0].address}" size="10" height="4"/>
                </div>
                <br>
                <input type="hidden" name="user" value="${user.rows[0].id}"/>

                <div class="wierszdanych">
                    <input type="submit" value="Zatwierdź" />
                </div>
            </form>
   
        
            <h1>Zmień hasło:</h1>
            <form action="updateUserData.jsp">

                <input type="hidden" name="user" value="${user.rows[0].userID}"/>

                <div class="wierszdanych">
                    <br>Stare hasło:
                    <input size="5" type="password" name="oldpass"  /> 
                </div>

                <form action="updateUserData.jsp">
                    <div class="wierszdanych">
                        <br>Nowe hasło:
                        <input size="5" type="password" name="newpass1"  />
                    </div>
                    <div class="wierszdanych">
                        <br>Powtórz hasło:
                        <input size="5" type="password" name="newpass2"  />
                    </div>
                    <br>
                    <input type="submit" value="OK" />

                </form>
        </div>
</body>
</html>
<jsp:include page="../masterpage2.jsp" />