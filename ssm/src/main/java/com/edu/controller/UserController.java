package com.edu.controller;

import com.edu.bean.User;
import com.edu.service.UserService;
import com.edu.util.R;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

//@Controller
@RestController//@RestController可替代@Controller和@ResponseBody的作用
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

//    @GetMapping("/selectAll")
////    @ResponseBody
//    public List<User> selectAll(){
//        List<User> userList = userService.selectAll();
//        return userList;
//    }

//    @GetMapping("/list")
//    public Map list(Integer pageNumber,Integer pageSize){
//        PageHelper.startPage(pageNumber,pageSize);
//        List<User> users = userService.selectAll();
//        Map map = new HashMap<>();
//        map.put("total",((Page)users).getTotal());
//        map.put("rows",users);
//        return map;
//    }

    @GetMapping("/list")
    public R list(Integer pageNumber, Integer pageSize){
        PageHelper.startPage(pageNumber,pageSize);
        List<User> users = userService.selectList(null);
        return R.ok().put("total",((Page)users).getTotal()).put("rows",users);
    }

    @PostMapping("/delete/{id}")
    public R delete(@PathVariable("id") Integer id){
        boolean delete = userService.deleteById(id);
        if(delete){
            //删除成功
            return R.ok("删除成功！");
        }else {
            //删除失败
            return R.error("删除失败！");
        }
    }

    @GetMapping("/{id}")
    public R get(@PathVariable("id") Integer id){
        User user = userService.selectById(id);
        return R.ok().put("user",user);
    }

    @PostMapping("/update")
    public R update(User user){
        boolean update = userService.updateById(user);
        if (update){
            return R.ok("修改成功");
        }else {
            return R.error("修改失败");
        }
    }

    @GetMapping("/listAll")
    public R list2(Integer pageNumber,Integer pageSize){
        PageHelper.startPage(pageNumber,pageSize);
        List<User> userList = userService.selectUserClassroom();
        return R.ok().put("total" , ((Page)userList).getTotal()).put("rows",userList);
    }

    @PostMapping("/removeAll")
    public R removeAll(String ids){
        String[] strings = ids.split(",");
        System.out.println(strings);
        boolean deleteBatchIds = userService.deleteBatchIds(Arrays.asList(strings));
        if(deleteBatchIds){
            return R.ok("删除成功！");
        }else {
            return R.error("删除失败！");
        }
    }

    @PostMapping("/insert")
    public R insert(User user){
        boolean insert = userService.insert(user);
        if(insert){
            return R.ok("添加成功！");
        }else {
            return R.error("添加失败！");
        }
    }


}
