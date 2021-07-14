package com.hg.service;

import com.hg.pojo.Uploadfile;

public interface UploadService {
    //添加文件到数据库
    int insertFile(Uploadfile uploadFile);
}
