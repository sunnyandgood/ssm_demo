package com.edu;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.edu.bean.User;
import com.edu.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@ContextConfiguration("classpath:spring.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestMybatisPlus {

    @Autowired
    private UserService userService;

    @Test
    public void testSelectById(){
        User user = userService.selectById(10);
        System.out.println(user);

    }

    @Test
    public void testInsert(){
        User user = new User();
//        user.setId(1);
        user.setUserName("小黄");
        user.setGender("2");
        user.setEmail("h78656@qq.com");
        boolean insert = userService.insert(user);
        System.out.println(insert);
    }

    @Test
    public void testDelete(){
        boolean deleteById = userService.deleteById(81);
        System.out.println(deleteById);
    }

    @Test
    public void testUpdate(){
        User user = new User();
        user.setId(80);
        user.setUserName("小黄");
        boolean updateById = userService.updateById(user);
        System.out.println(updateById);
    }

    @Test
    public void testSelectList(){
        List<User> userList = userService.selectList(null);
        System.out.println(userList);
    }

    @Test
    public void testSelectByMap(){
        Map<String,Object> map = new HashMap<>();
        map.put("user_name","小黄");
        List<User> userList = userService.selectByMap(map);
        System.out.println(userList);

    }

    @Test
    public void testSelectOne(){
        User user1 = userService.selectOne(new EntityWrapper<User>()
                        .eq("id", 80));
        User user2 = userService.selectOne(new EntityWrapper<User>()
                .eq("id", 80)
                .eq("user_name","小黄"));
        System.out.println(user1);
        System.out.println(user2);
    }

    @Test
    public void testSelectList1(){
        List<User> list = userService.selectList(new EntityWrapper<User>()
                .between("id", 30, 40)
                .eq("gender", 1)
                .orNew()
                .like("email", "aaa")
                .orderDesc(Arrays.asList(new String[]{"id"})));
        System.out.println(list);
    }
}
