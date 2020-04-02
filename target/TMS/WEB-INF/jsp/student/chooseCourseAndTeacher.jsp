<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>学生选课报名</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
</head>
<body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">选课报名</a>
            <a>
              <cite>查看记录</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <button class="layui-btn" onclick="xadmin.open('选课报名','addStudentCourse',600,400)"><i class="layui-icon"></i>选课报名</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>学生账号</th>
                                    <th>课程ID</th>
                                    <th>课程名称</th>
                                    <th>教师ID</th>
                                    <th>教师名称</th>
                                    <th>报名审核状态</th>
                                  </tr>
                                </thead>
                                <tbody>
                     				<c:forEach items="${studentCourse}" var="studentCourse">
                     					<tr>
                                            <td>${studentCourse.student_id}</td>
	                     					<td>${studentCourse.course_id}</td>
                                            <td>${studentCourse.course.name2}</td>
                                            <td>${studentCourse.teacher_id}</td>
                                            <td>${studentCourse.user.name}</td>
                                            <td><input id="${studentCourse.id}" value="${studentCourse.id}" disabled="disabled" type="checkbox" name="status" lay-skin="switch" lay-filter="status"${studentCourse.status=='2' ? 'checked' : '0'} lay-text="报名成功|审核中..."></td>
                                    	</tr>
                     				</c:forEach>	                                                                                     
                                </tbody>
                            </table>
                        </div>
                      
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
      layui.use(['laydate','form'], function(){
        var  form = layui.form;
          // 监听全选
          form.on('checkbox(checkall)', function(data){
              if(data.elem.checked){
                  $('tbody input').prop('checked',true);
              }else{
                  $('tbody input').prop('checked',false);
              }
              form.render('checkbox');
          });

      });

    </script>
</html>