<%@ page import="com.thereroad.javaweb.beans.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: satan1a
  Date: 2019-04-16
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check Reset answer</title>
</head>
<body>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    // post传值，通过request获取选择的密保问题
    String question = request.getParameter("question");
    // post传值，通过request获取到输入的答案
    String answer = request.getParameter("answer");
    String question_1 = request.getParameter("question");
    String answer_1 = request.getParameter("answer");
    String question_2 = request.getParameter("question");
    String answer_2 = request.getParameter("answer");
    // 在JSP中，此验证是在服务器端完成，但JS可以做到在客户端 -> 考虑服务器效益
    // 验证输入是否为空，空则重定向到主页
    if(question == null||answer ==null && question_1 == null||answer_1 ==null &&
            question_2 == null||answer_2 ==null){
        response.sendRedirect("index.jsp");
    }
    // 设置重置密码成功标志为false
    boolean flag = false;
    // 创建Userbean对象，调用其业务逻辑方法
    UserBean ub = new UserBean();
    // 调用isReset()方法，检验问题回答是否匹配
    if(ub.isReset(question,answer)){
        flag = true;
    }
    // flag为真，代表重置密码成功
    if(flag){
        // 重置密码成功，重定向到登入成功欢迎页面
        response.sendRedirect("loginSuccess.jsp?question="+question);
    }else{
        // 重置密码失败，返回login页面
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>
