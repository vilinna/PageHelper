package com.yunyang.pagehelper.service;
import com.yunyang.pagehelper.bean.User;
import java.util.List;
public interface IUserService {
    User getUserByName(String username,String password);
    String turnToMd5(String password) throws Exception;
    List<User> getUserInfo(Integer pageNum,Integer pageSize,String username);
}
