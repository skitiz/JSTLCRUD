<%@page isELIgnored="false" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<sql:setDataSource var="dSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/preparedstatement"
                   user="root"  password=""/>
<sql:update dataSource="${dSource}" var="count">
    DELETE FROM product WHERE id='${param.id}'
</sql:update>
<c:if test="${count>=1}">
    <span style="font-size: large; color: green; "> Congratulations ! Data deleted
        successfully.</span>
    <a href="index.jsp">Home Page</a>
</c:if>
</body>
</html>
