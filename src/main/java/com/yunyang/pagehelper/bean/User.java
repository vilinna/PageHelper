package com.yunyang.pagehelper.bean;

import org.springframework.context.annotation.Bean;

/**
 * 用户信息
 **/
public class User {
    /*id*/
    String id;
    /*账户*/
    String account;
    /*密码*/
    String password;
    /*用户名*/
    String username;
    /*状态*/
    String status;
    /*创建时间*/
    String created;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }
}
