<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>修改课程</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="form">
                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>课程编号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="course_id" value="${course.course_id}" name="course_id" disabled="disabled" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>课程</label>
                        <div class="layui-input-inline">
                            <input type="text" id="name" value="${course.name}" name="name" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>价格</label>
                        <div class="layui-input-inline">
                            <input type="text" id="price" value="${course.price}" name="price" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>单位</label>
                        <div class="layui-input-inline">
                            <input type="text" id="unit" value="${course.unit}" name="unit" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>序号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="sort" value="${course.sort}" name="sort" required="" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <input type="hidden" name="id" value="${course.id}">
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
                        url= "${pageContext.request.contextPath}/admin/updateCourseSubmit";
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