<%@page isELIgnored="false"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kshit
  Date: 4/24/2019
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sql:setDataSource var="dSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/preparedstatement"
                   user="root" password="G0oner4life!"/>

<sql:query var="result" dataSource="${dSource}">
    SELECT * FROM product WHERE id=?
    <sql:param value="${param.id}"/>
</sql:query>
<%--<sql:query dataSource="${dSource}" var="result">--%>
<%--    SELECT * FROM product WHERE id=?--%>
<%--    <sql:param value="${param.id}"/>--%>
<%--</sql:query>--%>

<form action="updatedb.jsp" method="post">
    <table border="0" width="40%">
        <caption>Update Product</caption>
        <tr><th>Product Name</th><th>Quantity</th></tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td>
                    <input type="hidden" value="${param.id}" name="id"/>
                </td>
                <td>
                    <label>
                        <input type="text" value="${row.prdname}" name="prdname"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type="text" value="${row.qty}" name="qty"/>
                    </label>
                </td>
                <td>
                    <input type="submit" value="Update"/>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="index.jsp">Home Page</a>
</form>
</body>
</html>
