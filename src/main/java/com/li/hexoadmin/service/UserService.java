package com.li.hexoadmin.service;


import com.li.hexoadmin.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    User checkUser(String UserName, String UserPWD);
    List<User> queryUser();
    int updatePWD(String UserName, String UserPWD);
}
