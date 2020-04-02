package com.controller;

import com.po.*;
import com.service.AdminService;
import com.service.LoginService;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    LoginService loginService;

    @Autowired
    AdminService adminService;

    @Autowired
    StudentService studentService;

    //菜单主页
    @RequestMapping("/index")
    public ModelAndView index(){
        List<MenuRole> menuRole=loginService.getStudentByMenuAndRole();
        ModelAndView mv=new ModelAndView("index");
        List<Menu> menu=adminService.getMenu();
        mv.addObject("menuRole",menuRole);
        mv.addObject("menu",menu);
        return mv;
    }
    //欢迎页面
    @RequestMapping("/welcome")
    public ModelAndView welcome() {
        ModelAndView mv=new ModelAndView("welcome");
        return mv;
    }

    //选择课程教师页面
    @RequestMapping("chooseCourseAndTeacher")
    public ModelAndView chooseCourseAndTeacher(){
        List<StudentCourse> studentCourse=studentService.getStudentCourseByStatus();
        ModelAndView mv=new ModelAndView("student/chooseCourseAndTeacher");
        mv.addObject("studentCourse",studentCourse);
        return mv;
    }

    //选课报名页面
    @RequestMapping("/addStudentCourse")
    public ModelAndView addStudentCourse() {
        ModelAndView mv=new ModelAndView("student/addStudentCourse");
        List<User> teacher=adminService.getTeacher();
        List<Course> course=adminService.getCourse();
        mv.addObject("teacher",teacher);
        mv.addObject("course",course);
        return mv;
    }

    //选课报名
    @RequestMapping("/addStudentCourseSubmit")
    @ResponseBody
    public ResultMsg addCourseSubmit(Integer course_id,Integer teacher_id,Integer student_id) {
        StudentCourse studentCourse=new StudentCourse();
        studentCourse.setCourse_id(course_id);
        studentCourse.setTeacher_id(teacher_id);
        studentCourse.setStudent_id(student_id);
        int i=studentService.addStudentCourse(studentCourse);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }

    //报名查重
    @RequestMapping(value = "findStudentCourse",method = RequestMethod.POST,consumes = "application/json")
    @ResponseBody
    public boolean findCourseId(@RequestBody StudentCourse studentCourse){
        Integer course_id=studentCourse.getCourse_id();
        Integer teacher_id=studentCourse.getTeacher_id();
        Integer student_id=studentCourse.getStudent_id();
        System.out.println(course_id+" "+student_id+" "+teacher_id);
        StudentCourse c=studentService.getStudentCourse(course_id,teacher_id,student_id);
        if(c==null){
            System.out.println("可以报名");
            return true;
        }else{
            System.out.println("亲，此课程已经报过名了，选择其他课程吧");
            return false;
        }
    }

}
