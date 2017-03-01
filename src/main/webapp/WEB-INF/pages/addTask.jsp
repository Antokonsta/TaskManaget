<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<html>
<head>
    <title>Add task</title>

    <style type="text/css">

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
            text-transform: uppercase;
            font-weight: 300;
            text-align: center;
            margin-bottom: 15px;
        }




    </style>
</head>
<body>


<h1>Add Task</h1>
<br>

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
                    <spring:message text="Name of the task"/>
                </form:label>
            </td>
            <td>
                <form:input path="nameOfTask"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="startDateOfTask">
                    <spring:message text="Start date"/>
                </form:label>
            </td>
            <td>
                <form:input  path="startDateOfTask" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label  path="deadLineOfTask">
                    <spring:message text="Deadline"/>
                </form:label>
            </td>
            <td>
                <form:input path="deadLineOfTask"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label  path="description">
                    <spring:message text="Description"/>
                </form:label>
            </td>
            <td>
                <form:input path="description" size="70" />


            </td>
        </tr>


        <tr>
            <td colspan="2">
                <c:if test="${!empty task.nameOfTask}">
                    <input  type="submit"
                           value="<spring:message text="Edit "/>"/>
                </c:if>
                <c:if test="${empty task.nameOfTask}">
                    <input  type="submit"
                           value="<spring:message text="Add "/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
