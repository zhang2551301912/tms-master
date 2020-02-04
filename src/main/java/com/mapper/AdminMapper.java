package com.mapper;

import com.po.Menu;
import com.po.Role;
import com.po.User;

import java.util.List;

public interface AdminMapper {
    //查询所有菜单
    List<Menu> getMenu();
    //查看教师
    List<User> getTeacher();
    //查看家长
    List<User> getParent();
    //查看学生
    List<User> getStudent();
    //查看所有角色
    List<Role> getRole();
    //添加用户
    int addUserSubmit(User user);
    //修改用户
    int updateUser(User user);
    //查询用户
    List<User> getUser();
    //删除用户
    int deleteUser(Integer user_id);
    //重置密码
    Integer updatePwd(Integer user_id);
}