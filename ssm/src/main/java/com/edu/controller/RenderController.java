package com.edu.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RenderController {

    @GetMapping("/users")
    public String student(){
        return "user/list";
    }

    @GetMapping("/user/preUpdate/{id}")
    public String preUpdate(){
        return "user/pre";
    }

    @GetMapping("/user/add")
    public String add(){
        return "user/user_add";
    }
}
