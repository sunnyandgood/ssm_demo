package com.edu.service;

import com.baomidou.mybatisplus.service.IService;
import com.edu.bean.User;

import java.util.List;

/**
 * <p>
 * InnoDB free: 4096 kB 服务类
 * </p>
 *
 * @author sunny
 * @since 2018-08-16
 */
public interface UserService extends IService<User> {
    List<User> selectUserClassroom();
}
