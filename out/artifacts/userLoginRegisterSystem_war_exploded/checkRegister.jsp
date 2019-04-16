<%--
  Created by IntelliJ IDEA.
  User: satan1a
  Date: 2019-04-16
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.thereroad.javaweb.beans.*" %>

<html>
<head>
    <title>Check Register</title>
</head>
<body>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password1 = request.getParameter("password1");
    String password2 = request.getParameter("password2");

    if(username == null||password1 == null|| password2 == null||!password1.equals(password2)){
        response.sendRedirect("registerSuccess.jsp");
    }

    boolean flag = false;

    UserBean ub = new UserBean();
    if(ub.isExist(username)){
        //当然我们也是可以加上提示信息的
        response.sendRedirect("registerSuccess.jsp");

    }else if(ub.add(username,password1)){
        flag = true;
        response.sendRedirect("login.jsp");
    }
%>

</body>
</html>
