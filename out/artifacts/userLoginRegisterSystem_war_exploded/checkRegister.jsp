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
    // 输入的用户名
    String username = request.getParameter("username");
    // 输入的密码
    String password1 = request.getParameter("password1");
    // 再次确认的密码
    String password2 = request.getParameter("password2");
    // 检查输入的密码和再次输入的密码是否一致
    if(username == null||password1 == null|| password2 == null||!password1.equals(password2)){
        response.sendRedirect("registerSuccess.jsp");
    }
    // 注册成功标志，默认设置为false
    boolean flag = false;
    // 创建业务逻辑beans对象
    UserBean ub = new UserBean();
    // 检查用户名是否已经存在
    if(ub.isExist(username)){
        // 登入成功，重定向到登入成功界面
        response.sendRedirect("registerSuccess.jsp");
        // 用户注册，在数据库中新增一个用户
    }else if(ub.add(username,password1)){
        flag = true;
        response.sendRedirect("login.jsp");
    }
%>

</body>
</html>
