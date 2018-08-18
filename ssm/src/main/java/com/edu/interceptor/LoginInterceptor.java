package com.edu.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    //URL请求前使用
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object o)
            throws Exception {
        System.out.println(request.getRequestURL());
        return true;
    }

    //URL请求时（视图请求）使用
    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response,
                           Object o, ModelAndView modelAndView)
            throws Exception {

    }

    //全部请求完成后
    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response,
                                Object o, Exception e)
            throws Exception {

    }
}
