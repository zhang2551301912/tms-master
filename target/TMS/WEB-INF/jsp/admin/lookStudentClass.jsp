<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>返班审核</title>
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
            <a href="">返班管理</a>
            <a>
              <cite>返班审核</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>学生账号</th>
                            <th>课程ID</th>
                            <th>课程名称</th>
                            <th>教师编号</th>
                            <th>教师姓名</th>
                            <th>审核确认</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${studentCourse}" var="studentCourse">
                            <tr>
                                <td>${studentCourse.id}</td>
                                <td>${studentCourse.student_id}</td>
                                <td>${studentCourse.course_id}</td>
                                <td>${studentCourse.course.name2}</td>
                                <td>${studentCourse.teacher_id}</td>
                                <td>${studentCourse.user.name}</td>
                                <td><input id="${studentCourse.id}" value="${studentCourse.id}" type="checkbox" name="status" lay-skin="switch" lay-filter="status"${studentCourse.status=='2' ? 'checked' : '1'} lay-text="确认|取消"></td>
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

        form.on('switch(status)', function (data) {
            var swithcData = data;
            var id = data.value;// 获取要修改的ID
            var status = this.checked ? '2' : '1';// 当前状态值
            $.ajax({
                type:"Post",
                url: "${pageContext.request.contextPath}/teacher/updateStudentCourseStatus",
                data: {
                    "id": id,
                    "status": status
                },
                error: function (data) {
                    console.log(data);
                    layer.msg(data);
                    layer.msg('数据异常，操作失败！');
                },
                // 修改失败，请填写对应的参数
                success: function (data) {
                    if (data.data) {
                        layer.msg('操作成功！');
                    } else {
                        layer.msg(data.msg);
                        var em = $(swithcData.othis[1]);
                        swithcData.othis[1].classList.remove('layui-form-onswitch');
                        em.children('em').text('OFF');
                    }
                }
            });
        });
    });

</script>
</html>