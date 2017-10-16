package com.yunyang.pagehelper.service.impl;

import com.github.pagehelper.PageHelper;
import com.yunyang.pagehelper.bean.User;
import com.yunyang.pagehelper.dao.IUserDao;
import com.yunyang.pagehelper.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.security.MessageDigest;
import java.util.List;
@Service("userService")
public class UserServiceImpl implements IUserService {
    @Resource
    IUserDao userDao;

    public User getUserByName(String username, String password) {
        return userDao.getUserByName(username,password);
    }

    public List<User> getUserInfo(Integer pageNum,Integer pageSize,String username) {
        PageHelper.startPage(pageNum, pageSize);
        return userDao.getUserInfo(username);
    }

    /*對字符串進行加密*/
    public String turnToMd5(String password) throws Exception {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        String salt = "yunyang"+password;
        //使用指定的字节数组对摘要进行最后更新，然后完成摘要计算
        byte[] results=md5.digest(salt.getBytes());
        String resultString = byteArrayToHexString(results);
        String pwd =  resultString.toUpperCase();
        return pwd;
    }

    //将得到的字节数组变成字符串返回
    private static String byteArrayToHexString(byte[] b){
        StringBuffer resultSb = new StringBuffer();
        for (int i = 0; i < b.length; i++){
            resultSb.append(byteToHexString(b[i]));
        }
        return resultSb.toString();
    }

    /** 将一个字节转化成十六进制形式的字符串 */
    private static String byteToHexString(byte b){
      String[] hexDigits = {"0", "1", "2", "3", "4","5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};
        int n = b;
        if (n < 0)
            n = 256 + n;
        int d1 = n / 16;
        int d2 = n % 16;
        return hexDigits[d1] + hexDigits[d2];
    }

}
