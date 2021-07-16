package com.hg.Interceptor;
//检查用户是否登录的拦截器


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckUserInterceptor implements HandlerInterceptor {


    /**
     *
     * @param request
     * @param response
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //检测用户是否登录
        HttpSession session = request.getSession();
        //有些时候不能拦截，如index的登录和注册是不能拦截的
        String path=request.getRequestURI();
        if(path.indexOf("login")!=-1||path.indexOf("registerUser")!=-1){
            return true;
        }

        if(session.getAttribute("user")!=null){
            System.out.println("说明用户已经登录");
            return true;
        }else{
            System.out.println("用户未登录");
            //跳转到登录界面
            //request.getContextPath()==pageContext.request.contextPath
            response.sendRedirect(request.getContextPath()+"/index.jsp");
            return false;
        }

    }

    /**
     *
     * @param request
     * @param response
     * @param o
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {

    }
    /**
     * 执行hander之后执行
     * 应用场景：做日志记录
     * @param request
     * @param response
     * @param o
     * @param e
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {

    }
}
