package com.hg.service;

import com.hg.pojo.User;
import com.hg.pojo.UsersPage;

import java.util.List;

public interface UserService {
    //登录功能
    User login(String username, String password);

    //注册功能
    int register(User user);

    //分页查询用户
    List<User> findByUsers(UsersPage usersPage);

    //检查手机号码是否重复
    int checkPhone(String phoneString);

    int updateUser(User user);

    int deleteByNumber(String number);
}
