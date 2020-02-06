package com.service;

import com.po.*;
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
    //查询课程
    List<Course> getCourse();
    //添加课程
    int addCourse(Course course);
    //删除课程
    int deleteCourse(Integer course_id);
    //更新课程
    int updateCourse(Course course);
    //查询绩效
    List<Achievement> getAchievement();
    //添加绩效
    int addAchievement(Achievement achievement);
    //删除绩效
    int deleteAchievement(Integer achi_id);
    //更新绩效
    int updateAchievement(Achievement achievement);

}
