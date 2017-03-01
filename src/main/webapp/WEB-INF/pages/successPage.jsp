<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<html>
<head>
    <title>Success</title>
<style>

    @import url(http://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
    body{
        background: -webkit-linear-gradient(left, #25c481, #25b7c4);
        background: linear-gradient(to right, #25c481, #25b7c4);
        font-family: 'Lato', sans-serif;
        color: #fff;
        font-size: 12.5px;
    }
    h1{
        font-size: 30px;
        color: #fff;
        font-weight: 300;
        text-align: center;
        margin-bottom: 15px;
    }
    a{
        font-size: 30px;
        color: #fff;
        font-weight: 300;
        text-align: center;
    }
</style>

</head>
<body>
<h1>Account successfully created. Please sign in. </h1>
<br>
<a href="<c:url value="/autorization"/>">Sign in</a>
</body>
</html>
