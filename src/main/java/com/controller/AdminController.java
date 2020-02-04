package com.controller;

import com.po.*;
import com.service.AdminService;
import com.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    LoginService loginService;

    @Autowired
    AdminService adminService;

    //欢迎页面
    @RequestMapping("welcome")
    public ModelAndView welcome() {
        ModelAndView mv=new ModelAndView("welcome");
        return mv;
    }
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
    //查看教师
    @RequestMapping(value = "lookTeacher")
    public ModelAndView lookTeacher() {
        List<User> teachers=adminService.getTeacher();
        ModelAndView mv=new ModelAndView("admin/lookTeacher");
        mv.addObject("teachers", teachers);
        return mv;
    }
    //查看家长
    @RequestMapping("lookParent")
    public ModelAndView lookParent() {
        List<User> parents=adminService.getParent();
        ModelAndView mv=new ModelAndView("admin/lookParent");
        mv.addObject("parents", parents);
        return mv;
    }
    //查看学生
    @RequestMapping("lookStudent")
    public ModelAndView lookStudent() {
        List<User> students=adminService.getStudent();
        ModelAndView mv=new ModelAndView("admin/lookStudent");
        mv.addObject("students", students);
        return mv;
    }
    //添加用户页面
    @RequestMapping("addUser")
    public ModelAndView addUser() {
        List<Role> roles=adminService.getRole();
        ModelAndView mv=new ModelAndView("admin/addUser");
        mv.addObject("roles",roles);
        return mv;
    }
    //添加用户
    @RequestMapping("addUserSubmit")
    @ResponseBody
    public ResultMsg addUserSubmit(Integer user_id, String name,String pwd,String phone_no,Integer role_id) {
        User u=new User();
        u.setUser_id(user_id);
        u.setName(name);
        u.setPwd(pwd);
        u.setPhone_no(phone_no);
        u.setRole_id(role_id);
        int i=adminService.addUserSubmit(u);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //更新教师页面
    @RequestMapping("/updateTeacher")
    public ModelAndView updateTeacher() {
        List<User> users=adminService.getTeacher();
        User user=null;
        for(User u:users){
                user=u;
        }
        ModelAndView mv=new ModelAndView("admin/updateTeacher");
        mv.addObject("user",user);
        return mv;
    }
    //更新家长页面
    @RequestMapping("/updateParent")
    public ModelAndView updateParent() {
        List<User> users=adminService.getParent();
        User user=null;
        for(User u:users){
            user=u;
        }
        ModelAndView mv=new ModelAndView("admin/updateParent");
        mv.addObject("user",user);
        return mv;
    }
    //更新学生页面
    @RequestMapping("/updateStudent")
    public ModelAndView updateStudent() {
        List<User> users=adminService.getStudent();
        User user=null;
        for(User u:users){
            user=u;
        }
        ModelAndView mv=new ModelAndView("admin/updateStudent");
        mv.addObject("user",user);
        return mv;
    }
    //更新用户
    @RequestMapping(value="updateUserSubmit",method= RequestMethod.POST)
    @ResponseBody
    public ResultMsg updateUserSubmit(Integer user_id,String pwd,String phone_no,Integer role_id){
        User u=new User();
        u.setUser_id(user_id);
        u.setPwd(pwd);
        u.setPhone_no(phone_no);
        u.setRole_id(role_id);
        System.out.println(pwd+" "+phone_no+" "+role_id);
        int i=adminService.updateUser(u);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除用户
    @RequestMapping(value = "deleteUser",method=RequestMethod.POST)
    @ResponseBody
    public ResultMsg deleteUser(Integer user_id) {
        int i=adminService.deleteUser(user_id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除用户
    @RequestMapping(value = "batchDeleteUser",method=RequestMethod.POST)
    @ResponseBody
    public ResultMsg batchDeleteUser(Integer[] user_ids) {
        boolean isDelete=false;
        for(int user_id:user_ids) {
            int i=adminService.deleteUser(user_id);
            if(i>0) {
                isDelete=true;
            }else {
                isDelete=false;
            }
        }
        ResultMsg rs=null;
        if(isDelete) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //重置密码
    @RequestMapping(value="updatePwd")
    @ResponseBody
    public ResultMsg updatePwd(Integer user_id){
        System.out.println(user_id);
        ResultMsg rs=null;
        Integer i=adminService.updatePwd(user_id);
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "重置成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "重置失败");
        }
        return rs;
    }
}
