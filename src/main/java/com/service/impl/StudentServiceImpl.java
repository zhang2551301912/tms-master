package com.service.impl;

import com.mapper.StudentMapper;
import com.po.StudentCourse;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentMapper studentMapper;

    @Override
    public int addStudentCourse(StudentCourse studentCourse) {
        return studentMapper.addStudentCourse(studentCourse);
    }

    @Override
    public List<StudentCourse> getStudentCourseByStatus() {
        return studentMapper.getStudentCourseByStatus();
    }

    @Override
    public StudentCourse getStudentCourse(Integer course_id, Integer teacher_id, Integer student_id) {
        return studentMapper.getStudentCourse(course_id,teacher_id,student_id);
    }
}
