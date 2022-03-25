package com.li.hexoadmin.service;

import com.li.hexoadmin.dao.UserMapper;
import com.li.hexoadmin.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public User checkUser(String UserName, String UserPWD) {
        return userMapper.checkUser(UserName,UserPWD);
    }

    @Override
    public List<User> queryUser() {
        return userMapper.queryUser();
    }

    @Override
    public int updatePWD(String UserName, String UserPWD) {
        return userMapper.updatePWD(UserName,UserPWD);
    }
}
