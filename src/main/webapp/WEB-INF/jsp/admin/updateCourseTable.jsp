<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>修改课表</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
        <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="form">

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>班级ID</label>
                        <div class="layui-input-inline">
                            <input type="text" id="class_id" value="${courseTable.class_id}" name="class_id" disabled="disabled" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>班级名称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="class_name" value="${courseTable.cla.class_name}" name="class_name" disabled="disabled" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>课程ID</label>
                        <div class="layui-input-inline">
                            <input type="text" id="course_id" value="${courseTable.course_id}" name="course_id" disabled="disabled" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>课程名称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="name2" value="${courseTable.course.name2}" name="name2" disabled="disabled" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>教师ID</label>
                        <div class="layui-input-inline">
                            <input type="text" id="user_id" value="${courseTable.user_id}" name="user_id" disabled="disabled" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>教师姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="name" value="${courseTable.user.name}" name="name" disabled="disabled" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>星期</label>
                        <div class="layui-input-inline">
                            <select name="week">
                                <c:choose>
                                <c:when test="${courseTable.week==1}">
                                    <option value="1" selected="selected">星期一</option>
                                    <option value="2">星期二</option>
                                    <option value="3">星期三</option>
                                    <option value="4">星期四</option>
                                    <option value="5">星期五</option>
                                </c:when>
                                <c:when test="${courseTable.week==2}">
                                    <option value="1">星期一</option>
                                    <option value="2"  selected="selected">星期二</option>
                                    <option value="3">星期三</option>
                                    <option value="4">星期四</option>
                                    <option value="5">星期五</option>
                                </c:when>
                                <c:when test="${courseTable.week==3}">
                                    <option value="1">星期一</option>
                                    <option value="2">星期二</option>
                                    <option value="3"  selected="selected">星期三</option>
                                    <option value="4">星期四</option>
                                    <option value="5">星期五</option>
                                </c:when>
                                <c:when test="${courseTable.week==4}">
                                    <option value="1">星期一</option>
                                    <option value="2">星期二</option>
                                    <option value="3">星期三</option>
                                    <option value="4"  selected="selected">星期四</option>
                                    <option value="5">星期五</option>
                                </c:when>
                                <c:when test="${courseTable.week==5}">
                                    <option value="1">星期一</option>
                                    <option value="2">星期二</option>
                                    <option value="3">星期三</option>
                                    <option value="4">星期四</option>
                                    <option value="5" selected="selected">星期五</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="1">星期一</option>
                                    <option value="2">星期二</option>
                                    <option value="3">星期三</option>
                                    <option value="4">星期四</option>
                                    <option value="5">星期五</option>
                                </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>节次</label>
                        <div class="layui-input-inline">
                            <select name="jieci">
                                <c:choose>
                                <c:when test="${courseTable.jieci==1}">
                                    <option value="1" selected="selected">1-2节</option>
                                    <option value="2">3-4节</option>
                                    <option value="3">5-6节</option>
                                    <option value="4">7-8节</option>
                                    <option value="5">9-10节</option>
                                </c:when>
                                <c:when test="${courseTable.jieci==2}">
                                    <option value="1">1-2节</option>
                                    <option value="2" selected="selected">3-4节</option>
                                    <option value="3">5-6节</option>
                                    <option value="4">7-8节</option>
                                    <option value="5">9-10节</option>
                                </c:when>
                                <c:when test="${courseTable.jieci==3}">
                                    <option value="1">1-2节</option>
                                    <option value="2">3-4节</option>
                                    <option value="3" selected="selected">5-6节</option>
                                    <option value="4">7-8节</option>
                                    <option value="5">9-10节</option>
                                </c:when>
                                <c:when test="${courseTable.jieci==4}">
                                    <option value="1">1-2节</option>
                                    <option value="2">3-4节</option>
                                    <option value="3">5-6节</option>
                                    <option value="4" selected="selected">7-8节</option>
                                    <option value="5">9-10节</option>
                                </c:when>
                                <c:when test="${courseTable.jieci==5}">
                                    <option value="1">1-2节</option>
                                    <option value="2">3-4节</option>
                                    <option value="3">5-6节</option>
                                    <option value="4">7-8节</option>
                                    <option value="5" selected="selected">9-10节</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="1">1-2节</option>
                                    <option value="2">3-4节</option>
                                    <option value="3">5-6节</option>
                                    <option value="4">7-8节</option>
                                    <option value="5">9-10节</option>
                                </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>上课教室</label>
                        <div class="layui-input-inline">
                            <select name="address">
                                <c:choose>
                                    <c:when test="${courseTable.address==101}">
                                        <option value="101" selected="selected">六教101</option>
                                        <option value="102">六教102</option>
                                        <option value="103">六教103</option>
                                    </c:when>
                                    <c:when test="${courseTable.address==102}">
                                        <option value="101">六教101</option>
                                        <option value="102" selected="selected">六教102</option>
                                        <option value="103">六教103</option>
                                    </c:when>
                                    <c:when test="${courseTable.address==103}">
                                        <option value="101">六教101</option>
                                        <option value="102">六教102</option>
                                        <option value="103" selected="selected">六教103</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="101">六教101</option>
                                        <option value="102">六教102</option>
                                        <option value="103">六教103</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>班级</label>
                        <div class="layui-input-inline">
                            <select name="class_id">
                                <c:choose>
                                    <c:when test="${courseTable.class_id==1}">
                                        <option value="1" selected="selected">一班</option>
                                        <option value="2">二班</option>
                                        <option value="3">三班</option>
                                    </c:when>
                                    <c:when test="${courseTable.class_id==2}">
                                        <option value="1">一班</option>
                                        <option value="2" selected="selected">二班</option>
                                        <option value="3">三班</option>
                                    </c:when>
                                    <c:when test="${courseTable.class_id==3}">
                                        <option value="1">一班</option>
                                        <option value="2">二班</option>
                                        <option value="3" selected="selected">三班</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="1">一班</option>
                                        <option value="2">二班</option>
                                        <option value="3">三班</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>
                    <input type="hidden" name="id" value="${courseTable.id}">
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" type="button" lay-filter="add" lay-submit="" >修改</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            var isTrue=false;
            layui.use(['form', 'layer','jquery'],
                function() {
                    $ = layui.jquery;
                    var form = layui.form,
                        //自定义验证规则
                        //监听提交
                        url= "${pageContext.request.contextPath}/admin/updateCourseTableSubmit";
                    form.on('submit(add)',function(sub){
                        var param = $("#form").serialize();
                        $.post(url,param,function(data){
                            if(data.flag==1){
                                layer.alert('修改成功',{
                                        icon:6
                                    },
                                    function(){
                                        xadmin.close();//关闭当前frame
                                        xadmin.father_reload();//刷新父窗口
                                    });
                            }else{
                                layer.alert("修改失败",{
                                        icon:5
                                    },
                                    function(){
                                        xadmin.close();//关闭当前frame
                                        xadmin.father_reload();//刷新父窗口
                                    });
                            }

                        });

                    })
                });
        </script>
    </body>
</html>