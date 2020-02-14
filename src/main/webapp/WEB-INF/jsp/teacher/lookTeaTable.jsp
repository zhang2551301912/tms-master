<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>查看课表</title>
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
              <cite>查看课表</cite>
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
<%--                            <th>--%>
<%--                                <input type="checkbox" lay-filter="checkall" name="id" lay-skin="primary">--%>
<%--                            </th>--%>
                            <th>ID</th>
                            <th>班级ID</th>
                            <th>班级名</th>
                            <th>课程ID</th>
                            <th>课程名</th>
                            <th>教师ID</th>
                            <th>教师姓名</th>
                            <th>星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期</th>
                            <th>节次</th>
                            <th>上课教室</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${courseTable}" var="ct">
                            <tr>
<%--                                <td><input type="checkbox" value="${ct.id}" lay-filter="check" name="id" lay-skin="primary"></td>--%>
                                <td>${ct.id}</td>
                                <td>${ct.class_id}</td>
                                <td>${ct.cla.class_name}</td>
                                <td>${ct.course_id}</td>
                                <td>${ct.course.name2}</td>
                                <td>${ct.user_id}</td>
                                <td>${ct.user.name}</td>
                                <td>${ct.wk.w_name}</td>
                                <td>${ct.jie.j_name}</td>
                                <td>${ct.addr.addr_name}</td>
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
    layui.use('form', function(){
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