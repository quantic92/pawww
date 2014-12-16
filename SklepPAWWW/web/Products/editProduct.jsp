<%-- 
    Document   : addproduct
    Created on : 2014-12-01, 21:16:06
    Author     : QuAntic
--%>
<jsp:include page="../masterpage.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>

<sql:query var="query" dataSource="jdbc/Sklep">
    SELECT * FROM category
</sql:query>

<sql:query var="product" dataSource="jdbc/Sklep">
    SELECT * FROM product WHERE productID = ?
    <sql:param value="${param.product}" />
</sql:query>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="insert" action="updateProductOnEdit.jsp" method="POST">

            <div id="main">
                <div id="img">
                    <img id="obraz" name="obrazek" src="${product.rows[0].imagePath}" style="height:240px;width:240px;" />
                </div>

                <div id="main">

                    <span id="defaultContent_Label1">Nazwa produktu:</span>
                    <br/>
                    <input type="text" name="name" value="${product.rows[0].name}" size="35" />
                    <br />
                    <br />

                    <span id="defaultContent_Label2">Cena:</span>
                    <br />
                    <input type="text" name="price" value="${product.rows[0].price}" size="37" />
                    <br />
                    <br />
                    <span id="defaultContent_Label3">Kategoria:</span>
                    <br />
                    <select name="categ">
                        <c:forEach var="kat" items="${query.rows}">
                            <c:if test="${kat.categoryID == product.rows[0].categoryID}">
                                <option value="${kat.categoryID}" selected >${kat.name}</option>
                            </c:if>
                            <c:if test="${kat.categoryID != product.rows[0].categoryID}">
                                <option value="${kat.categoryID}"  >${kat.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <br/>
                    <br/>
                    <input type="file" name="image" id="fileSelector" value="brakzdjecia.gif" style="height:21px;width:214px;"></input>
                    <br/> 
                    <br/>
                    Ilość: <input type="text" name="quantity" value="${product.rows[0].quantity}" size="37" />
                </div>
                <div>

                    <br/>
                    <br/>
                    <br/>
                    <h4>Opis produktu</h4>
                    <br/>
                    <textarea name="description" rows="6" cols="29">
                        ${product.rows[0].description}
                    </textarea>
                    <br />
                    <br />
                    <input type="submit" value="Akceptuj" />
                    <br />
                    <br />
                    <input type="hidden" name="productID" value="${param.product}" />
                </div>
            </div>
        </form>
    </body>
</html>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
    $("#fileSelector").change(function () {
        var text = $('input[type=file]').val();
        if (text.substring(text.length - 4) === ".jpg") {
            var dir = "Images/" + text;
            $("#obraz").attr("src", "/SklepPAWWW/images/products/" + text);
        }
    });

</script>


<jsp:include page="../masterpage2.jsp" />