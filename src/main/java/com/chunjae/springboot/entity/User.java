package com.chunjae.springboot.entity;

import lombok.Data;

@Data
public class User {
    private Integer id;
    private String name;
    private String password;
    private String username;
    private String email;
    private String address;
    private String tel;
    private String regdate;
    private String lev;
    private String act;
}
