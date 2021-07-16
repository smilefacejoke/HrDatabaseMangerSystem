package com.hg.service;


import com.hg.mapper.UserMapper;
import com.hg.mapper.UsersPageMapper;
import com.hg.pojo.User;
import com.hg.pojo.UserExample;
import com.hg.pojo.UsersPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UsersPageMapper usersPageMapper;

    @Override
    public User login(String username, String password) {
        //操作dao层，用的是逆向工程，所有dao层都不用写
        //User user= userMapper.selectByPrimaryKey(username);
        UserExample example=new UserExample();
        example.or().andNumberEqualTo(username);//可以通过number(主键）登录
        example.or().andPhoneEqualTo(username);//手机号登录
        List<User> users=userMapper.selectByExample(example);
        if(users!=null&&users.size()>0){
            System.out.println("登录查询的结果："+users.get(0));
            //判断密码是否和用户输入的一样
            if(users.get(0) !=null){
                //比较密码
                if(password.equalsIgnoreCase(users.get(0).getPassword())){
                    //比较正确登录成功，返回用户对象
                    return users.get(0);
                }
            }
        }

        return null;
    }

    @Override
    public int register(User user)   {

        //调用dao层完成数据添加
        int i=userMapper.insertSelective(user);
        return i;
    }

    @Override
    public List<User> findByUsers(UsersPage usersPage) {
        List<User> users=usersPageMapper.selectUsers(usersPage);
        return users;
    }

    @Override
    public  int checkPhone(String phoneString){
        UserExample example=new UserExample();
        UserExample.Criteria criteria=example.createCriteria();
        criteria.andPhoneEqualTo(phoneString);
        List<User> users=userMapper.selectByExample(example);
        if(users!=null&&users.size()>0){
            return 1;
        }
        return 0;
    }

    @Override
    public int updateUser(User user) {
        //修改数据
        int i=userMapper.updateByPrimaryKeySelective(user);
        return i;
    }

    @Override
    public int deleteByNumber(String number) {
        //删除数据
        int i=userMapper.deleteByPrimaryKey(number);
        return i;
    }
}
