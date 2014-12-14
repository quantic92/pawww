<%-- 
    Document   : masterpage
    Created on : 2014-12-01, 19:40:03
    Author     : QuAntic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Marketplace - 2 Column</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="/SklepPAWWW/images/MarketPlace.css" type="text/css" />
    </head>
    <body>
        <c:if test="${sessionScope.isAdmin == true}">
            <form action="/SklepPAWWW/User/adminPanel.jsp" name="strona" class="logowanie">
                <input type="submit" value="Panel administracyjny"  class="button"/>
            </form>
            To trzeba wrzucic obok zaloguj i musi byc sprawdzane czy jest zalogowany
        </c:if>


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
                            <a href="Products/basket.jsp">Koszyk</a>
                            <input type="submit" value="wyloguj"  class="button"/>
                        </form>
                    </c:if>
                </div>
                <div id="header-links">
                    <p> <a href="http://www.free-css.com/">Home</a> | <a href="User/register.jsp">Zarejestruj</a> | <a href="http://www.free-css.com/">Contact</a> | <a href="http://www.free-css.com/">Site Map</a> </p>
                </div>
            </div>
            <div id="header-photo">
                <h1 id="logo-text"><a href="http://www.free-css.com/">PS3 Shop</a></h1>
                <h2 id="slogan">Kupuj u nas!</h2>
            </div>
            <div  id="nav">
                <ul>
                    <li><a href="http://www.free-css.com/">Home</a></li>
                    <li id="current"><a href="2-columns.php">Kategorie</a></li>
                    <li><a href="http://www.free-css.com/">Koszyk</a></li>
                    <li><a href="http://www.free-css.com/">Ustawienia Konta</a></li>
                    <li><a href="http://www.free-css.com/">Pomoc</a></li>
                    <li><a href="http://www.free-css.com/">O nas</a></li>

                </ul>
            </div>
            <div id="content-wrap" class="two-col"  >
                <div id="sidebar">
                    <h1>Search Box</h1>
                    <form action="http://www.free-css.com/" class="searchform">
                        <p>
                            <input name="search_query" class="textbox" type="text" />
                            <input name="search" class="button" value="Search" type="submit" />
                        </p>
                    </form>
                    <h1>Sidebar Menu</h1>
                    <ul class="sidemenu">
                        <li><a href="http://www.free-css.com/">Home</a></li>
                        <li><a href="http://www.free-css.com/">Template Info</a></li>
                        <li><a href="http://www.free-css.com/">Sample Tags</a></li>
                        <li><a href="http://www.free-css.com/">More Free Templates</a></li>
                        <li><a href="http://www.free-css.com/">Premium Templates</a></li>
                    </ul>
                    <h1>Links</h1>
                    <ul class="sidemenu">
                        <li><a href="http://www.free-css.com/">PDPhoto.org</a></li>
                        <li><a href="http://www.free-css.com/">Squidfingers | Patterns</a></li>
                        <li><a href="http://www.free-css.com/">Alistapart</a></li>
                        <li><a href="http://www.free-css.com/">CSS Mania</a></li>
                        <li><a href="http://www.free-css.com/">Dark Eye</a></li>
                    </ul>
                    <h1>Sponsors</h1>
                    <ul class="sidemenu">
                        <li><a href="http://www.free-css.com/">4templates</a></li>
                        <li><a href="http://www.free-css.com/">TemplateMonster</a></li>
                        <li><a href="http://www.free-css.com/">Fotolia.com</a></li>
                        <li><a href="http://www.free-css.com/">Dreamstime.com</a></li>
                        <li><a href="http://www.free-css.com/">Dreamhost.com</a></li>
                    </ul>
                    <h1>Wise Words</h1>
                    <p>&quot;We are what we repeatedly do. Excellence, then, is not an act, but a habit.&quot; </p>
                    <p class="align-right">- Aristotle</p>
                </div>
