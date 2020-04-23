package com.service;

import com.po.StudentCourse;

import java.util.List;

public interface StudentService {
    //选课报名
    int addStudentCourse(StudentCourse studentCourse);
    //根据学生状态获取报名记录
    List<StudentCourse> getStudentCourseByStatus();
    //报名查重
    StudentCourse getStudentCourse(Integer course_id,Integer teacher_id,Integer student_id);

    //根据学生账号获取报名记录
    List<StudentCourse> getStudentCourseByStudentId(Integer userId);
}
