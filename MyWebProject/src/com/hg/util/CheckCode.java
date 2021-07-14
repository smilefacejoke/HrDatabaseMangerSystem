package com.hg.util;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import cn.hutool.captcha.ICaptcha;
import cn.hutool.captcha.LineCaptcha;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CheckCode")
public class CheckCode extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //定义图形验证码的长和宽
        CircleCaptcha captcha = CaptchaUtil.createCircleCaptcha(100, 38, 4, 20);
        //图形验证码写出，可以写出到文件，也可以写出到流
        captcha.write(response.getOutputStream());

         //将产生的验证码放到session中，供后面验证使用
        HttpSession session=request.getSession();
        String checkcodeSession=captcha.getCode();
        session.setAttribute("checkcodeSession",checkcodeSession);


        System.out.println("产生的验证码:"+checkcodeSession );
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
