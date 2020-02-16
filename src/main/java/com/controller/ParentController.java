package com.controller;

import com.po.*;
import com.service.AdminService;
import com.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("parent")
public class ParentController {
    @Autowired
    LoginService loginService;

    @Autowired
    AdminService adminService;
    //菜单主页
    @RequestMapping("index")
    public ModelAndView index(){
        List<MenuRole> menuRole=loginService.getParentByMenuAndRole();
        ModelAndView mv=new ModelAndView("index");
        List<Menu> menu=adminService.getMenu();
        mv.addObject("menuRole",menuRole);
        mv.addObject("menu",menu);
        return mv;
    }
    //欢迎页面
    @RequestMapping("welcome")
    public ModelAndView welcome() {
        ModelAndView mv=new ModelAndView("welcome");
        return mv;
    }
    //查看留言
    @RequestMapping("lookMessage3")
    public ModelAndView LookMessage(){
        List<Message> messages=adminService.getMsg();
        ModelAndView mv=new ModelAndView("parent/lookMessage3");
        mv.addObject("message",messages);
        return mv;
    }
    //添加留言页面
    @RequestMapping("/addMsg2")
    public ModelAndView addMsg() {
        List<User> parent=adminService.getParent();
        List<User> teacher=adminService.getTeacher();
        ModelAndView mv=new ModelAndView("parent/addMsg2");
        mv.addObject("parent",parent);
        mv.addObject("teacher",teacher);
        return mv;
    }

}
