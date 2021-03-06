package com.controller;

import com.po.Flag;
import com.po.ResultMsg;
import com.po.User;
import com.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    LoginService loginService;

    //登录页面
    @RequestMapping("login")
    public ModelAndView login() {
        ModelAndView mv=new ModelAndView("login");
        return mv;
    }

    //登录验证
    @RequestMapping(value = "loginSubmit",method = RequestMethod.GET)
    @ResponseBody
    public ResultMsg LoginSubmit(Integer userId,String pwd,Integer role, HttpSession session){
        System.out.println(userId+" "+pwd+" "+role);
        User user=new User();
        user.setUserId(userId);
        user.setPwd(pwd);
        user.setRoleId(role);
        ResultMsg rs=null;
        boolean isLogin=loginService.Login(user);//是否登录成功验证
        if(isLogin){
            User u=loginService.getUserByIdAndRole(user);
            session.setAttribute("user",u);
            rs=new ResultMsg(Flag.SUCCESS,"登录成功");
        }else {
            rs=new ResultMsg(Flag.FAIL,"登录失败");
        }
//        System.out.println(rs);
        return rs;
    }
}
