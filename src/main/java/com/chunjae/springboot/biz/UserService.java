package com.chunjae.springboot.biz;

import com.chunjae.springboot.entity.User;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

public interface UserService {
    public List<User> getUserList();
    public User getUser(String name);
    public int getWithdraw(Integer id);
    public int getActivate(String name);
    public int getDormant(String name);
    public User getByEmail(String email);
    public User getByName(String name);
    public User findById(String email, String tel);
    public User findByPw(String email, String tel, String name);
    public int userJoin(User user);
    public int updateUser(User user);
    public int updateLevel(String name, String lev);
    public int removeUser(String name);
    public PasswordEncoder passwordEncoder();
    public User getUserById(Integer id);
    public int updatePasswordNoChange(User user);
}
