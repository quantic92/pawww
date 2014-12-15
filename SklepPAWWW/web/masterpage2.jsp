<%-- 
    Document   : masterpage2
    Created on : 2014-12-01, 20:03:19
    Author     : QuAntic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

  <div id="footer-wrap">
    <div id="footer">
    <sql:query var="counter" dataSource="jdbc/Sklep">
        SELECT count FROM counter;
    </sql:query>
        
        Liczba odwiedzin: ${counter.rows[0].count}
        <sql:update dataSource="jdbc/Sklep">
            UPDATE counter
            SET count = ?
            <sql:param value="${counter.rows[0].count + 1}" />
        </sql:update>
      <p>&copy; 2014 <strong>PS3-shop</strong> | Design by: <a href="http://www.styleshout.com/">styleshout</a> | Valid <a target="_blank" href="http://validator.w3.org/check?uri=referer">XHTML</a> | <a target="_blank" href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.free-css.com/">Home</a>&nbsp;|&nbsp;<a href="http://www.free-css.com/">Sitemap</a>&nbsp;|&nbsp;<a href="http://www.free-css.com/">RSS Feed</a></p>
    </div>
  </div>
</div>
</body>
</html>
