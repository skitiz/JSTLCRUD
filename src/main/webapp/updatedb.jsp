<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: kshit
  Date: 4/24/2019
  Time: 1:45 PM
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

<sql:update var="result" dataSource="${dSource}">
    UPDATE product SET prdname = ?, qty = ?
    WHERE id = '${param.id}';
    <sql:param value="${param.prdname}"/>
    <sql:param value="${param.qty}"/>
</sql:update>

<c:if test="${result>=1}">
    <span style="...">
        Congratulations.
    </span>
    <a href="index.jsp">Home Page</a>
</c:if>
</body>
</html>
