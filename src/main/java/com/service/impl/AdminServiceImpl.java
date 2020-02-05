package com.service.impl;

import com.mapper.AdminMapper;
import com.po.Menu;
import com.po.MenuRole;
import com.po.Role;
import com.po.User;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;
    //查询所有菜单
    @Override
    public List<Menu> getMenu() {
        return adminMapper.getMenu();
    }
    //查看教师
    @Override
    public List<User> getTeacher() {
        return adminMapper.getTeacher();
    }
    //查看家长
    @Override
    public List<User> getParent() {
        return adminMapper.getParent();
    }
    //查看学生
    @Override
    public List<User> getStudent() {
        return adminMapper.getStudent();
    }
    //查看所有角色
    @Override
    public List<Role> getRole() {
        return adminMapper.getRole();
    }
    //添加用户
    @Override
    public int addUserSubmit(User user) {
        return adminMapper.addUserSubmit(user);
    }
    //修改用户
    @Override
    public int updateUser(User user) {
        return adminMapper.updateUser(user);
    }
    //查询用户
    @Override
    public List<User> getUser() {
        return adminMapper.getUser();
    }
    //删除用户
    @Override
    public int deleteUser(Integer user_id) {
        return adminMapper.deleteUser(user_id);
    }
    //重置密码
    @Override
    public Integer updatePwd(Integer user_id) {
        return adminMapper.updatePwd(user_id);
    }
    //查询父级菜单
    @Override
    public List<Menu> getMenusParent() {
        return adminMapper.getMenusParent();
    }
    //添加菜单
    @Override
    public int addMenuSubmit(Menu menu) {
        return adminMapper.addMenuSubmit(menu);
    }
    //删除菜单
    @Override
    public int deleteMenu(Integer menu_id) {
        return adminMapper.deleteMenu(menu_id);
    }
    //更新菜单
    @Override
    public int updateMenu(Menu menu) {
        return adminMapper.updateMenu(menu);
    }
    //查询二级菜单
    @Override
    public List<Menu> getSonMenu() {
        return adminMapper.getSonMenu();
    }
    //关联新增角色菜单
    @Override
    public int addRoleMenu(MenuRole mr) {
        return adminMapper.addRoleMenu(mr);
    }
    //删除角色菜单
    @Override
    public int deleteRoleMenu(Integer mr_id) {
        return adminMapper.deleteRoleMenu(mr_id);
    }
    //查询角色菜单
    @Override
    public List<MenuRole> getRoleMenu() {
        return adminMapper.getRoleMenu();
    }
    //添加角色
    @Override
    public int addRoleSubmit(Role role) {
        return adminMapper.addRoleSubmit(role);
    }
    //删除角色
    @Override
    public int deleteRole(Integer role_id) {
        return adminMapper.deleteRole(role_id);
    }
    //更新角色
    @Override
    public int updateRole(Role role) {
        return adminMapper.updateRole(role);
    }
}
