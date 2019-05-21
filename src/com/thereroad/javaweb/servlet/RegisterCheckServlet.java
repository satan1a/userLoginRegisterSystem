package com.thereroad.javaweb.servlet;

import com.thereroad.javaweb.beans.UserBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterCheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
