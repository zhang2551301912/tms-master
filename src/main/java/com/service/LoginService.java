package com.service;

import com.po.Menu;
import com.po.MenuRole;
import com.po.User;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface LoginService {
    //获取用户信息
    User getUserByIdAndRole(User user);

    //用户登录
    Boolean Login(User user);

    //获取管理员菜单
    List<MenuRole> getAdminByMenuAndRole();

    //获取教师菜单
    List<MenuRole> getTeacherByMenuAndRole();

    //获取家长菜单
    List<MenuRole> getParentByMenuAndRole();

    //根据父级ID获取子菜单
    List<Menu> getMenuByPid(Integer p_id);
}
