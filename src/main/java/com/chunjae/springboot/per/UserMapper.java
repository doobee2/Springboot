package com.chunjae.springboot.per;

import com.chunjae.springboot.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    List<User> getUserList();
    User getUser(String name);
    int getWithdraw(Integer id);
    int getActivate(String name);
    int getDormant(String name);
    User getByEmail(String email);
    User getByName(String name);
    User findById(String email, String tel);
    User findByPw(String email, String tel, String name);
    int userJoin(User user);
    int updateUser(User user);
    int updateLevel(String name, String lev);
    int removeUser(String name);
    User getUserById(Integer id);
    int updatePasswordNoChange(User user);
}