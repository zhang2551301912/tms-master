package com.controller;

import com.service.AdminService;
import com.service.LoginService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.po.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    LoginService loginService;

    @Autowired
    AdminService adminService;

    //欢迎页面
    @RequestMapping("welcome")
    public ModelAndView welcome() {
        ModelAndView mv=new ModelAndView("welcome");
        return mv;
    }
    //菜单主页
    @RequestMapping("index")
    public ModelAndView index(){
        List<MenuRole> menuRole=loginService.getAdminByMenuAndRole();
        ModelAndView mv=new ModelAndView("index");
        List<Menu> menu=adminService.getMenu();
        mv.addObject("menuRole",menuRole);
        mv.addObject("menu",menu);
        System.out.println(mv);
        return mv;
    }
    //查看教师
    @RequestMapping(value = "lookTeacher")
    public ModelAndView lookTeacher() {
        List<User> teachers=adminService.getTeacher();
        ModelAndView mv=new ModelAndView("admin/lookTeacher");
        mv.addObject("teachers", teachers);
        return mv;
    }
    //查看家长
    @RequestMapping("lookParent")
    public ModelAndView lookParent() {
        List<User> parents=adminService.getParent();
        for(User u:parents) {
            System.out.println(u.getUser_id()+" "+u.getName());
        }
        ModelAndView mv=new ModelAndView("admin/lookParent");
        mv.addObject("parents", parents);
        return mv;
    }
    //查看学生
    @RequestMapping("lookStudent")
    public ModelAndView lookStudent() {
        List<User> students=adminService.getStudent();
        ModelAndView mv=new ModelAndView("admin/lookStudent");
        mv.addObject("students", students);
        return mv;
    }
    //添加用户页面
    @RequestMapping("addUser")
    public ModelAndView addUser() {
        List<Role> roles=adminService.getRole();
        ModelAndView mv=new ModelAndView("admin/addUser");
        mv.addObject("roles",roles);
        return mv;
    }
    @RequestMapping(value = "findUserId",method = RequestMethod.POST,consumes = "application/json")
    @ResponseBody
    public boolean findUserId(@RequestBody User user){
        Integer user_id=user.getUser_id();
        System.out.println(user_id);
        User u=adminService.getUserId(user_id);
        if(u==null){
            System.out.println("用户名可用");
            return true;
        }else{
            System.out.println("用户名已经存在，请使用其他用户名");
            return false;
        }
    }
    //添加用户
    @RequestMapping("addUserSubmit")
    @ResponseBody
    public ResultMsg addUserSubmit(Integer id,Integer user_id, String name,String pwd,String phone_no,Integer role_id,String status) {
        User u=new User();
        u.setId(id);
        u.setUser_id(user_id);
        u.setName(name);
        u.setPwd(pwd);
        u.setPhone_no(phone_no);
        u.setRole_id(role_id);
        u.setStatus(status);
        int i=adminService.addUserSubmit(u);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //更新教师页面
    @RequestMapping("/updateTeacher")
    public ModelAndView updateTeacher(Integer id) {
        List<User> users=adminService.getTeacher();
        User user=null;
        for(User u:users){
            if(u.getId()==id){
                user=u;
            }
        }
        ModelAndView mv=new ModelAndView("admin/updateTeacher");
        mv.addObject("user",user);
        return mv;
    }
    //更新家长页面
    @RequestMapping("/updateParent")
    public ModelAndView updateParent(Integer id) {
        List<User> users=adminService.getParent();
        User user=null;
        for(User u:users){
            if(u.getId()==id){
                user=u;
                System.out.println(user.getUser_id()+" "+user.getName());
            }
        }
        ModelAndView mv=new ModelAndView("admin/updateParent");
        mv.addObject("user",user);
        return mv;
    }
    //更新学生页面
    @RequestMapping("/updateStudent")
    public ModelAndView updateStudent(Integer id) {
        List<User> users=adminService.getStudent();
        User user=null;
        for(User u:users){
            if(u.getId()==id){
                user=u;
            }
        }
        ModelAndView mv=new ModelAndView("admin/updateStudent");
        mv.addObject("user",user);
        return mv;
    }
    //更新用户
    @RequestMapping(value="updateUserSubmit",method= RequestMethod.POST)
    @ResponseBody
    public ResultMsg updateUserSubmit(Integer id,String pwd,String phone_no,Integer role_id){
        User u=new User();
        u.setId(id);
        u.setPwd(pwd);
        u.setPhone_no(phone_no);
        u.setRole_id(role_id);
        System.out.println(pwd+" "+phone_no+" "+role_id);
        int i=adminService.updateUser(u);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除用户
    @RequestMapping(value = "deleteUser",method=RequestMethod.POST)
    @ResponseBody
    public ResultMsg deleteUser(Integer id) {
        int i=adminService.deleteUser(id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除用户
    @RequestMapping(value = "batchDeleteUser",method=RequestMethod.POST)
    @ResponseBody
    public ResultMsg batchDeleteUser(Integer[] ids) {
        boolean isDelete=false;
        for(int id:ids) {
            int i=adminService.deleteUser(id);
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
    //重置密码
    @RequestMapping(value="updatePwd")
    @ResponseBody
    public ResultMsg updatePwd(Integer id){
        System.out.println(id);
        ResultMsg rs=null;
        Integer i=adminService.updatePwd(id);
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "重置成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "重置失败");
        }
        return rs;
    }
    //查看菜单
    @RequestMapping("lookMenu")
    public ModelAndView lookMenu() {
        List<Menu> menus=adminService.getMenu();
        for(Menu m:menus) {
            System.out.println(m.getTitle()+" "+m.getP_id()+" "+m.getMenu_id());
        }
        ModelAndView mv=new ModelAndView("admin/lookMenu");
        mv.addObject("menu", menus);
        return mv;
    }
    //添加菜单页面
    @RequestMapping("addMenu")
    public ModelAndView addMenu() {
        List<Menu> m=adminService.getMenusParent();
        ModelAndView mv=new ModelAndView("admin/addMenu");
        mv.addObject("parent", m);
        return mv;
    }
    //添加菜单
    @RequestMapping("addMenuSubmit")
    @ResponseBody
    public ResultMsg addMenuSubmit(String title,String url,Integer grade,Integer p_id,Integer sort,String remark) {
        Menu menu=new Menu();
        menu.setTitle(title);
        menu.setUrl(url);
        menu.setGrade(grade);
        menu.setP_id(p_id);
        menu.setSort(sort);
        menu.setRemark(remark);
        int i=adminService.addMenuSubmit(menu);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除菜单
    @RequestMapping(value = "deleteMenu")
    @ResponseBody
    public ResultMsg deleteMenu(Integer menu_id) {
        int i=adminService.deleteMenu(menu_id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除菜单
    @RequestMapping(value = "batchDeleteMenu")
    @ResponseBody
    public ResultMsg batchDeleteMenu(Integer[] menu_ids) {
        boolean isDelete=false;
        for(int menu_id:menu_ids) {
            int i=adminService.deleteMenu(menu_id);
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
    //修改菜单页面
    @RequestMapping("updateMenu")
    public ModelAndView updateMenu(Integer menu_id) {
        System.out.println(menu_id);
        List<Menu> menus=adminService.getMenu();
        Menu menu=null;
        for(Menu m:menus) {
            if(m.getMenu_id()==menu_id){
                menu=m;
            }
        }
        List<Menu> p=adminService.getMenusParent();
        ModelAndView mv=new ModelAndView("admin/updateMenu");
        mv.addObject("menu", menu);
        mv.addObject("parent", p);
        return mv;
    }
    //修改菜单信息
    @RequestMapping("updateMenuSubmit")
    @ResponseBody
    public ResultMsg updateMenu(Integer menu_id,String title,String url,Integer grade,Integer p_id,Integer sort,String remark) {
        ResultMsg rs=null;
        Menu menu=new Menu();
        menu.setMenu_id(menu_id);
        menu.setTitle(title);
        menu.setUrl(url);
        menu.setGrade(grade);
        menu.setP_id(p_id);
        menu.setSort(sort);
        menu.setRemark(remark);
        System.out.println(title+" "+url);
        int i=adminService.updateMenu(menu);
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "修改成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "修改失败");
        }
        return rs;
    }
    //关联菜单页面
    @RequestMapping("lookRoleMenu")
    public ModelAndView lookRoleMenu() {
        List<MenuRole> adminMenu=loginService.getAdminByMenuAndRole();//管理员的菜单表
        List<MenuRole> teacherMenu=loginService.getTeacherByMenuAndRole();//教师的菜单表
        List<MenuRole> parentMenu=loginService.getParentByMenuAndRole();//家长的菜单表
        ModelAndView mv=new ModelAndView("admin/lookRoleMenu");
        mv.addObject("admin", adminMenu);
        mv.addObject("teacher", teacherMenu);
        mv.addObject("parent", parentMenu);
        return mv;
    }
    //添加关联菜单页面
    @RequestMapping("addRoleMenu")
    public ModelAndView addRoleMenu() {
        List<Role> roles=adminService.getRole();
        List<Menu> menus=adminService.getMenusParent();
        ModelAndView mv=new ModelAndView("admin/addRoleMenu");
        mv.addObject("roles", roles);
        mv.addObject("menus", menus);
        return mv;
    }
    //添加角色菜单到数据库
    @RequestMapping("addRoleMenuSubmit")
    @ResponseBody
    public ResultMsg addRoleMenuSubmit(Integer role_id,Integer menu_id) {
        MenuRole rm=new MenuRole();
        rm.setRole_id(role_id);
        rm.setMenu_id(menu_id);
        int i=adminService.addRoleMenu(rm);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
       }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
       }
        return rs;
    }
    //删除角色菜单
    @RequestMapping("deleteRoleMenu")
    @ResponseBody
    public ResultMsg delRoleMenu(Integer mr_id) {
        int i=adminService.deleteRoleMenu(mr_id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //查看角色页面
    @RequestMapping("/lookRole")
    public ModelAndView lookRoles() {
        List<Role> roles=adminService.getRole();
        ModelAndView mv=new ModelAndView("admin/lookRole");
        mv.addObject("roles", roles);
        return mv;
    }
    //添加角色页面
    @RequestMapping("/addRole")
    public ModelAndView addRole() {
        ModelAndView mv=new ModelAndView("admin/addRole");
        return mv;
    }
    //添加角色
    @RequestMapping("addRoleSubmit")
    @ResponseBody
    public ResultMsg addRoleSubmit(Integer role_id,String name) {
        Role role=new Role();
        role.setRole_id(role_id);
        role.setName(name);
        int i=adminService.addRoleSubmit(role);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除角色
    @RequestMapping("deleteRole")
    @ResponseBody
    public ResultMsg delRole(Integer role_id) {
        int i=adminService.deleteRole(role_id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除角色
    @RequestMapping(value = "batchDeleteRole")
    @ResponseBody
    public ResultMsg batchDeleteRole(Integer[] role_ids) {
        System.out.println(role_ids);
        boolean isDelete=false;
        for(int role_id:role_ids) {
            int i=adminService.deleteRole(role_id);
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
    //更新角色名页面
    @RequestMapping("updateRole")
    public ModelAndView updateRole(Integer role_id) {
        System.out.println(role_id);
        List<Role> roles=adminService.getRole();
        Role role=null;
        for(Role r:roles){
            if(r.getRole_id()==role_id){
                role=r;
            }
        }
        ModelAndView mv=new ModelAndView("admin/updateRole");
        mv.addObject("role", role);
        return mv;
    }
    //修改菜单信息
    @RequestMapping("updateRoleSubmit")
    @ResponseBody
    public ResultMsg updateMenu(Integer role_id,String name) {
        ResultMsg rs=null;
        Role role=new Role();
        role.setRole_id(role_id);
        role.setName(name);
        int i=adminService.updateRole(role);
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "修改成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "修改失败");
        }
        return rs;
    }
    //查看课程
    @RequestMapping("lookCourse")
    public ModelAndView lookCourse() {
        List<Course> course=adminService.getCourse();
        for(Course c:course) {
            System.out.println(c.getCourse_id()+" "+c.getName2()+" "+c.getPrice()+""+c.getUnit());
        }
        ModelAndView mv=new ModelAndView("admin/lookCourse");
        mv.addObject("course", course);
        return mv;
    }
    //添加课程页面
    @RequestMapping("/addCourse")
    public ModelAndView addCourse() {
        ModelAndView mv=new ModelAndView("admin/addCourse");
        return mv;
    }
    //添加课程
    @RequestMapping(value = "findCourseId",method = RequestMethod.POST,consumes = "application/json")
    @ResponseBody
    public boolean findCourseId(@RequestBody Course course){
        Integer course_id=course.getCourse_id();
        System.out.println(course_id);
        Course c=adminService.getCourseID(course_id);
        if(c==null){
            System.out.println("课程编号可用");
            return true;
        }else{
            System.out.println("课程编号已经存在，请使用其他编号");
            return false;
        }
    }
    //添加课程
    @RequestMapping("addCourseSubmit")
    @ResponseBody
    public ResultMsg addCourseSubmit(Integer id,Integer course_id, String name2, BigDecimal price,String unit,String url,Integer sort) {
        Course course=new Course();
        course.setId(id);
        course.setCourse_id(course_id);
        course.setName2(name2);
        course.setPrice(price);
        course.setUnit(unit);
        course.setUrl(url);
        course.setSort(sort);
        int i=adminService.addCourse(course);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除课程
    @RequestMapping("deleteCourse")
    @ResponseBody
    public ResultMsg deleteCourse(Integer id) {
        int i=adminService.deleteCourse(id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除角色
    @RequestMapping(value = "batchDeleteCourse")
    @ResponseBody
    public ResultMsg batchDeleteCourse(Integer[] ids) {
        System.out.println(ids);
        boolean isDelete=false;
        for(int id:ids) {
            int i=adminService.deleteCourse(id);
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
    //修改课程页面
    @RequestMapping(value = "updateCourse")
    public ModelAndView updateCourse(Integer id) {
        List<Course> courses=adminService.getCourse();
        Course course=null;
        for(Course c:courses){
            if(c.getId()==id) {
                course = c;
            }
        }
        ModelAndView mv=new ModelAndView("admin/updateCourse");
        mv.addObject("course", course);
        return mv;
    }
    //修改课程地址
    @RequestMapping(value = "updateCourseSubmit")
    @ResponseBody
    public ResultMsg updateSubjectSectionSubmit(Integer id,Integer user_id,String name2, BigDecimal price,String unit,Integer sort){
//            System.out.println(id+"  ");
//            //上传到服务器
//            //1.获取文件所在的物理路径（项目服务器的物理地址/upload/文件）
//            String realPath=request.getServletContext().getRealPath("/");
//            System.out.println(realPath);
//            String filename=file.getOriginalFilename();//文件名+后缀
//            System.out.println(filename);
//            String path=realPath+"/upload/"+filename;
//            System.out.println(path);
//            //通过给定路径来创建一个File实例
//            File file1=new File(path);
//            //将上传的文件传输到File中
//            if(file1.getParentFile().exists()) {
//                file1.getParentFile().mkdirs();
//            }
//            file.transferTo(file1);
//            System.out.println(file1);
            Course course=new Course();
            course.setId(id);
            course.setUser_id(user_id);
            course.setName2(name2);
            course.setPrice(price);
            course.setUnit(unit);
            course.setSort(sort);
            ResultMsg rs=null;
            int i=adminService.updateCourse(course);
            if(i>0) {
                rs=new ResultMsg(Flag.SUCCESS, "修改成功");
            }else {
                rs=new ResultMsg(Flag.FAIL, "修改失败");
            }
            return rs;
    }
    //查看绩效页面
    @RequestMapping("lookAchievement")
    public ModelAndView lookAchievement(){
        List<Achievement> achievement=adminService.getAchievement();
        ModelAndView mv =new ModelAndView("admin/lookAchievement");
        mv.addObject("achievement",achievement);
        return mv;
    }
    //添加绩效页面
    @RequestMapping("/addAchievement")
    public ModelAndView addAchievement() {
        List<User> teacher=adminService.getTeacher();
        ModelAndView mv=new ModelAndView("admin/addAchievement");
        mv.addObject("teacher",teacher);
        return mv;
    }
    //添加绩效
    @RequestMapping("addAchievementSubmit")
    @ResponseBody
    public ResultMsg addAchievementSubmit(Integer achi_id,String achi_content,String achi_grade,Integer user_id) {
        Achievement achievement=new Achievement();
        achievement.setAchi_id(achi_id);
        achievement.setAchi_content(achi_content);
        achievement.setAchi_grade(achi_grade);
        achievement.setUser_id(user_id);
        int i=adminService.addAchievement(achievement);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除绩效
    @RequestMapping("deleteAchievement")
    @ResponseBody
    public ResultMsg deleteAchievement(Integer achi_id) {
        int i=adminService.deleteAchievement(achi_id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除绩效
    @RequestMapping(value = "batchDeleteAchievement")
    @ResponseBody
    public ResultMsg batchDeleteAchievement(Integer[] achi_ids) {
        System.out.println(achi_ids);
        boolean isDelete=false;
        for(int achi_id:achi_ids) {
            int i=adminService.deleteAchievement(achi_id);
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
    //修改绩效页面
    @RequestMapping(value = "updateAchievement")
    public ModelAndView updateAchievement(Integer achi_id) {
        List<Achievement> achievements=adminService.getAchievement();
        Achievement achievement=null;
        for(Achievement a:achievements){
            if(a.getAchi_id()==achi_id){
                achievement=a;
            }
        }
        ModelAndView mv=new ModelAndView("admin/updateAchievement");
        mv.addObject("achievement", achievement);
        return mv;
    }
    //修改绩效
    @RequestMapping(value = "updateAchievementSubmit")
    @ResponseBody
    public ResultMsg updateAchievementSubmit(Integer achi_id, String achi_content,String achi_grade){
        Achievement a=new Achievement();
        a.setAchi_id(achi_id);
        a.setAchi_content(achi_content);
        a.setAchi_grade(achi_grade);
        ResultMsg rs=null;
        int i=adminService.updateAchievement(a);
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "修改成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "修改失败");
        }
        return rs;
    }
    //查看出勤及分数
    @RequestMapping("lookAttendScore")
    public ModelAndView lookAttendScore() {
        List<Attendance> attendance=adminService.getAttendance();
        for(Attendance a:attendance) {
            System.out.println(a.getAtten_id()+" "+a.getAtten_times()+a.getAtten_unit()+""+a.getUser_id());
        }
        ModelAndView mv=new ModelAndView("admin/lookAttendScore");
        mv.addObject("attendance", attendance);
        return mv;
    }
    //添加出勤及分数页面
    @RequestMapping("/addAttendScore")
    public ModelAndView addAttendScore() {
        List<User> teacher=adminService.getTeacher();
        ModelAndView mv=new ModelAndView("admin/addAttendScore");
        mv.addObject("teacher",teacher);
        return mv;
    }
    //添加出勤及分数
    @RequestMapping("addAttendScoreSubmit")
    @ResponseBody
    public ResultMsg addAttendScoreSubmit(Integer atten_id,Integer atten_times,String atten_unit,Integer user_id,Double score) {
        Attendance attendance=new Attendance();
        attendance.setAtten_id(atten_id);
        attendance.setAtten_times(atten_times);
        attendance.setAtten_unit(atten_unit);
        attendance.setUser_id(user_id);
        attendance.setScore(score);
        int i=adminService.addAttendance(attendance);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除出勤及分数
    @RequestMapping("deleteAttendScore")
    @ResponseBody
    public ResultMsg deleteAttendScore(Integer atten_id) {
        int i=adminService.deleteAttendance(atten_id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除出勤及分数
    @RequestMapping(value = "batchDeleteAttendScore")
    @ResponseBody
    public ResultMsg batchDeleteAttendScore(Integer[] atten_ids) {
        System.out.println(atten_ids);
        boolean isDelete=false;
        for(int atten_id:atten_ids) {
            int i=adminService.deleteAttendance(atten_id);
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
    //修改出勤页面
    @RequestMapping("updateAttend")
    public ModelAndView updateAttdendScore(Integer atten_id) {
        List<Attendance> attendances=adminService.getAttendance();
        Attendance attendance=null;
        for(Attendance a:attendances){
            if(a.getAtten_id()==atten_id){
                attendance=a;
            }
        }
        ModelAndView mv=new ModelAndView("admin/updateAttend");
        mv.addObject("attendance", attendance);
        return mv;
    }
    //修改出勤
    @RequestMapping(value = "updateAttendSubmit")
    @ResponseBody
    public ResultMsg updateAttendSubmit(Integer atten_id, Integer atten_times,Double score){
        Attendance attendance=new Attendance();
        attendance.setAtten_id(atten_id);
        attendance.setAtten_times(atten_times);
        attendance.setScore(score);
        ResultMsg rs=null;
        int i=adminService.updateAttendance(attendance);
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "修改成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "修改失败");
        }
        return rs;
    }
    //查看出勤及分数
    @RequestMapping("lookAttendDetail")
    public ModelAndView lookAttendDetail() {
        List<AttendanceDetail> attendanceDetail=adminService.getAttendanceDetail();
        for(AttendanceDetail a:attendanceDetail) {
            System.out.println(a.getDetail_id()+" "+a.getStart_date()+a.getEnd_date()+" "+a.getUser_id());
        }
        ModelAndView mv=new ModelAndView("admin/lookAttendDetail");
        mv.addObject("attendanceDetail", attendanceDetail);
        return mv;
    }
    //添加出勤明细页面
    @RequestMapping("/addAttendDetail")
    public ModelAndView addAttendDetail() {
        List<User> teacher=adminService.getTeacher();
        ModelAndView mv=new ModelAndView("admin/addAttendDetail");
        mv.addObject("teacher",teacher);
        return mv;
    }
    //添加出勤明细
    @RequestMapping("addAttendDetailSubmit")
    @ResponseBody
    public ResultMsg addAttendDetailSubmit(Integer detail_id, Timestamp start_date, Timestamp end_date, Integer user_id) {
        AttendanceDetail ad=new AttendanceDetail();
        ad.setDetail_id(detail_id);
        ad.setStart_Date(start_date);
        ad.setEnd_date(end_date);
        ad.setUser_id(user_id);
        int i=adminService.addAttendanceDetail(ad);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除出勤明细
    @RequestMapping("deleteAttendDetail")
    @ResponseBody
    public ResultMsg deleteAttendDetail(Integer detail_id) {
        int i=adminService.deleteAttendanceDetail(detail_id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除出勤明细
    @RequestMapping(value = "batchDeleteAttendDetail")
    @ResponseBody
    public ResultMsg batchDeleteAttendDetail(Integer[] detail_ids) {
        System.out.println(detail_ids);
        boolean isDelete=false;
        for(int detail_id:detail_ids) {
            int i=adminService.deleteAttendanceDetail(detail_id);
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
    //查看学生班级页面
    @RequestMapping("lookStudentClass")
    public ModelAndView lookStudentClass(){
        List<User> stu_class=adminService.getClassStudent();
        for(User u:stu_class){
            System.out.println(u.getUser_id()+" "+u.getName()+" "+u.getCla().getClass_id()+" "+u.getCla().getClass_name());
        }
        ModelAndView mv =new ModelAndView("admin/lookStudentClass");
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
    @RequestMapping("/addStudentClass")
    public ModelAndView addStudentClass() {
        List<Cla> cla=adminService.getCla();
        ModelAndView mv=new ModelAndView("admin/addStudentClass");
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
    @RequestMapping("updateStudentClass")
    public ModelAndView updateStudentClass(Integer id) {
        System.out.println(id);
        List<User> stu_classes=adminService.getClassStudent();
        User stu_class=null;
        for(User u:stu_classes){
            if(u.getId()==id){
                stu_class=u;
            }
        }
        ModelAndView mv=new ModelAndView("admin/updateStudentClass");
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
    //课程教师
    @RequestMapping(value = "lookCourseTeacher")
    public ModelAndView lookCourseTeacher() {
        List<CourseUser> courseUsers=adminService.getCourseTeacher();
        ModelAndView mv=new ModelAndView("admin/lookCourseTeacher");
        mv.addObject("courseUsers", courseUsers);
        return mv;
    }
    //添加课程教师页面
    @RequestMapping("/addCourseTeacher")
    public ModelAndView addCourseTeacher() {
        List<Course> course=adminService.getCourse();
        List<User> tea=adminService.getTeacher();
        ModelAndView mv=new ModelAndView("admin/addCourseTeacher");
        mv.addObject("course",course);
        mv.addObject("tea",tea);
        return mv;
    }
    //添加课程教师信息
    @RequestMapping("addCourseTeacherSubmit")
    @ResponseBody
    public ResultMsg addCourseTeacherSubmit(Integer cu_id,Integer user_id,Integer course_id) {
        CourseUser courseUser=new CourseUser();
        courseUser.setCu_id(cu_id);
        courseUser.setUser_id(user_id);
        courseUser.setCourse_id(course_id);
        int i=adminService.addCourseTeacher(courseUser);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除学生班级
    @RequestMapping("deleteCourseTea")
    @ResponseBody
    public ResultMsg deleteCourseTea(Integer cu_id) {
        int i=adminService.deleteCourseTea(cu_id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除学生班级
    @RequestMapping(value = "batchDeleteCourseTea")
    @ResponseBody
    public ResultMsg batchDeleteCourseTea(Integer[] cu_ids){
        System.out.println(cu_ids);
        boolean isDelete=false;
        for(int cu_id:cu_ids) {
            int i=adminService.deleteCourseTea(cu_id);
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
    //查看留言
    @RequestMapping("lookMessage")
    public ModelAndView LookMessage(){
        List<Message> messages=adminService.getMsg();
        ModelAndView mv=new ModelAndView("admin/lookMessage");
        mv.addObject("message",messages);
        return mv;
    }
    //添加留言页面
    @RequestMapping("/addMsg")
    public ModelAndView addMsg() {
        List<User> parent=adminService.getParent();
        List<User> teacher=adminService.getTeacher();
        ModelAndView mv=new ModelAndView("admin/addMsg");
        mv.addObject("parent",parent);
        mv.addObject("teacher",teacher);
        return mv;
    }
    //添加留言
    @RequestMapping("addMsgSubmit")
    @ResponseBody
    public ResultMsg addMsgSubmit(Integer msg_id,String msg_content,Integer parent_id,Integer teacher_id) {
        Message m=new Message();
        m.setMsg_id(msg_id);
        m.setMsg_content(msg_content);
        m.setParent_id(parent_id);
        m.setTeacher_id(teacher_id);
        int i=adminService.addMsg(m);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "添加成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "添加失败");
        }
        return rs;
    }
    //删除留言
    @RequestMapping("deleteMsg")
    @ResponseBody
    public ResultMsg deleteMsg(Integer msg_id) {
        int i=adminService.deleteMsg(msg_id);
        ResultMsg rs=null;
        if(i>0) {
            rs=new ResultMsg(Flag.SUCCESS, "删除成功");
        }else {
            rs=new ResultMsg(Flag.FAIL, "删除失败");
        }
        return rs;
    }
    //批量删除留言
    @RequestMapping(value = "batchDeleteMsg")
    @ResponseBody
    public ResultMsg batchDeleteMsg(Integer[] msg_ids){
        System.out.println(msg_ids);
        boolean isDelete=false;
        for(int msg_id:msg_ids) {
            int i=adminService.deleteMsg(msg_id);
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
