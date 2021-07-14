package com.hg.controller;


import com.hg.pojo.Counts;
import com.hg.service.CountsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CountsController {
    @Autowired
    private CountsService countsService;
    @RequestMapping("/counts")
    public String counts(){
        Counts counts=countsService.selectCounts();
        System.out.println("查询到的结果是"+counts);

        return "";
    }
}
