package com.controller;

import com.po.Menu;
import com.po.MenuRole;
import com.service.AdminService;
import com.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    LoginService loginService;

    @Autowired
    AdminService adminService;
    //菜单主页
    @RequestMapping("index")
    public ModelAndView index(){
        List<MenuRole> menuRole=loginService.getAdminByMenuAndRole();
        ModelAndView mv=new ModelAndView("index");
        List<Menu> menu=adminService.getMenu();
        mv.addObject("menuRole",menuRole);
        mv.addObject("menu",menu);
        System.out.println(mv);
        return mv;
    }
}
