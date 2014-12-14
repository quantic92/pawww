<%-- 
    Document   : adminPanel
    Created on : 2014-12-08, 21:13:25
    Author     : Mateusz
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<sql:query var="query" dataSource="jdbc/Sklep">
    SELECT * FROM category
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Dodaj nowy przedmiot:</h1>

        <form action="../Products/insertProductToDb.jsp" method="POST">
            <div class="blok">
                <div class="dodawanie">
                    Kategoria: <select name="category">
                        <c:forEach var="kat" items="${query.rows}">
                            <option value="${kat.categoryID}" >${kat.name}</option>
                        </c:forEach>
                    </select>
                </div>


                <div class="dodawanie">
                    Nazwa: <input type="text" name="name" value="" size="35" />
                </div>

                <div class="dodawanie">
                    Opis:
                    <textarea name="description" rows="6" cols="29">
                    </textarea>
                </div>

                <div class="dodawanie">
                    Cena: <input type="text" name="price" value="" size="37" />
                </div>

                <div class="dodawanie">
                    Ilość: <input type="text" name="quantity" value="" size="37" />
                </div>

                <div class="dodawanie">
                    <input type="submit" value="Akceptuj" />
                </div>
            </div>

        </form>
        Dodaj kategorie
        <form action="../Products/insertProductCategoryToDb.jsp" method="POST">
            <div class="blok">
                <div class="dodawanie">
                    Nazwa nowej kategorii:
                    <input type="text" name="newCategory" value="" />
                    <input type="submit" value="Dodaj" />
                </div>
            </div>
        </form>
    </body>
</html>
