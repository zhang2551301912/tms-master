package com.service.impl;

import com.mapper.LoginMapper;
import com.po.Menu;
import com.po.MenuRole;
import com.po.User;
import com.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    LoginMapper loginMapper;

    //验证登录
    @Override
    public Boolean Login(User user) {
        User u=loginMapper.getUserByIdAndRole(user);
        if(u!=null){
            return true;
        }else {
            return false;
        }
    }

    //查询用户
    @Override
    public User getUserByIdAndRole(User user) {
        return loginMapper.getUserByIdAndRole(user);
    }

    //获取管理员菜单
    @Override
    public List<MenuRole> getAdminByMenuAndRole() {
        return loginMapper.getAdminByMenuAndRole();
    }

    //获教师菜单
    @Override
    public List<MenuRole> getTeacherByMenuAndRole() {
        return loginMapper.getTeacherByMenuAndRole();
    }

    //获家长菜单
    @Override
    public List<MenuRole> getParentByMenuAndRole() {
        return loginMapper.getParentByMenuAndRole();
    }

    //根据父级ID获取子菜单
    @Override
    public List<Menu> getMenuByPid(Integer p_id) {
        return loginMapper.getMenuByPid(p_id);
    }

}
