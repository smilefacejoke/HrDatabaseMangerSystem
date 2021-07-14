package com.hg.service;

import com.hg.mapper.CountsMapper;
import com.hg.pojo.Counts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CountsServiceImpl implements CountsService{
    @Autowired
    private CountsMapper countsMapper;
    @Override
    public Counts selectCounts() {
        Counts counts=countsMapper.selectCounts();

        return counts;
    }
}
