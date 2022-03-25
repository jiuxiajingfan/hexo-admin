package com.li.hexoadmin.dao;

import com.li.hexoadmin.pojo.User;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface UserMapper {
    User checkUser(@Param("UserName")String UserName,@Param("UserPWD") String UserPWD);
    List<User> queryUser();
    int updatePWD(@Param("UserName")String UserName,@Param("UserPWD") String UserPWD);
}
