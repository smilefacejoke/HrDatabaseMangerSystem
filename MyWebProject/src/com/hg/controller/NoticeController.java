package com.hg.controller;

import com.alibaba.fastjson.JSON;
import com.hg.pojo.Notice;
import com.hg.pojo.User;
import com.hg.service.NoticeService;
import com.hg.service.NoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @RequestMapping(value = "/selectByTop5Notice.do",produces = "text/applocation;charset=utf-8")
    @ResponseBody
    public String selectByTop5Notice(){
        //调用service层查询参数
       List<Notice> list= noticeService.selectTop5();
       list.forEach(li->System.out.println(li));
       //将最后的数据封存成json数据发送

        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",0);
        map.put("data",list);
        String json= JSON.toJSONString(map);

        return json;
    }

    @RequestMapping(value = "/addNotice.do")
    @ResponseBody
    public String addNotice(String json, HttpSession session){
        System.out.println("新闻数据："+json);
        //将得到的新闻数据封装到对象中
        Notice notice = JSON.parseObject(json, Notice.class);
        User user=(User)session.getAttribute("user");
        if(user!=null){
            notice.setUsername(user.getUsername());
            System.out.println("封装后的对象"+notice);
            //调用service层完成添加
            int i=noticeService.InsertNotice(notice);
            return i+"";
        }
        return 0+"";
    }

}
