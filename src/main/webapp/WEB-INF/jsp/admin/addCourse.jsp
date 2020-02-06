<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.po.*,java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>添加课程</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="form">
                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>ID</label>
                        <div class="layui-input-inline">
                            <input type="text" id="course_id" name="course_id" required="" lay-verify="" autocomplete="off" class="layui-input"></div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>课程名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="name" name="name" required="" lay-verify="nikename" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>价格</label>
                        <div class="layui-input-inline">
                            <input type="text" id="price" name="price" required="" lay-verify="nikename" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>单位</label>
                        <div class="layui-input-inline">
                            <select name="unit">
                                <option value="元/节">元/节</option>
                                <option value="元/月">元/月</option>
                            </select>
                        </div>
                    </div>

                     <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>课程文件</label>
                        <div class="layui-input-inline">
                            <input type="text" id="url" name="url" required="" lay-verify="nikename" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>序号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="sort" name="sort" required="" lay-verify="nikename" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" type="button" lay-filter="add" lay-submit="" >增加</button></div>
                </form>
            </div>
        </div>
        <script>
        var isTrue=false;
        layui.use(['form', 'layer','jquery'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                //监听提交

               	url= "${pageContext.request.contextPath}/admin/addCourseSubmit";
               	form.on('submit(add)',function(sub){

               		var param = $("#form").serialize();
               		$.post(url,param,function(data){
               			if(data.flag==1){
               				layer.confirm('添加成功', {
               				  btn: ['继续','退出'] //按钮
               				}, function(){
               					window.location.reload();
               				}, function(){
               				  	xadmin.close();//关闭当前frame
               				  	xadmin.father_reload();//刷新父窗口
               				});

               			}else{
               				layer.alert("添加失败",{
           						icon:5
           					},
           					function(){
           						window.location.reload();
           					});
               			}

               		});

               	})
            });
        </script>
        <script>
        	var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
    </body>

</html>