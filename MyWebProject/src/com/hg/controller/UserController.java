package com.hg.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hg.pojo.Counts;
import com.hg.pojo.User;
import com.hg.pojo.UsersPage;
import com.hg.service.CountsService;
import com.hg.service.UserService;
import com.hg.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private CountsService countsService;
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(String username, String password, String checkcode, HttpServletRequest request){

        System.out.println("username=="+ username +",password=="+ password +"checkcode==" +checkcode);

        //判断获取验证码是否正确
        //思路：获取用户输入的验证码，再获得Session中产生的验证码，然后进行比较
        //获得session中的验证码
        HttpSession session=request.getSession();
        String checkcodeSession = (String) session.getAttribute("checkcodeSession");
        String loginInfo="验证码错误!";

        if(checkcode.equalsIgnoreCase(checkcodeSession)){
            //如果验证成功应该去Service层完成登录的基本功能
            System.out.println("验证成功");
            //将用户名和密码提交给service层
            User user=userService.login( username, password);
            if(user!=null){
                //登录成功
                //将用户对象放到session中，供主界面访问
                
                //查询各表的数量
                Counts counts = countsService.selectCounts();

                HttpSession session1=request.getSession();
                session1.setAttribute("user",user);
                session.setAttribute("counts",counts);
                loginInfo="1";
                return "main";
            }else
                loginInfo="用户名或密码错误";



        }

            //跳转到登录界面，给提示
            request.setAttribute("loginInfo",loginInfo);
            return  "index";


    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        //退出的逻辑，就是新建一个session和user同名，如何有效事件设置为0即可
        HttpSession session=request.getSession();
        session.setAttribute("user",null);
        session.setMaxInactiveInterval(0);//有效期设置为0

        return "index";
    }

    //注册控制器
    @RequestMapping("/registerUser")
    @ResponseBody
    public String register(String json,String checkcode,HttpServletRequest request){
        System.out.println("注册验证码："+checkcode);
        //判断验证码是否正确
        //从session中获取验证码
        HttpSession session=request.getSession();
        String checkcodeSession=(String) session.getAttribute("checkcodeSession");
        System.out.println("json==="+json);
        String data="0";

        try{
            if(checkcode.equalsIgnoreCase(checkcodeSession)){
                //验证码验证成功
                //先完成json数据解析
                User user=JSON.parseObject(json,User.class);//将json数据封装成user对象
                user.setRoleId(1);
                user.setCreatedate(new Date());
                System.out.println("封装后的对象"+user);

                //将解析后的对象提交给serivce层完成注册
                int i=userService.register(user);

                if(i>0){
                    System.out.println("注册成功");
                    data="1";
                }else {
                    data="2";
                    System.out.println("注册失败");
                }
            }
        }catch (Exception exception){
            data="2";
            exception.printStackTrace();
        }finally {
            return data;
        }
    }

    @RequestMapping(value = "/findUsers",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String findUsers(Integer page, Integer limit, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        System.out.println("当前页:"+page+"，条数:"+limit);
        int start=(page-1)*limit;

        UsersPage usersPage=new UsersPage();
        usersPage.setStart(start);
        usersPage.setLimit(limit);

        List<User> list= userService.findByUsers(usersPage);
        list.forEach(li->System.out.println(li));

        //构建json数据
        //1.code,2.count,3.msg,4.data
        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg","");

        //获得数据总数
        HttpSession session = request.getSession();
        Counts counts=(Counts)session.getAttribute("counts");
        int userCount = counts.getUserCount();
        map.put("count",userCount);
        map.put("data",list);

        //将map集合封装成json数据
        String json=JSON.toJSONString(map);
        return json;
    }

    @RequestMapping("/checkPhone")
    @ResponseBody
    public String checkPhone(String phoneString){
        System.out.println("验证的手机号码："+phoneString);
        //将接收到的手机号去service查询数据库
        int i=userService.checkPhone(phoneString);
        return i+"";
    }

    @RequestMapping(value = "updateUser.do",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String updateUser(String json){
        System.out.println("要修改的数据："+json);
        //将json数据封装成pojo对象
        User user=JSON.parseObject(json,User.class);
        //去service层完成修改操作
        int i=userService.updateUser(user);
        return i+ "";
    }


    @RequestMapping(value = "deleteByNumber.do",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String deleteByNumber(String number){
        //去service层完成删除操作
        int i=userService.deleteByNumber(number);
        return i+ "";
    }
}
