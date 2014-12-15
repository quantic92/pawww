<%-- 
    Document   : masterpage
    Created on : 2014-12-01, 19:40:03
    Author     : QuAntic
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<sql:query var="user" dataSource="jdbc/Sklep">
    SELECT * FROM user
    WHERE userID = ?
    <sql:param value="${sessionScope.loggedIn}"/>
</sql:query>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">


    <head>
        <title>PS3-shop</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="/SklepPAWWW/images/MarketPlace.css" type="text/css" />
        <c:if test="${not empty sessionScope.loggedIn}">
            <c:if test="${user.rows[0].pinkMode == true}">
                <link rel="stylesheet" href="/SklepPAWWW/images/MarketPlace2.css" type="text/css" />
            </c:if>
        </c:if>
        <script src="//ajax.googleapis.com/ajax/libs/dojo/1.10.3/dojo/dojo.js"></script>
    </head>
    <body>
        <div id="wrap">
            <div id="header">
                <div id="logowanie">
                    <c:if test="${sessionScope.loggedIn==null}"> 
                        <form action="/SklepPAWWW/User/login.jsp" method="POST" class="logowanie">
                            <input type="text" name="login" value="login" size="1" class="textbox"/>
                            <input type="password" name="password" value="password" size="1" class="textbox"/>
                            <input type="submit" value="zaloguj" class="button"/>
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.loggedIn!=null}"> 
                        <sql:query var="login" dataSource="jdbc/Sklep">
                            SELECT * FROM user WHERE userID = ?

                            <sql:param value="${sessionScope.loggedIn}" />
                        </sql:query>
                        <form action="/SklepPAWWW/User/login.jsp" name="strona" class="logowanie">
                            <text>Zalogowany jako ${login.rows[0].name}</text>
                            <input type="submit" value="wyloguj"  class="button"/>
                        </form>

                    </c:if>
                </div>
                <div id="header-links">
                    <p> <a href="http://www.free-css.com/">Home</a> | <a href="User/register.jsp">Zarejestruj</a>
                </div>
            </div>
            <div id="header-photo">
                <h1 id="logo-text"><a href="http://www.free-css.com/">PS3 Shop</a></h1>
                <h2 id="slogan">Kupuj u nas!</h2>
            </div>
            <div  id="nav">
                <ul>
                    <li id="current"><a href="/SklepPAWWW/">Home</a></li>
                    <li><a href="2-columns.php">Kategorie</a></li>
                        <c:if test="${sessionScope.loggedIn!=null}"> 
                        <li><a href="/SklepPAWWW/Products/basket.jsp">Koszyk</a></li>
                        <li><a href="/SklepPAWWW/User/accountSettings.jsp">Ustawienia Konta</a></li>
                        </c:if>
                    <li><a href="/SklepPAWWW/">O nas</a></li>
                    <li>
                        <c:if test="${sessionScope.isAdmin == true}">
                            <a href="/SklepPAWWW/User/adminPanel.jsp">Panel Administracyjny</a>
                        </c:if> 
                    </li>
                </ul>
            </div>
            <div id="content-wrap" class="two-col"  >
                <div id="sidebar">
                    <h1>Wyszukiwarka</h1>
                    <form action="/SklepPAWWW/Products/search.jsp" class="searchform">
                        <p>
                            <input name="search_query" class="textbox" type="text" />
                            <input class="button" value="Szukaj" type="submit" />
                        </p>
                    </form>
                    <a href="/SklepPAWWW/Products/advancedSearch.jsp">Wyszukiwanie zaawansowane</a>
                    <h1>Kategorie</h1>
                    <ul class="sidemenu">
                        <sql:query var="categories" dataSource="jdbc/Sklep">
                            SELECT categoryID, name FROM category
                        </sql:query>
                            <c:forEach var="row" items="${categories.rows}">
                                <li> <a href="/SklepPAWWW/Products/productlist.jsp?id=${row.categoryID}"><c:out value="${row.name}"/></a></li>
                            </c:forEach>
                    </ul>
                    <h1>Linki</h1>
                    <ul class="sidemenu">
                        <li><a href="http://www.free-css.com/">PDPhoto.org</a></li>
                        <li><a href="http://www.free-css.com/">Squidfingers | Patterns</a></li>
                        <li><a href="http://www.free-css.com/">Alistapart</a></li>
                        <li><a href="http://www.free-css.com/">CSS Mania</a></li>
                        <li><a href="http://www.free-css.com/">Dark Eye</a></li>
                    </ul>
                    <h1>Sponsorzy</h1>
                    <ul class="sidemenu">
                        <li><a href="http://www.free-css.com/">4templates</a></li>
                        <li><a href="http://www.free-css.com/">TemplateMonster</a></li>
                        <li><a href="http://www.free-css.com/">Fotolia.com</a></li>
                        <li><a href="http://www.free-css.com/">Dreamstime.com</a></li>
                        <li><a href="http://www.free-css.com/">Dreamhost.com</a></li>
                    </ul>
                    <h1>Jak to szef mawia...</h1>
                    <p>&quot;Kupuj u nas. Jak zwykle najtaniej!&quot; </p>
                    <p class="align-right">- Szef wszystkich szefów</p>
                </div>
