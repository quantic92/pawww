<%-- 
    Document   : adminPanel
    Created on : 2014-12-08, 21:13:25
    Author     : Mateusz
--%>
<jsp:include page="../masterpage.jsp" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<sql:query var="query" dataSource="jdbc/Sklep">
    SELECT * FROM category
</sql:query>
<sql:query var="query2" dataSource="jdbc/Sklep">
    SELECT * FROM product
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main">
        <h1>Dodaj produkt:</h1>
        <form action="../Products/addproduct.jsp" method="POST">
                <input type="submit" value="Dodaj">
        </form>
        <h1>Edytuj produkty:</h1> 
        <form>
            <div class="dodawanie">
                    Wybierz kategorię:
                    <select name="category">
                        <c:forEach var="prod" items="${query2.rows}">
                            <option value="${prod.productID}" >${prod.name}</option>
                        </c:forEach>
                    </select>
                     </br>
                      </br>
                    <input type="submit" value="Edytuj" />
                     </br>
                </div>
        </form>
        <h1>Dodaj kategorie:</h1>
        <form action="../Products/insertProductCategoryToDb.jsp" method="POST">
            <div class="blok">
                <div class="dodawanie">
                    <br>Nazwa nowej kategorii:
                    <input type="text" name="newCategory" value="" />
                     </br>
                      </br>
                    <input type="submit" value="Dodaj" />
                    </br>
                </div>
            </div>
        </form>
        <h1>Usuń kategorie:</h1>
        <form action="../Products/deleteProductCategoryToDb.jsp" method="POST">
            <div class="blok">
                <div class="dodawanie">
                    Wybierz kategorię:
                    <select name="category">
                        <c:forEach var="kat" items="${query.rows}">
                            <option value="${kat.categoryID}" >${kat.name}</option>
                        </c:forEach>
                    </select>
                     </br>
                      </br>
                    <input type="submit" value="Usuń" />
                     </br>
                </div>
            </div>
        <h1>Edytuj nazwę kategorii:</h1>    
        <form action="/SklepPAWWW/Products/updateProductCategoryToDb.jsp" method="POST">
            <div class="blok">
                <div class="dodawanie">
                    </br>
                    Wybierz kategorię:
                    <select name="category">
                        <c:forEach var="kat" items="${query.rows}">
                            <option value="${kat.categoryID}" >${kat.name}</option>
                        </c:forEach>
                    </select>
                    </br>
                    <br>Nowa nazwa:
                    <input type="text" name="renameCategory" value="" />
                     </br>
                      </br>
                    <input type="submit" value="Dodaj" />
                    </br>
                </div>
            </div>   
        </form>    
        </form>    
        </div>
    </body>
</html>
<jsp:include page="../masterpage2.jsp" />
