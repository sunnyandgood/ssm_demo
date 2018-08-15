package com.edu.service.impl;

import com.edu.bean.User;
import com.edu.mapper.UserMapper;
import com.edu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> selectAll() {
        List<User> userList = userMapper.selectByExample(null);
        return userList;
    }

    @Override
    public int deleteById(Integer id) {
        int delete = userMapper.deleteByPrimaryKey(id);
        return delete;
    }

    @Override
    public User selectById(Integer id) {
        User user = userMapper.selectByPrimaryKey(id);
        return user;
    }

    @Override
    public int update(User user) {
        int update = userMapper.updateByPrimaryKeySelective(user);
        return update;
    }
}
