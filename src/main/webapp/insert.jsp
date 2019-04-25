<%--
  Created by IntelliJ IDEA.
  User: kshit
  Date: 4/24/2019
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert Product</title>
</head>
<body>
<form action="dbinsert.jsp" method="post">
    Product name :
    <input type="text" name="prdname"/> <br/>
    Quantity : <input type="number" name="qty"/> <br/>
    <input type="submit" value="Save"> <br/>
    <input type="reset" value="Reset"> <br/>
</form>
</body>
</html>
