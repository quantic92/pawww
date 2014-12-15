<%-- 
    Document   : advancedSearch
    Created on : 2014-12-15, 23:17:58
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="advancedSearchResult.jsp" >
        <div id="szukaniezaawansowane">

            <table border="0">

                <tbody>
                    <tr>
                        <td><div class="szElement">Szukaj w nazwie:</div> </td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td><div class="szElement">Szukaj w opisie:</div></td>
                        <td><input type="text" name="description" value="" /></td>
                    </tr>
                    <tr>
                        <td><div class="szElement"> Cena:</div></td>
                        <td>od:<input size="4" type="number" name="pricefrom" value="0" min="0"/> do:<input type="number" name="priceto" value="200" size="4" min="1"/></td>
                    </tr>
                    <tr>
                        <td><div class="szElement"> Ilosc:</div></td>
                        <td>od:<input size="4" type="number" name="quantityfrom" value="0" min="0"/> do:<input type="number" name="quantityto" value="10" size="4" min="1"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"> <div class="szElement"> <input type="submit" value="Szukaj" /> </div></td>

                    </tr>

                </tbody>
            </table>
        </div>
    </form>
    </body>
</html>
