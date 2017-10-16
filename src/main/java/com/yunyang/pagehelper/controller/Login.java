package com.yunyang.pagehelper.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yunyang.pagehelper.bean.User;

import com.yunyang.pagehelper.service.impl.UserServiceImpl;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Description:
 *
 * @param
 * @version 1.0  2017/9/10 15:30  by  李娜（lina@cloud-young.com）创建
 * @return
 */

@Controller
public class Login {
    public static Logger logger = LogManager.getLogger(Login.class);

    @Autowired
    UserServiceImpl userService;

    @RequestMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request, @RequestParam(required = true, defaultValue = "1") Integer pageNum, @RequestParam(required = false, defaultValue = "3") Integer pageSize) throws Exception {
        ModelAndView mv = new ModelAndView();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        PageHelper.startPage(pageNum, pageSize);
        String pwdMd5 = userService.turnToMd5(password);
        User user = userService.getUserByName(username, pwdMd5.toString());
        if (user == null) {
            mv.setViewName("error");
            return mv;
        }


        List<User> userList = userService.getUserInfo(pageNum, pageSize, "");

        PageInfo<User> page = new PageInfo<User>(userList);
        mv.addObject("page", page);
        mv.setViewName("userInfo");
        mv.addObject("userList", userList);
        logger.info(username + "登陆了");
        return mv;
    }

    @RequestMapping("getUserPage")
    public ModelAndView getUserList(HttpServletRequest request, @RequestParam(required = true, defaultValue = "1") Integer pageNum, @RequestParam(required = false, defaultValue = "3") Integer pageSize) {
        logger.info( "查询开始了");
        ModelAndView mv = new ModelAndView("userInfo");
        String username = request.getParameter("username");
        PageHelper.startPage(pageNum, pageSize);
        List<User> userList = userService.getUserInfo(pageNum, pageSize, username);
        PageInfo<User> page = new PageInfo<User>(userList);
        mv.addObject("page", page);
        mv.addObject("userList", userList);
        return mv;
    }
}
