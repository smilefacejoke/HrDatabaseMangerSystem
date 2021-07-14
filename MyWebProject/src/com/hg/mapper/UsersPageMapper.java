package com.hg.mapper;

import com.hg.pojo.User;
import com.hg.pojo.UsersPage;

import java.util.List;

public interface UsersPageMapper {

    //分页查询user
    List<User> selectUsers(UsersPage page);
}
