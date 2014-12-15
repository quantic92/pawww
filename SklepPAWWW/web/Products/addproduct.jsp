<%-- 
    Document   : addproduct
    Created on : 2014-12-01, 21:16:06
    Author     : QuAntic
--%>
<jsp:include page="../masterpage.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="insert" action="insertProductToDb.jsp" method="POST">

            <div id="main">

                <a name="DodawanieProduktu"></a>
                <h1>Dodaj nowy produkt</h1>

                <div id="img">

                    <img src="../images/brakzdjecia.gif" style="height:240px;width:240px;" />

                </div>
                
                <div id="main">

                    <span id="defaultContent_Label1">Nazwa produktu:</span>
                    <br/>
                    <input name="name" type="text" />
                    <br />
                    <br />

                    <span id="defaultContent_Label2">Cena:</span>
                    <br />
                    <input name="price" type="text" />
                    <br />
                    <br />
                    <span id="defaultContent_Label3">Kategoria:</span>
                    <br />
                    <select name="nazwa">
		    <option>Tu wpisz pierwszą możliwość</option>
                    <option>Tu wpisz drugą możliwość</option>
	           </select>
                    <br/>
                    <br/>
                    <input type="file" name="image" style="height:21px;width:214px;" />
                </div>
                <div>
                <br/>
                <br/>
                <br/>
                <h4>Opis produktu</h4>
                <br/>
                <textarea name="description" rows="50" cols="20">opis</textarea>
                <br />
                <br />
                <input type="submit" value="Akceptuj" />
                <br />
                <br />
                </div>
            </div>
        </form>
    </body>
</html>
<jsp:include page="../masterpage2.jsp" />