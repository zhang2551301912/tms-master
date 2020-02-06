package com.service.impl;

import com.mapper.AdminMapper;
import com.po.*;
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
    //查询课程
    @Override
    public List<Course> getCourse() {
        return adminMapper.getCourse();
    }
    //添加课程
    @Override
    public int addCourse(Course course) {
        return adminMapper.addCourse(course);
    }
    //删除课程
    @Override
    public int deleteCourse(Integer course_id) {
        return adminMapper.deleteCourse(course_id);
    }
    //更新课程
    @Override
    public int updateCourse(Course course) {
        return adminMapper.updateCourse(course);
    }
    //查询绩效
    @Override
    public List<Achievement> getAchievement() {
        return adminMapper.getAchievement();
    }
    //添加绩效
    @Override
    public int addAchievement(Achievement achievement) {
        return adminMapper.addAchievement(achievement);
    }
    //删除绩效
    @Override
    public int deleteAchievement(Integer achi_id) {
        return adminMapper.deleteAchievement(achi_id);
    }
    //更新绩效
    @Override
    public int updateAchievement(Achievement achievement) {
        return adminMapper.updateAchievement(achievement);
    }

}
