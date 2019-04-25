<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%--
  Created by IntelliJ IDEA.
  User: kshit
  Date: 4/24/2019
  Time: 10:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function call(){
            alert("data updated!");
            window.location = "index.jsp";
        }
    </script>
</head>
<body>
<c:if test="${empty param.prdname or param.qty}">
    <c:redirect url="insert.jsp">
    <c:param name="errMsg" value="Please enter product and quantity"/>
    </c:redirect>
</c:if>

<sql:setDataSource var="dSource" driver="com.mysql.cj.jdbc.Driver"
url="jdbc:mysql://localhost:3306/preparedstatement"
user="root" password=""/>

<sql:update dataSource = "${dSource}" var="result">
    insert into product(prdname, qty) values(?, ?);
    <sql:param value="${param.prdname}"/>
    <sql:param value="${param.qty}"/>
</sql:update>

<c:if test="${result >= 1}">
    <h2>Returning to Home?</h2>
    <input type="submit" onclick="call()" value="Home"/>
    <span style="font-size: large; color: green; ">Product inserted successfully.</span>
<%--    <script type="text/javascript">--%>
<%--        alert("it works");--%>
<%--    </script>--%>
<%--    <c:redirect url="index.jsp">--%>
<%--        <c:param name="susMsg" value="Data insert successfully"/>--%>
<%--    </c:redirect>--%>
</c:if>
</body>
</html>
