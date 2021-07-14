package com.hg.service;

import com.hg.mapper.NoticeMapper;
import com.hg.pojo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> selectTop5() {
        List<Notice> notices=noticeMapper.selectByTop5Noticed();
        return notices;
    }

    @Override
    public int InsertNotice(Notice notice) {
        int i=noticeMapper.insertSelective(notice);
        return i;
    }
}
