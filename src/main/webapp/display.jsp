<%--
  Created by IntelliJ IDEA.
  User: kshit
  Date: 4/24/2019
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>SELECT Operation</title>
    <script>
        function confirmGo(m, u) {
            if (confirm(m)){
                window.location = u;
            }
        }
    </script>
</head>
<body>
<sql:setDataSource var="dSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/preparedstatement"
                   user="root" password=""/>

<sql:query dataSource="${dSource}" var="result">
    SELECT * FROM product;
</sql:query>
<form>
    <table border="1" width="40%">
<caption>Product List</caption>
        <tr>
            <th>Product Id</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th colspan="2">Action</th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td><c:out value="${row.id}"/></td>
                <td><c:out value="${row.prdname}"/></td>
                <td><c:out value="${row.qty}"/></td>
                <td><a href="update.jsp?id=<c:out value="${row.id}"/>">Update</a> </td>
                <td>
                    <a href="javascript:confirmGo('Sure to delete this record?',
                    'deletedb.jsp?id=<c:out value="${row.id}"/>')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
<a href="index.jsp">Home Page</a>
</body>
</html>
