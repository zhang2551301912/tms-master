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
    int deleteUser(Integer id);
    //重置密码
    Integer updatePwd(Integer id);
    //查询父级菜单
    List<Menu> getMenusParent();
    //添加菜单
    int addMenuSubmit(Menu menu);
    //删除菜单
    int deleteMenu(Integer menu_id);
    //更新菜单
    int updateMenu(Menu menu);

    //关联新增角色菜单
    int addRoleMenu(MenuRole mr);
    //删除角色菜单
    int deleteRoleMenu(Integer mr_id);

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
    int deleteCourse(Integer id);
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
    //查询出勤
    List<Attendance> getAttendance();
    //添加出勤
    int addAttendance(Attendance attendance);
    //删除出勤
    int deleteAttendance(Integer atten_id);
    //更新出勤
    int updateAttendance(Attendance attendance);
    //查询出勤明细
    List<AttendanceDetail> getAttendanceDetail();
    //添加出勤明细
    int addAttendanceDetail(AttendanceDetail attendanceDetail);
    //删除出勤明细
    int deleteAttendanceDetail(Integer detail_id);
    //查询班级学生
    List<User> getClassStudent();
    //编辑状态
    int updateStatus(User user);
    //查询班级
    List<Cla> getCla();
    //添加学生
    int addStudent(User user);
    //删除学生班级
    int deleteStudentClass(Integer id);
    //修改学生信息
    int updateStudentClass(User user);
    //查询ID
    User getUserId(Integer user_id);
    //关联新增教师课程
    int addCourseTeacher(CourseUser courseUser);
    //查询课程及教师
    List<CourseUser> getCourseTeacher();
    //删除教师课程
    int deleteCourseTea(Integer cu_id);
    //获取课程ID
    Course getCourseID(Integer course_id);
    //查看留言
    List<Message> getMsg();
    //添加留言
    int addMsg(Message message);
    //删除留言
    int deleteMsg(Integer msg_id);
    //查询课表
    List<CourseTable> getCourseTable();
    //添加课表
    int addCourseTable(CourseTable courseTable);
    //删除课表
    int deleteCourseTable(Integer id);
    //查询星期
    List<Week> getWeek();
    //查询节次
    List<Jieci> getJie();
    //查询教室
    List<Address> getAddress();
    //修改课表
    int updateCourseTable(CourseTable courseTable);
}
