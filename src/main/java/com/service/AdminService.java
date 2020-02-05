package com.service;

import com.po.Menu;
import com.po.MenuRole;
import com.po.Role;
import com.po.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AdminService {
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
    //查询父级菜单
    List<Menu> getMenusParent();
    //添加菜单
    int addMenuSubmit(Menu menu);
    //删除菜单
    int deleteMenu(Integer menu_id);
    //更新菜单
    int updateMenu(Menu menu);
    //查询二级菜单
    List<Menu> getSonMenu();
    //关联新增角色菜单
    int addRoleMenu(MenuRole mr);
    //删除角色菜单
    int deleteRoleMenu(Integer mr_id);
    //查询角色菜单
    List<MenuRole> getRoleMenu();
    //添加角色
    int addRoleSubmit(Role role);
    //删除角色
    int deleteRole(Integer role_id);
    //更新角色
    int updateRole(Role role);
}
