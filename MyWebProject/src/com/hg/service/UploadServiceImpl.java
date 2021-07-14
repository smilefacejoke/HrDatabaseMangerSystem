package com.hg.service;

import com.hg.mapper.UploadfileMapper;
import com.hg.pojo.Uploadfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UploadServiceImpl implements UploadService{
    @Autowired
    private UploadfileMapper uploadfileMapper;

    @Override
    public int insertFile(Uploadfile uploadFile) {
        int i=uploadfileMapper.insertSelective(uploadFile);
        return i;
    }
}
