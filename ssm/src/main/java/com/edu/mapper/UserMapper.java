package com.edu.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.edu.bean.User;

import java.util.List;

/**
 * <p>
 * InnoDB free: 4096 kB Mapper 接口
 * </p>
 *
 * @author sunny
 * @since 2018-08-16
 */
public interface UserMapper extends BaseMapper<User> {
    List<User> selectUserClassroom();
}
