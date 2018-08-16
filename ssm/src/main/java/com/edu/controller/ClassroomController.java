package com.edu.controller;


import com.edu.bean.Classroom;
import com.edu.service.ClassroomService;
import com.edu.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * InnoDB free: 4096 kB 前端控制器
 * </p>
 *
 * @author sunny
 * @since 2018-08-16
 */
@RestController
@RequestMapping("/classroom")
public class ClassroomController {
    @Autowired
    private ClassroomService classroomService;

    @GetMapping("/list")
    public R list(){
        List<Classroom> classroomList = classroomService.selectList(null);
        return R.ok().put("classrooms",classroomList);
    }
}

