<%--
  Created by IntelliJ IDEA.
  User: satan1a
  Date: 2019-04-16
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Login & Register System</title>


    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css'>

    <link rel="stylesheet" href="css/style.css">
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>


</head>

<body>

<div class="container white z-depth-2">
    <ul class="tabs teal">
        <li class="tab col s3"><a class="white-text active" href="#login">login</a></li>
        <li class="tab col s3"><a class="white-text" href="#register">register</a></li>
    </ul>

    <div id="resetPassword" class="col s12">
        <!--以下为重置密码-->
        <%--TODO--%>
        <form action="checkReset.jsp" method="post" class="col s12">
            <div class="form-container">
                <h3 class="teal-text">Reset Password</h3>

                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input name="email" type="email" class="validate">
                        <label name="email">Email</label>
                    </div>
                </div>
            <div class="row">
                <div class="input-field col s12">
                <input type="button"class="validate"><br>
                 <label >验证用户名是否合法</label>
                </div>
            </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input name="question_id_1" type="search" class="validate">
                        <label name="question_id_1">Choose Your Security Question One</label>
                    </div>
                </div>
            <div class="row">
                <div class="input-field col s12">
                    <input name="question_id_2" type="search" class="validate">
                    <label name="question_id_2">Choose Your Security Question Two</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input name="question_id_3" type="search" class="validate">
                    <label name="question_id_3">Choose Your Security Question Three</label>
                </div>
            </div>

                <center>
                    <button class="btn waves-effect waves-light teal" type="submit" name="action">Submit</button>
                </center>
            </div>
        </form>
    </div>
</div>
<script src='https://code.jquery.com/jquery-2.1.1.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js'></script>



<script  src="../js/index.js"></script>




</body>


</html>

