<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<html>
<head>
    <title> Autorization </title>


    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

    <link rel="stylesheet" href="css/style.css">


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

        /** login style **/

        *,:after,:before{box-sizing:border-box}
        .clearfix:after,.clearfix:before{content:'';display:table}
        .clearfix:after{clear:both;display:block}
        a{color:inherit;text-decoration:none}

        .login-wrap{
            width:100%;
            margin:auto;
            max-width:525px;
            min-height:520px;
            position:relative;
            background:url(https://files6.adme.ru/files/news/part_117/1175710/6313010-2-1000-e86a71aa24-1484729952.jpg) no-repeat center;
            box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
        }
        .login-html{
            width:100%;
            height:100%;
            position:absolute;
            padding:90px 70px 50px 70px;
            background: rgba(4, 153, 131, 0.9);
        }
        .login-html .sign-in-htm,
        .login-html .sign-up-htm{
            top:0;
            left:0;
            right:0;
            bottom:0;
            position:absolute;
            -webkit-transform:rotateY(180deg);
            transform:rotateY(180deg);
            -webkit-backface-visibility:hidden;
            backface-visibility:hidden;
            -webkit-transition:all .4s linear;
            transition:all .4s linear;
        }
        .login-html .sign-in,
        .login-html .sign-up,
        .login-form .group .check{
            display:none;
        }
        .login-html .tab,
        .login-form .group .label,
        .login-form .group .button{
            text-transform:uppercase;

        }
        .login-html .tab{
            font-size:22px;
            margin-right:15px;
            padding-bottom:5px;
            margin:0 15px 10px 0;
            display:inline-block;
            border-bottom:2px solid transparent;
        }
        .login-html .sign-in:checked + .tab,
        .login-html .sign-up:checked + .tab{
            color:#fff;
            border-color: #048294;
        }
        .login-form{
            min-height:345px;
            position:relative;
            -webkit-perspective:1000px;
            perspective:1000px;
            -webkit-transform-style:preserve-3d;
            transform-style:preserve-3d;
        }
        .login-form .group{
            margin-bottom:15px;
        }
        .login-form .group .label,
        .login-form .group .input,
        .login-form .group .button{
            width:100%;
            color:#fff;
            display:block;
        }
        .login-form .group .input,
        .login-form .group .button{
            border:none;
            padding:15px 20px;
            border-radius:25px;
            background:rgba(255,255,255,.1);
        }
        .login-form .group input[data-type="password"]{
            text-security:circle;
            -webkit-text-security:circle;
        }
        .login-form .group .label{
            color:#aaa;
            font-size:12px;
        }
        .login-form .group .button{
            background: #048294;
        }
        .login-form .group .button:hover,
        .login-form .group .button:active {
            background-color: #fff; /* fallback */
            background-color: rgba(255, 255, 255, 0.4);
            border-color: #fff; /* fallback */
            border-color: rgba(255, 255, 255, 0.4);
            transition: background-color 0.3s ease-in,
            border-color 0.3s ease-in;
        }
        .login-form .group label .icon{
            width:15px;
            height:15px;
            border-radius:2px;
            position:relative;
            display:inline-block;
            background:rgba(255,255,255,.1);
        }
        .login-form .group label .icon:before,
        .login-form .group label .icon:after{
            content:'';
            width:10px;
            height:2px;
            background:#fff;
            position:absolute;
            -webkit-transition:all .2s ease-in-out 0s;
            transition:all .2s ease-in-out 0s;
        }
        .login-form .group label .icon:before{
            left:3px;
            width:5px;
            bottom:6px;
            -webkit-transform:scale(0) rotate(0);
            transform:scale(0) rotate(0);
        }
        .login-form .group label .icon:after{
            top:6px;
            right:0;
            -webkit-transform:scale(0) rotate(0);
            transform:scale(0) rotate(0);
        }
        .login-form .group .check:checked + label{
            color:#fff;
        }
        .login-form .group .check:checked + label .icon{
            background: #048294;
        }
        .login-form .group .check:checked + label .icon:before{
            -webkit-transform:scale(1) rotate(45deg);
            transform:scale(1) rotate(45deg);
        }
        .login-form .group .check:checked + label .icon:after{
            -webkit-transform:scale(1) rotate(-45deg);
            transform:scale(1) rotate(-45deg);
        }
        .login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
            -webkit-transform:rotate(0);
            transform:rotate(0);
        }
        .login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
            -webkit-transform:rotate(0);
            transform:rotate(0);
        }

        .hr{
            height:2px;
            margin:60px 0 50px 0;
            background:rgba(255,255,255,.2);
        }
        .foot-lnk{
            text-align:center;
        }


        </style>





</head>
<body>
<br>
<br>

<a href="<c:url value="/tasks"/>" target="_blank">List of tasks</a>
<br>
<%--
<c:url var="loginAction" value = "/login/check"/>
--%>


<div class="login-wrap">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>




        <div class="login-form">

            <%-- Login cheacking --%>
            <div class="sign-in-htm">
                <c:url var="loginAction" value = "/login/check"/>
                <form:form action="${loginAction}" commandName="login">
                <div class="group">
                        <td>
                            <form:label path="login" cssclass="label">
                                <spring:message text="Username"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input cssClass="input" path="login"/>
                        </td>
                </div>
                <div class="group">
                    <td>
                        <form:label path="password" cssclass="label">
                            <spring:message text="Password"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input cssClass="input" type="password" path="password"/>
                    </td>

                </div>
                <div class="group">
                    <input id="check" type="checkbox" class="check" checked>
                    <label for="check"><span class="icon"></span> Keep me Signed in</label>
                </div>
                <div class="group">
                    <input type="submit" class="button" value="Sign In">
                </div>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <a href="#forgot">Forgot Password?</a>
                </div>
                </form:form>
            </div>

        <%-- Account creating--%>

            <div class="sign-up-htm">
                <c:url var="loginAddAction" value = "/login/add"/>
                <form:form action="${loginAddAction}" commandName="login">
                <div class="group">
                    <td>
                        <form:label path="login" cssclass="label">
                            <spring:message text="Username"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input cssClass="input" path="login"/>
                    </td>
                </div>
                <div class="group">


                    <td>
                        <form:label path="password" cssclass="label">
                            <spring:message text="Password"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input cssClass="input" type="password" path="password"/>
                    </td>

                </div>

                <div class="group">


                    <td>
                        <form:label path="email" cssclass="label">
                            <spring:message text="Email Address"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input cssClass="input" type="email" path="email"/>
                    </td>

                </div>
                <div class="group">
                    <input type="submit" class="button" value="Sign Up">
                </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
