package com.controller;

import com.po.*;
import com.service.AdminService;
import com.service.LoginService;
import com.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("teacher")
public class TeacherController {
    @Autowired
    LoginService loginService;

    @Autowired
    AdminService adminService;
    @Autowired
    TeacherService teacherService;

    //菜单主页
    @RequestMapping("index")
    public ModelAndView index(){
        List<MenuRole> menuRole=loginService.getTeacherByMenuAndRole();
        ModelAndView mv=new ModelAndView("index");
        List<Menu> menu=adminService.getMenu();
        mv.addObject("menuRole",menuRole);
        mv.addObject("menu",menu);
        return mv;
    }
    //欢迎页面
    @RequestMapping("welcome")
    public ModelAndView welcome() {
        ModelAndView mv=new ModelAndView("welcome");
        return mv;
    }
    //查看课表
    @RequestMapping("lookTeaTable")
    public ModelAndView lookTable(HttpServletRequest request){
        HttpSession session=request.getSession();
        User u=(User)session.getAttribute("user");
        Integer currentUserId=u.getUser_id();
        System.out.println(currentUserId);
        List<CourseTable> courseTable=adminService.getCurrentCourseTable(currentUserId);
        ModelAndView mv=new ModelAndView("teacher/lookTeaTable");
        mv.addObject("courseTable",courseTable);
        return mv;
    }
    //查看课程
    @RequestMapping("lookCourseFee")
    public ModelAndView lookCourseFee() {
        List<Course> course=adminService.getCourse();
        for(Course c:course) {
            System.out.println(c.getCourse_id()+" "+c.getName2()+" "+c.getPrice()+""+c.getUnit());
        }
        ModelAndView mv=new ModelAndView("teacher/lookCourseFee");
        mv.addObject("course", course);
        return mv;
    }
    //查看出勤及分数
    @RequestMapping("lookTeaAttend")
    public ModelAndView lookTeaAttend() {
        List<Attendance> attendance=adminService.getAttendance();

        for(Attendance a:attendance) {
            System.out.println(a.getAtten_id()+" "+a.getAtten_times()+a.getAtten_unit()+""+a.getUser_id());
        }
        ModelAndView mv=new ModelAndView("teacher/lookTeaAttend");
        mv.addObject("attendance", attendance);
        return mv;
    }
    //查看出勤明细
    @RequestMapping("lookDetail")
    public ModelAndView lookAttendDetail() {
        List<AttendanceDetail> attendanceDetail=adminService.getAttendanceDetail();
        for(AttendanceDetail a:attendanceDetail) {
            System.out.println(a.getDetail_id()+" "+a.getStart_date()+a.getEnd_date()+" "+a.getUser_id());
        }
        ModelAndView mv=new ModelAndView("teacher/lookDetail");
        mv.addObject("attendanceDetail", attendanceDetail);
        return mv;
    }
    //查看绩效页面
    @RequestMapping("lookTeaAchieve")
    public ModelAndView lookAchievement(){
        List<Achievement> achievement=adminService.getAchievement();
        ModelAndView mv =new ModelAndView("teacher/lookTeaAchieve");
        mv.addObject("achievement",achievement);
        return mv;
    }
    //查看留言
    @RequestMapping("lookMsg")
    public ModelAndView LookMessage(){
        List<Message> messages=adminService.getMsg();
        ModelAndView mv=new ModelAndView("teacher/lookMsg");
        mv.addObject("message",messages);
        return mv;
    }
    //查看回复留言
    @RequestMapping("replyMsg")
    public ModelAndView replyMsg(){
        List<ReplyMsg> replyMsg=teacherService.getReplyMsg();
        ModelAndView mv=new ModelAndView("teacher/replyMsg");
        mv.addObject("replyMsg",replyMsg);
        return mv;
    }

    //回复留言页面
    @RequestMapping("/addReplyMsg")
    public ModelAndView addMsg() {
        List<User> teacher=adminService.getTeacher();
        List<Message> messages=adminService.getMsg();
        ModelAndView mv=new ModelAndView("teacher/addReplyMsg");
        mv.addObject("messages",messages);
        mv.addObject("teacher",teacher);
        return mv;
    }
    //回复留言
    @RequestMapping("addReplyMsgSubmit")
    @ResponseBody
    public ResultMsg addMsgSubmit(Integer repmsg_id,String repmsg_content,Integer msg_id,Integer teacher_id) {
        ReplyMsg r=new ReplyMsg();
        r.setRepmsg_id(repmsg_id);
        r.setRepmsg_content(repmsg_content);
        r.setMsg_id(msg_id);
        r.setTeacher_id(teacher_id);
        int i=teacherService.addReplyMsg(r);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除回复留言
    @RequestMapping("deleteReplyMsg")
    @ResponseBody
    public ResultMsg deleteReplyMsg(Integer repmsg_id) {
        int i=teacherService.deleteReplyMsg(repmsg_id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }

    //查看学生班级页面
    @RequestMapping("lookStudentClass2")
    public ModelAndView lookStudentClass(){
        List<StudentCourse> studentCourse=teacherService.getStudentCourseByStatus();
        ModelAndView mv =new ModelAndView("teacher/lookStudentClass2");
        mv.addObject("studentCourse",studentCourse);
        return mv;
    }

    //编辑状态
    @RequestMapping(value = "updateStudentCourseStatus")
    @ResponseBody
    public ResultMsg updateStudentCourseStatus(Integer id,String status){
        StudentCourse studentCourse=new StudentCourse();
        studentCourse.setId(id);
        studentCourse.setStatus(status);
        ResultMsg rs=null;
        int i=teacherService.updateStudentCourseStatus(studentCourse);
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "审核通过");
        }else {
            rs=new ResultMsg(Flag.FAIL, "审核失败");
        }
        return rs;
    }

}
