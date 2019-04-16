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
    <title>Check Sign</title>
</head>
<body>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    // 在JSP中，此验证是在服务器端完成，但JS可以做到在客户端 -> 考虑服务器效益
    // 验证输入是否为空，空则重定向到主页
    if(username == null||password ==null){
        response.sendRedirect("index.jsp");
    }
    boolean flag = false;

    UserBean ub = new UserBean();
    if(ub.isvalid(username,password)){
        flag = true;
    }

    if(flag){
        response.sendRedirect("loginSuccess.jsp?username="+username);
    }else{
        response.sendRedirect("login.jsp?info=error");
    }
%>
</body>
</html>
