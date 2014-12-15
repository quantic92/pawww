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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main">
        <h1>Dodaj produkt</h1>
        <form action="../Products/addproduct.jsp" method="POST">
                <input type="submit" value="Dodaj">
        </form>
        <h1>Edytuj produkty</h1> 
        <form>
            
        </form>
        <h1>Dodaj kategorie</h1>
        <form action="../Products/insertProductCategoryToDb.jsp" method="POST">
            <div class="blok">
                <div class="dodawanie">
                    Nazwa nowej kategorii:
                    <input type="text" name="newCategory" value="" />
                    <input type="submit" value="Dodaj" />
                </div>
            </div>
        </form>
        <h1>Edytuj kategorie</h1>
        <form action="#" method="POST">
            
        </form>    
        </div>
    </body>
</html>
<jsp:include page="../masterpage2.jsp" />
