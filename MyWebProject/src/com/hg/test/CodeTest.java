package com.hg.test;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import cn.hutool.captcha.LineCaptcha;

public class CodeTest {
    public static void main(String[] args) {
        //定义图形验证码的长和宽
        CircleCaptcha captcha = CaptchaUtil.createCircleCaptcha(200, 100, 4, 80);

        //图形验证码写出，可以写出到文件，也可以写出到流
        captcha.write("D:/line.png");
    }
}
