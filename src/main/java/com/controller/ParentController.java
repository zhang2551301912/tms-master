package com.controller;

import com.po.*;
import com.service.AdminService;
import com.service.LoginService;
import com.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("parent")
public class ParentController {
    @Autowired
    LoginService loginService;

    @Autowired
    AdminService adminService;

    @Autowired
    TeacherService teacherService;

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
    public ModelAndView LookMessage(HttpServletRequest request){
        HttpSession session=request.getSession();
        User u=(User) session.getAttribute("user");
        Integer currentUerId=u.getUser_id();
        List<ReplyMsg> messages=teacherService.getReplyMsgByMsgId(currentUerId);
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

    //添加留言
    @RequestMapping("addMsgSubmit")
    @ResponseBody
    public ResultMsg addMsgSubmit(Integer msg_id,String msg_content,HttpServletRequest request,Integer teacher_id) {
        HttpSession session=request.getSession();
        User u=(User) session.getAttribute("user");
        Integer currentUerId=u.getUser_id();
        Message m=new Message();
        m.setMsg_id(msg_id);
        m.setMsg_content(msg_content);
        m.setParent_id(currentUerId);
        m.setTeacher_id(teacher_id);
        int i=adminService.addMsg(m);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }

}
