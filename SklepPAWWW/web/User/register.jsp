<%-- 
    Document   : register
    Created on : 2014-12-01, 19:48:06
    Author     : QuAntic

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../masterpage.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main" class="two-col">
            <FORM ACTION = "insertUserToDb.jsp" METHOD = "POST">
                <br>
                <sql:param value="${param.city}" />
                <sql:param value="${param.address}" />
                <h1>Jestes nowym klientem? Zarejestruj się!</h1>
                <br/>
                <br>Login:<br>
                <INPUT TYPE ="text" NAME = "login" >
                <br/>
                <br>Hasło:<br>
                <INPUT TYPE ="text" NAME = "password">
                <br>Powtórz hasło:<br>
                <INPUT TYPE ="text" NAME = "password2">
                <br/><br>Imie:<br>
                <INPUT TYPE ="text" NAME = "name">
                <br>Nazwisko:<br>
                <INPUT TYPE ="text" NAME = "lastName">
                <br>Email:<br>
                <INPUT TYPE ="text" NAME = "email">
                <br/><br>City:<br>
                <INPUT TYPE ="text" NAME = "city">
                <br>Address:<br>
                <INPUT TYPE ="text" NAME = "address">
                <br/><br>
                <INPUT TYPE="SUBMIT" VALUE="Dodaj">
            </FORM>
        </div>

    </body>
</html>
<jsp:include page="../masterpage2.jsp" />