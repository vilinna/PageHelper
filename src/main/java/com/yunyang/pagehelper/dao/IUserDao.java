package com.yunyang.pagehelper.dao;

import com.yunyang.pagehelper.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import  java.util.List;
@Component
public interface IUserDao {
    User getUserByName(@Param(value = "username") String username, @Param(value = "password") String password);
    List<User> getUserInfo(@Param(value = "username") String username);
}
