package com.hg.controller;

import com.alibaba.fastjson.JSON;
import com.hg.pojo.Uploadfile;
import com.hg.pojo.User;
import com.hg.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UploadController {
    @Autowired
    private UploadService uploadService;

    @RequestMapping("/upload.do")
    @ResponseBody
    public String uploadFile(MultipartFile file, HttpSession session){
        String filename = file.getOriginalFilename();
        System.out.println("上传文件的名称:"+filename);

        //将得到的文件保存到本地，可以用io流，一般都会用第三方插件
        //指定文件存放路径
        String path="D:\\upload";
        //先判断文件夹是否存在
        File file1=new File(path);
        if(!file1.exists()){
            //创建文件夹
            file1.mkdirs();
        }

        //文件名问题,要解决文件重名问题:获取当前时间的时间戳，再加上6位的随机数
        String newFileName=new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())+(new Random().nextInt(899999)+100000)+"-"+filename;

        //返回数据给前端
        Map<String,Object> map=new HashMap<>();

        if(file!=null&&!file.isEmpty()){
            //说明文件不为空
            try {
                file.transferTo(new File(path+"\\"+newFileName));
                System.out.println("上传成功");

                User user=(User)session.getAttribute("user");
                if(user!=null){
                    Uploadfile uploadFile=new Uploadfile();

                    uploadFile.setFilename(newFileName);
                    uploadFile.setUploadname(user.getUsername());
                    uploadFile.setUploaddate(new Date());

                    //将文件名字保存到数据库
                    int i=uploadService.insertFile(uploadFile);
                    if(i>0){
                        map.put("code",200);
                    }else {
                        map.put("code",500);
                    }
                }
            } catch (IOException e) {
                System.out.println("上传失败");
                map.put("code",400);
                e.printStackTrace();
            }
        }
        map.put("msg","");
        map.put("data",newFileName);

        //构建json数据
        String json= JSON.toJSONString(map);

        return json;
    }
}
