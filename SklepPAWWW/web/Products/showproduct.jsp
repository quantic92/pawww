<%-- 
    Document   : addproduct
    Created on : 2014-12-01, 21:16:06
    Author     : QuAntic
--%>
<jsp:include page="../masterpage.jsp" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<sql:query var="query" dataSource="jdbc/Sklep">
    SELECT * FROM product
    WHERE productID = ?
    <sql:param value="${param.id}"></sql:param>
</sql:query>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="show" action="addToBasket.jsp">
            <div id="main">
                
                <a name="DodawanieProduktu"></a>
                <h1>${query.rows[0].name}</h1>

                <div id="img">

                    <img src="${query.rows[0].imagePath}"  style="height:240px;width:240px;" />

                </div>

                <div id="main">
                    <span id="defaultContent_Label1">Cena:</span>
                    <br />
                    <span id="defaultContent_Label2">${query.rows[0].price}</span>
                    <br />
                    <br />
                    <span id="defaultContent_Label3">Dostępność:</span>
                    <br />
                    <span id="defaultContent_Label3">${query.rows[0].quantity}</span>
                    <br />
                    <br/>
                    <span id="defaultContent_Label5">Ilość:</span>
                    <br />
                    <input name="quantity" type="text" />
                    
                    <input type="hidden" name="product" value="${query.rows[0].productID}"
                </div>
                </div>
                </div>
             <div id="main">   
                <br />
                <br />
                <br />
                <br />
                <br />
                <h4>Opis produktu:</h4>
                <br />
                    ${query.rows[0].description}
                <br/>
                <br/>
                <c:if test="${not empty sessionScope.loggedIn}">
                    <input type="submit" value="Dodaj do koszyka" />
                </c:if>
             
                <br/>
                <br/>
             </div>  
            
        </form>
    </body>
</html>
<jsp:include page="../masterpage2.jsp" />