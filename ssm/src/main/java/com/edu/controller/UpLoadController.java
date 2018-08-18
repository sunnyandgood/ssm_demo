package com.edu.controller;

import com.edu.util.R;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class UpLoadController {
    @ResponseBody
    @RequestMapping("/upload")
    public R upload(MultipartFile file, HttpServletRequest request){
        //得到上传路径的硬盘路径
        String realPath = request.getServletContext().getRealPath("/resources/upload");

        //得到文件扩展名
        String oldFilename = file.getOriginalFilename();
        String ext = oldFilename.substring(oldFilename.indexOf("."));

        //新文件名
        String newFileName = UUID.randomUUID() + ext;

        System.out.println(newFileName);
        File file1 = new File(realPath,newFileName);
        try {
            //存文件
            file.transferTo(file1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return R.ok().put("path","/resources/upload/" + newFileName);
    }
//    @RequestMapping("/upload")
//    public String upload(MultipartFile file){
//        System.out.println(file.getOriginalFilename());
//        return "redirect:/hello.jsp";
//    }

//    @RequestMapping("/upload")
//    public String upload(MultipartFile file, HttpServletRequest request){
////        System.out.println(request.getServletContext().getRealPath("/"));
//        String realPath = request.getServletContext().getRealPath("/resources/upload");
//        File file1 = new File(realPath,file.getOriginalFilename());
//        try {
//            file.transferTo(file1);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return "redirect:/hello.jsp";
//    }

//    @RequestMapping("/upload")
//    public String upload(MultipartFile file, HttpServletRequest request){
//        //得到上传路径的硬盘路径
//        String realPath = request.getServletContext().getRealPath("/resources/upload");
//
//        //得到文件扩展名
//        String oldFilename = file.getOriginalFilename();
//        String ext = oldFilename.substring(oldFilename.indexOf("."));
//
//        //新文件名
//        String newFileName = UUID.randomUUID() + ext;
//
//        System.out.println(newFileName);
//        File file1 = new File(realPath,newFileName);
//        try {
//            //存文件
//            file.transferTo(file1);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return "redirect:/hello.jsp";
//    }
}
