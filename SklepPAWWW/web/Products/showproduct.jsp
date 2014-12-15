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
        
        <form name="show">
            <div id="main">
                
                <a name="DodawanieProduktu"></a>
                <h1>Nazwa Produktu</h1>

                <div id="img">

                    <img src="../images/brakzdjecia.gif"  style="height:240px;width:240px;" />

                </div>

                <div id="main">


                    <span id="defaultContent_Label1">Cena:</span>
                    <br />
                    <span id="defaultContent_Label2">'Cena z bazy'</span>
                    <br />
                    <br />
                    <span id="defaultContent_Label3">Dostępność:</span>
                    <br />
                    <span id="defaultContent_Label3">'Dostępne lub nie'</span>
                    <br />
                    <br/>
                    <span id="defaultContent_Label5">Ilość:</span>
                    <br />
                    <input name="price" type="text" />
                </div>
                <br />
                <br />
             <div>   
                <br />
                <br />
                <br />
                <h4>Opis produktu:</h4>
                <br />
                <textarea name="description" rows="50" cols="20" disabled="disabled">
                </textarea>
                <br/>
                <br/>
             <input type="submit" value="Dodaj do koszyka" />
                <br/>
                <br/>
             </div>  
            </div>
        </form>
    </body>
</html>
<jsp:include page="../masterpage2.jsp" />