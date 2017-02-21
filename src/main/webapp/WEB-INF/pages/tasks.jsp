<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<html>
<head>

    <title> Задачи </title>

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
            background-color: #debaff;
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
            background-color: #bd1cff;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>

</head>
<body>
<a href="../../index.jsp">Вернуться в главное меню</a>

<br/>
<br/>

<h1><Tasks></Tasks> Список активных задач</h1>

<c:if test="${!empty listTasks}">
    <table class="tg">
        <tr>
            <th width="80">Номер</th>
            <th width="120">Название</th>
            <th width="120">Дата начала</th>
            <th width="120">Дедлайн</th>
            <th width="60">Изменить</th>
            <th width="60">Удалить</th>
        </tr>
        <c:forEach items="${listTasks}" var="task">
            <tr>
                <td>${task.numberOfTask}</td>
                <td><a href="/taskdata/${task.numberOfTask}">${task.nameOfTask}</a></td>
                <td>${task.startDateOfTask}</td>
                <td>${task.deadLineOfTask}</td>
                <td><a href="<c:url value='/edit/${task.numberOfTask}'/>"> Изменить</a></td>
                <td><a href="<c:url value='/remove/${task.numberOfTask}'/>">Удалить</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<h1>Add Task</h1>

<c:url var="addAction" value = "/tasks/add"/>

<form:form action="${addAction}" commandName="task">
    <table>
        <c:if test="${!empty task.nameOfTask}">
            <tr>
                <td>
                    <form:label path="numberOfTask">
                        <spring:message text="Номер"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="numberOfTask" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="numberOfTask"></form:hidden>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="nameOfTask">
                    <spring:message text="Название задачи"/>
                </form:label>
            </td>
            <td>
                <form:input path="nameOfTask"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="startDateOfTask">
                    <spring:message text="Дата начала"/>
                </form:label>
            </td>
            <td>
                <form:input  path="startDateOfTask" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label  path="deadLineOfTask">
                    <spring:message text="Дедлайн"/>
                </form:label>
            </td>
            <td>
                <form:input path="deadLineOfTask"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label  path="description">
                    <spring:message text="Описание"/>
                </form:label>
            </td>
            <td>
                <form:input path="description" size="70" />


            </td>
        </tr>


        <tr>
            <td colspan="2">
                <c:if test="${!empty task.nameOfTask}">
                    <input type="submit"
                           value="<spring:message text="Изменить "/>"/>
                </c:if>
                <c:if test="${empty task.nameOfTask}">
                    <input type="submit"
                           value="<spring:message text="Добавить "/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
