package com.li.hexoadmin.controller;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Interceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        //放行登录页面
        if(request.getRequestURI().contains("tologin")){
            return true;
        }

        //尝试提交
        if(request.getRequestURI().contains("login")){
            return true;
        }

        //判断登录情况
        if(session.getAttribute("userInfo")!=null){
            return true;
        }
        request.getRequestDispatcher("/WEB-INF/jsp/Login.jsp").forward(request,response);
        System.out.println("已拦截");
        return false;


    }
}
