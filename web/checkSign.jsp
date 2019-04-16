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
    // post传值，通过request获取到输入的用户名
    String username = request.getParameter("username");
    // post传值，通过request获取到输入的密码
    String password = request.getParameter("password");
    // 在JSP中，此验证是在服务器端完成，但JS可以做到在客户端 -> 考虑服务器效益
    // 验证输入是否为空，空则重定向到主页
    if(username == null||password ==null){
        response.sendRedirect("index.jsp");
    }
    // 设置登入成功标志为false
    boolean flag = false;
    // 创建Userbean对象，调用其业务逻辑方法
    UserBean ub = new UserBean();
    // 调用isvalid()方法，检验用户名密码是否匹配
    if(ub.isvalid(username,password)){
        flag = true;
    }
    // flag为真，代表登入成功
    if(flag){
        // 登入成功，重定向到登入成功欢迎页面
        response.sendRedirect("loginSuccess.jsp?username="+username);
    }else{
        // 登入失败，返回login页面
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>
