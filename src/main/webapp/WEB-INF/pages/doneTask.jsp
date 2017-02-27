<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<html>
<head>
    <title>Выполненные задачи</title>


    <style type="text/css">


        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {

            font-family: 'Lato', sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #debaff;
        }

        .tg th {
            font-family: 'Lato', sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #bd1cff;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }



    </style>


</head>
<body>
<h1>Выполненные задачи</h1>

<a href="<c:url value="/tasks"/>">Назад</a>

<br/>
<br/>




<table class="tg">
    <tr>
        <th width="120">Название</th>
        <th width="120">Дата начала</th>
        <th width="120">Дедлайн</th>
        <th width="120">Описание</th>
        <th width="60">Удалить</th>
        <th width="90">Вернуть в работу</th>
    </tr>
    <c:forEach items="${listDoneTasks}" var="task">
        <tr>
            <td>${task.nameOfTask}</td>
            <td>${task.startDateOfTask}</td>
            <td>${task.deadLineOfTask}</td>
            <td>${task.description}</td>
            <td><a href="<c:url value='/remove/${task.numberOfTask}'/>">Удалить</a></td>
            <td><a href="<c:url value='/return/${task.numberOfTask}'/>">Вернуть в работу</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
