package com.edu.service;

import com.edu.bean.User;

import java.util.List;

public interface UserService {
    List<User> selectAll();
    int deleteById(Integer id);
    User selectById(Integer id);
    int update(User user);
}
