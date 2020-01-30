package com.mapper;


import com.po.Menu;
import com.po.MenuRole;
import com.po.User;

import java.util.List;


public interface LoginMapper {
    //获取用户信息
    User getUserByIdAndRole(User user);

    //获取管理员菜单
    List<MenuRole> getAdminByMenuAndRole();

    //获取教师菜单
    List<MenuRole> getTeacherByMenuAndRole();

    //获取家长菜单
    List<MenuRole> getParentByMenuAndRole();

    //根据父级ID获取子菜单
    List<Menu> getMenuByPid(Integer pId);
}