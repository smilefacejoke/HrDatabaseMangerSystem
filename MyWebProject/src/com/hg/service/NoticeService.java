package com.hg.service;

import com.hg.pojo.Notice;

import java.util.List;

public interface NoticeService {

    //查询前5条数据
    List<Notice> selectTop5();

    int InsertNotice(Notice notice);
}
