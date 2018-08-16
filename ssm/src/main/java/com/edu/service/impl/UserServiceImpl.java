package com.edu.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.edu.bean.User;
import com.edu.mapper.UserMapper;
import com.edu.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * InnoDB free: 4096 kB 服务实现类
 * </p>
 *
 * @author sunny
 * @since 2018-08-16
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Override
    public List<User> selectUserClassroom() {
        List<User> userList = baseMapper.selectUserClassroom();
        return userList;
    }
}
