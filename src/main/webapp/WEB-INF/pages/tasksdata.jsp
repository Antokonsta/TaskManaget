<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<html>
<head>

    <title>Инфо по задаче</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;

        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>

</head>
<body>
<h1>Информация по задаче</h1>

<a href="<c:url value="/tasks"/>" >Назад</a>

<br/>
<br/>
<table class="tg">
    <tr>
        <th width="120">Название</th>
        <th width="120">Дата начала</th>
        <th width="120">Дедлайн</th>
        <th width="250">Описание</th>
    </tr>
    <tr>

        <td>${task.nameOfTask}</td>
        <td>${task.startDateOfTask}</td>
        <td>${task.deadLineOfTask}</td>
        <td>${task.description}</td>
    </tr>
</table>
</body>
</html>