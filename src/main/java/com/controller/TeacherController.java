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
    public ModelAndView lookTable(){
        List<CourseTable> courseTable=adminService.getCourseTable();
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
    //查看留言回复
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
    //添加留言
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
    //删除学生班级
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
        List<User> stu_class=adminService.getClassStudent();
        for(User u:stu_class){
            System.out.println(u.getUser_id()+" "+u.getName()+" "+u.getCla().getClass_id()+" "+u.getCla().getClass_name());
        }
        ModelAndView mv =new ModelAndView("teacher/lookStudentClass2");
        mv.addObject("stu_class",stu_class);
        return mv;
    }
    //编辑状态
    @RequestMapping(value = "updateStatus")
    @ResponseBody
    public ResultMsg updateStatus(Integer user_id,String status){
        System.out.println(user_id+" "+status);
        User user=new User();
        user.setUser_id(user_id);
        user.setStatus(status);
        ResultMsg rs=null;
        int i=adminService.updateStatus(user);
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "修改成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "修改失败");
        }
        return rs;
    }
    //添加学生信息页面
    @RequestMapping("/addStudentClass2")
    public ModelAndView addStudentClass() {
        List<Cla> cla=adminService.getCla();
        ModelAndView mv=new ModelAndView("teacher/addStudentClass2");
        mv.addObject("cla",cla);
        return mv;
    }
    //添加学生信息
    @RequestMapping("addStudentClassSubmit")
    @ResponseBody
    public ResultMsg addStudentClassSubmit(Integer user_id,String name,String pwd,String phone_no,Integer class_id) {
        User user=new User();
        user.setUser_id(user_id);
        user.setName(name);
        user.setPwd(pwd);
        user.setPhone_no(phone_no);
        user.setClass_id(class_id);
        int i=adminService.addStudent(user);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //修改学生信息页面
    @RequestMapping("updateStudentClass2")
    public ModelAndView updateStudentClass(Integer id) {
        System.out.println(id);
        List<User> stu_classes=adminService.getClassStudent();
        User stu_class=null;
        for(User u:stu_classes){
            if(u.getId()==id){
                stu_class=u;
            }
        }
        ModelAndView mv=new ModelAndView("teacher/updateStudentClass2");
        mv.addObject("stu_class",stu_class);
        return mv;
    }
    //修改学生信息
    @RequestMapping(value = "updateStudentClassSubmit")
    @ResponseBody
    public ResultMsg updateStudentClassSubmit(Integer id, String pwd,String phone_no,Integer class_id){
        User user=new User();
        user.setId(id);
        user.setPwd(pwd);
        user.setPhone_no(phone_no);
        user.setClass_id(class_id);
        ResultMsg rs=null;
        int i=adminService.updateStudentClass(user);
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "修改成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "修改失败");
        }
        return rs;
    }
    //删除学生班级
    @RequestMapping("deleteStudentClass")
    @ResponseBody
    public ResultMsg deleteStudentClass(Integer id) {
        int i=adminService.deleteStudentClass(id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除学生班级
    @RequestMapping(value = "batchDeleteStudentClass")
    @ResponseBody
    public ResultMsg batchDeleteStudentClass(Integer[] ids){
        System.out.println(ids);
        boolean isDelete=false;
        for(int id:ids) {
            int i=adminService.deleteStudentClass(id);
            if(i>0) {
                isDelete=true;
            }else {
                isDelete=false;
            }
        }
        ResultMsg rs=null;
        if(isDelete) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
}
