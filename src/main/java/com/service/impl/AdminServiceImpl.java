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
    public int deleteUser(Integer id) {
        return adminMapper.deleteUser(id);
    }
    //重置密码
    @Override
    public Integer updatePwd(Integer id) {
        return adminMapper.updatePwd(id);
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
    public int deleteCourse(Integer id) {
        return adminMapper.deleteCourse(id);
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
    //查询出勤
    @Override
    public List<Attendance> getAttendance() {
        return adminMapper.getAttendance();
    }
    //添加出勤
    @Override
    public int addAttendance(Attendance attendance) {
        return adminMapper.addAttendance(attendance);
    }
    //删除出勤
    @Override
    public int deleteAttendance(Integer atten_id) {
        return adminMapper.deleteAttendance(atten_id);
    }
    //更新出勤
    @Override
    public int updateAttendance(Attendance attendance) {
        return adminMapper.updateAttendance(attendance);
    }
    //查询出勤明细
    @Override
    public List<AttendanceDetail> getAttendanceDetail() {
        return adminMapper.getAttendanceDetail();
    }
    //添加出勤明细
    @Override
    public int addAttendanceDetail(AttendanceDetail attendanceDetail) {
        return adminMapper.addAttendanceDetail(attendanceDetail);
    }
    //删除出勤明细
    @Override
    public int deleteAttendanceDetail(Integer detail_id) {
        return adminMapper.deleteAttendanceDetail(detail_id);
    }
    //查询班级学生
    @Override
    public List<User> getClassStudent() {
        return adminMapper.getClassStudent();
    }
    //编辑状态
    @Override
    public int updateStatus(User user) {
        return adminMapper.updateStatus(user);
    }
    //查询班级
    @Override
    public List<Cla> getCla() {
        return adminMapper.getCla();
    }
    //添加学生
    @Override
    public int addStudent(User user) {
        return adminMapper.addStudent(user);
    }
    //删除学生班级
    @Override
    public int deleteStudentClass(Integer id) {
        return adminMapper.deleteStudentClass(id);
    }
    //修改学生信息
    @Override
    public int updateStudentClass(User user) {
        return adminMapper.updateStudentClass(user);
    }
    //查询ID
    @Override
    public User getUserId(Integer user_id) {
        return adminMapper.getUserId(user_id);
    }
    //关联新增教师课程
    @Override
    public int addCourseTeacher(CourseUser courseUser) {
        return adminMapper.addCourseTeacher(courseUser);
    }
    //查询课程及教师
    @Override
    public List<CourseUser> getCourseTeacher() {
        return adminMapper.getCourseTeacher();
    }
    //删除教师课程
    @Override
    public int deleteCourseTea(Integer cu_id) {
        return adminMapper.deleteCourseTea(cu_id);
    }
    //获取课程ID
    @Override
    public Course getCourseID(Integer course_id) {
        return adminMapper.getCourseID(course_id);
    }
    //查看留言
    @Override
    public List<Message> getMsg() {
        return adminMapper.getMsg();
    }
    //添加留言
    @Override
    public int addMsg(Message message) {
        return adminMapper.addMsg(message);
    }
    //删除留言
    @Override
    public int deleteMsg(Integer msg_id) {
        return adminMapper.deleteMsg(msg_id);
    }
    //查询课表
    @Override
    public List<CourseTable> getCourseTable() {
        return adminMapper.getCourseTable();
    }
    //添加课表
    @Override
    public int addCourseTable(CourseTable courseTable) {
        return adminMapper.addCourseTable(courseTable);
    }
    //删除课表
    @Override
    public int deleteCourseTable(Integer id) {
        return adminMapper.deleteCourseTable(id);
    }
    //查询星期
    @Override
    public List<Week> getWeek() {
        return adminMapper.getWeek();
    }
    //查询节次
    @Override
    public List<Jieci> getJie() {
        return adminMapper.getJie();
    }
    //查询教室
    @Override
    public List<Address> getAddress() {
        return adminMapper.getAddress();
    }
    //修改课表
    @Override
    public int updateCourseTable(CourseTable courseTable) {
        return adminMapper.updateCourseTable(courseTable);
    }

}
